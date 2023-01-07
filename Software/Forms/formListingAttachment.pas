unit formListingAttachment;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
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
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure qryAttachmentNewRecord(DataSet: TDataSet);
    procedure dbgPatternDblClick(Sender: TObject);
    procedure popRecordGridDeleteClick(Sender: TObject);
  private
    { Private declarations }
    FTableName: string;
    FTableID: Integer;
    FAttachmentName: string;
    procedure SetTableName(const Value: string);
    procedure SetTableID(const Value: Integer);
    function  RecordAlReadyExists: Boolean;
  public
    { Public declarations }
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
begin
  inherited;
  qryAttachment.Append;
  if openAttachment.Execute then
  begin
    FAttachmentName := ExtractFileName(openAttachment.FileName);
    qryAttachmentATTACHMENT_NAME.AsString := FAttachmentName;
    qryAttachmentATTACHMENT.LoadFromFile(openAttachment.FileName);
  end;
  if (FAttachmentName.IsEmpty or RecordAlReadyExists) then
  begin
    qryAttachment.Cancel;
  end
  else
  begin
    qryAttachment.Post;
  end;
  qryAttachment.Refresh;
end;

procedure TfrmListingAttachment.dbgPatternDblClick(Sender: TObject);
var
  lFile: TStream;
begin
  inherited;
  if (Pos('.PDF', UpperCase(qryAttachmentATTACHMENT_NAME.AsString)) > 0) then
  begin
    lFile := qryAttachment.CreateBlobStream(qryAttachmentATTACHMENT, bmRead);
    frmPDFDevExpress := TfrmPDFDevExpress.Create(Self);
    try
      frmPDFDevExpress.viewPDF.LoadFromStream(lFile);
      frmPDFDevExpress.ShowModal;
    finally
      FreeAndNil(lFile);
      FreeAndNil(frmPDFDevExpress);
    end;
  end
  else
  begin
    raise Exception.Create('Não é possível abrir o arquivo. Somente ".PDF"');
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
    ' select ATT.ID_ATTACHMENT, ATT.TABLE_NAME, ATT.TABLE_ID, ATT.ATTACHMENT, ATT.ATTACHMENT_NAME ' + sLineBreak +
    ' from ATTACHMENT as ATT ' + sLineBreak +
    ' where ATT.TABLE_NAME = :TABLE_NAME and ' + sLineBreak +
    '       ATT.TABLE_ID = :TABLE_ID ';
  qryAttachment.ParamByName('TABLE_NAME').AsString := FTableName;
  qryAttachment.ParamByName('TABLE_ID').AsInteger := FTableID;
  qryAttachment.Open;
end;

procedure TfrmListingAttachment.popRecordGridDeleteClick(Sender: TObject);
begin
  inherited;
  case Application.MessageBox('Deseja excluir o Anexo ?', 'Excluir Anexo', MB_YESNO + MB_ICONQUESTION) of
  IDYES :
    begin
     qryAttachment.Delete;
     qryAttachment.Refresh;
     ShowMessage('O Anexo foi excluído.');
    end;
  IDNO :
    begin
      exit;
    end;
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

procedure TfrmListingAttachment.SetTableID(const Value: Integer);
begin
  FTableID := Value;
end;

procedure TfrmListingAttachment.SetTableName(const Value: string);
begin
  FTableName := Value;
end;

end.
