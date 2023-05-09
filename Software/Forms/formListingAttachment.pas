unit formListingAttachment;

interface

uses
  Winapi.ShellAPI, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formDefaultListing, Data.DB, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Menus;

type
  TfrmListingAttachment = class(TfrmDefaultListing)
    qryAttachment: TFDQuery;
    dsAttachment: TDataSource;
    qryAttachmentID_ATTACHMENT: TIntegerField;
    qryAttachmentTABLE_NAME: TStringField;
    qryAttachmentTABLE_ID: TIntegerField;
    qryAttachmentATTACHMENT: TBlobField;
    qryAttachmentATTACHMENT_NAME: TStringField;
    openAttachment: TOpenDialog;
    popActionRecordGrid: TPopupMenu;
    popRecordGridDelete: TMenuItem;
    popRecordGridDonwload: TMenuItem;
    saveAttachment: TSaveDialog;
    qryAttachmentASSIGNED: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure qryAttachmentNewRecord(DataSet: TDataSet);
    procedure dbgPatternDblClick(Sender: TObject);
    procedure popRecordGridDeleteClick(Sender: TObject);
    procedure popRecordGridDonwloadClick(Sender: TObject);
  private
    FTableName: string;
    FTableID: Integer;
    FAttachmentName: string;

    procedure SetTableName(const pValue: string);
    procedure SetTableID(const pValue: Integer);
    function RecordAlReadyExists: Boolean;
    function CheckPDF(const pFilePath: string): Boolean;

  public
    property TableName: string write SetTableName;
    property TableID: Integer write SetTableID;
  end;

var
  frmListingAttachment: TfrmListingAttachment;

implementation

{$R *.dfm}

uses
  dtmConnectionFD,
  formPDFDevExpress;

procedure TfrmListingAttachment.btnNewClick(Sender: TObject);
const
  cSuccessMessage: string = 'Anexo foi armazenado com sucesso!';
begin
  inherited;
  if openAttachment.Execute then
  begin
    FAttachmentName := ExtractFileName(openAttachment.FileName);
    if CheckPDF(FAttachmentName) then
    begin
      qryAttachment.Append;
      qryAttachmentATTACHMENT_NAME.AsString := FAttachmentName;
      qryAttachmentASSIGNED.AsString := 'Y';
      qryAttachmentATTACHMENT.LoadFromFile(openAttachment.FileName);

      if RecordAlReadyExists then
      begin
        qryAttachment.Cancel;
      end
      else
      begin
        qryAttachment.Post;
        ShowMessage(cSuccessMessage);
      end;
    end
    else
    begin
      qryAttachment.Append;
      if CopyFile(PChar(openAttachment.FileName), PChar(dmConnectionFD.AttachmentPath + FAttachmentName), True) then
      begin
        qryAttachmentATTACHMENT_NAME.AsString := FAttachmentName;
        qryAttachmentASSIGNED.AsString := 'N';
        qryAttachment.Post;

        ShowMessage(cSuccessMessage);
      end
      else
      begin
        qryAttachment.Cancel;
        Application.MessageBox('Não foi possível armazenar o anexo.', 'Falha', MB_ICONERROR + MB_OK);
      end;
    end;

    qryAttachment.Refresh;
  end;
end;

function TfrmListingAttachment.CheckPDF(const pFilePath: string): Boolean;
begin
  Result := (Pos('.PDF', UpperCase(pFilePath)) > 0);
end;

procedure TfrmListingAttachment.dbgPatternDblClick(Sender: TObject);
var
  lFile: TStream;
  lFileName: string;
begin
  inherited;
  lFileName := qryAttachmentATTACHMENT_NAME.AsString;
  try
    if (lFileName <> '') then
    begin
      if (qryAttachmentASSIGNED.AsString = 'Y') and CheckPDF(lFileName) then
      begin
        lFile := qryAttachment.CreateBlobStream(qryAttachmentATTACHMENT, bmRead);
        frmPDFDevExpress := TfrmPDFDevExpress.Create(Self);
        try
          frmPDFDevExpress.viewPDF.LoadFromStream(lFile);
          frmPDFDevExpress.ShowModal;
        finally
          FreeAndNil(frmPDFDevExpress);
          FreeAndNil(lFile);
        end;
      end
      else
      begin
        ShellExecuteW(Screen.ActiveForm.Handle, 'open', PChar(dmConnectionFD.AttachmentPath + lFileName), nil, nil, SW_SHOWNORMAL);
      end;
    end;
  except
    raise Exception.Create('Não é possível abrir o arquivo.');
  end;
end;

procedure TfrmListingAttachment.FormCreate(Sender: TObject);
begin
  inherited;
  qryAttachment.Active := False;
  qryAttachment.Active := True;
end;

procedure TfrmListingAttachment.FormShow(Sender: TObject);
begin
  inherited;
  qryAttachment.Close;
  qryAttachment.SQL.Clear;
  qryAttachment.SQL.Text :=
    ' select ATT.ID_ATTACHMENT, ATT.TABLE_NAME, ATT.TABLE_ID, ATT.ATTACHMENT, ATT.ATTACHMENT_NAME, ATT.ASSIGNED ' + sLineBreak +
    ' from ATTACHMENT as ATT ' + sLineBreak +
    ' where ATT.TABLE_NAME = :TABLE_NAME and ' + sLineBreak +
    '       ATT.TABLE_ID = :TABLE_ID ';
  qryAttachment.ParamByName('TABLE_NAME').AsString := FTableName;
  qryAttachment.ParamByName('TABLE_ID').AsInteger := FTableID;
  qryAttachment.Open;
end;

procedure TfrmListingAttachment.popRecordGridDeleteClick(Sender: TObject);
var
  lFilePath: string;
  lTransactionLock: Boolean;
begin
  inherited;
  lTransactionLock := False;
  case Application.MessageBox('Deseja excluir o Anexo ?', 'Excluir Anexo', MB_YESNO + MB_ICONQUESTION) of
  IDYES :
    begin
      lFilePath := dmConnectionFD.AttachmentPath + qryAttachmentATTACHMENT_NAME.AsString;
      if (qryAttachmentASSIGNED.AsString = 'N') then
      begin
        if not DeleteFile(lFilePath) then
        begin
          if FileExists(lFilePath) then
          begin
            lTransactionLock := True;
            ShowMessage('Erro ao excluir o Anexo.' + sLineBreak + lFilePath);
          end;
        end;
      end;

      if not lTransactionLock then
      begin
        qryAttachment.Delete;
        qryAttachment.Refresh;
        ShowMessage('O Anexo foi excluído.');
      end;
    end;
  IDNO :
    begin
      exit;
    end;
  end;
end;

procedure TfrmListingAttachment.popRecordGridDonwloadClick(Sender: TObject);
var
  lFileName: string;
begin
  lFileName := qryAttachmentATTACHMENT_NAME.AsString;
  if (qryAttachmentASSIGNED.AsString = 'Y') and CheckPDF(qryAttachmentATTACHMENT_NAME.AsString) then
  begin
    saveAttachment.FileName := lFileName;
    if saveAttachment.Execute(Screen.ActiveForm.Handle) then
    begin
      if FileExists(saveAttachment.FileName) then
      begin
        raise Exception.Create('Este arquivo já existe.');
      end
      else
      begin
        qryAttachmentATTACHMENT.SaveToFile(saveAttachment.FileName);
      end;
    end;

    ShellExecuteW(Screen.ActiveForm.Handle, 'open', PChar(saveAttachment.FileName), nil, nil, SW_SHOWNORMAL);
  end
  else
  begin
    ShellExecuteW(Handle, nil, PChar('explorer.exe'), PChar('/select,' + dmConnectionFD.AttachmentPath + lFileName), nil, SW_SHOWNORMAL);
  end;
end;

procedure TfrmListingAttachment.qryAttachmentNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryAttachmentTABLE_NAME.AsString := FTableName;
  qryAttachmentTABLE_ID.AsInteger := FTableID;
end;

function TfrmListingAttachment.RecordAlReadyExists: Boolean;
var
  lSQLQuery: string;
  lDataSetResult: TDataSet;
begin
  try
    lSQLQuery :=
      ' select count(*) as NUMBER_RECORD ' + sLineBreak +
      ' from ATTACHMENT as ATT ' + sLineBreak +
      ' where ATT.TABLE_NAME =  ' + QuotedStr(FTableName) + sLineBreak +
      '   and ATT.TABLE_ID = ' + FTableID.ToString + sLineBreak +
      '   and ATT.ATTACHMENT_NAME = ' + QuotedStr(FAttachmentName);
    dmConnectionFD.fdConnection.ExecSQL(lSQLQuery, lDataSetResult);
    Result := (lDataSetResult.FieldByName('NUMBER_RECORD').AsInteger > 0);
  finally
    FreeAndNil(lDataSetResult);
  end;
  if Result then
  begin
    ShowMessage('Arquivo de mesmo nome já está adicionado.');
  end;
end;

procedure TfrmListingAttachment.SetTableID(const pValue: Integer);
begin
  FTableID := pValue;
end;

procedure TfrmListingAttachment.SetTableName(const pValue: string);
begin
  FTableName := pValue;
end;

end.
