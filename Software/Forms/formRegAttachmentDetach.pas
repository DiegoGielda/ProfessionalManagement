unit formRegAttachmentDetach;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formDefaultRegistration, dxGDIPlusClasses, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox;

type
  TfrmRegAttachmentDetach = class(TfrmDefaultRegistration)
    edtIDAttachmentDetach: TDBEdit;
    lblIDAttachmentDetach: TLabel;
    lblDescriptionAttachmentDetach: TLabel;
    edtDescriptionAttachmentDetach: TDBEdit;
    lookDescriptionAttachmentGroup: TcxDBLookupComboBox;
    lblDescriptionAttachmentGroup: TLabel;
    openAttachmentDetach: TOpenDialog;
    saveAttachmentDetach: TSaveDialog;
    btnAttachmentDetachView: TSpeedButton;
    procedure btnNewClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    FAttachmentName: string;

    function CheckPDF(const pFilePath: string): Boolean;
    function RecordAlReadyExists: Boolean;
    function FetchPathGroup(pIDGroup: Integer): string;
    function UploadAttachment: Boolean;
    procedure ButtonsState;
    procedure UpdateRegistration;
  public
    { Public declarations }
  end;

var
  frmRegAttachmentDetach: TfrmRegAttachmentDetach;

implementation

uses
  formListingAttachmentDetach,
  dtmConnectionFD,
  Data.DB;

{$R *.dfm}

procedure TfrmRegAttachmentDetach.btnCancelClick(Sender: TObject);
begin
  inherited;
  frmListingAttachmentDetach.qryAttachmentDetach.Cancel;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDAttachmentDetach', False);
end;

procedure TfrmRegAttachmentDetach.btnDeleteClick(Sender: TObject);
var
  lFileDetachPath: string;
  lTransactionLock: Boolean;
begin
  inherited;
   { TODO : Ajustar para quando não encontrar o anexo pedir se continuar a deleção, verificar para a outra tela de anexo via registro }
  lTransactionLock := False;
  lFileDetachPath := FetchPathGroup(frmListingAttachmentDetach.qryAttachmentDetachCD_ATTACHMENT_DETACHED_GROUP.AsInteger);
  case Application.MessageBox('Deseja excluir o Anexo ?', 'Excluir Anexo', MB_YESNO + MB_ICONQUESTION) of
  IDYES :
    begin
      lFileDetachPath := dmConnectionFD.AttachmentDetachPath + lFileDetachPath + '\' +
        frmListingAttachmentDetach.qryAttachmentDetachATTACHMENT_DETACHED_NAME.AsString;

      if (frmListingAttachmentDetach.qryAttachmentDetachASSIGNED.AsString = 'N') then
      begin
        if not DeleteFile(lFileDetachPath) then
        begin
          if FileExists(lFileDetachPath) then
          begin
            lTransactionLock := True;
            ShowMessage('Erro ao excluir o Anexo.' + sLineBreak + lFileDetachPath);
          end;
        end;
      end;

      if not lTransactionLock then
      begin
        frmListingAttachmentDetach.qryAttachmentDetach.Delete;
        ShowMessage('O Anexo foi excluído.');
        ButtonsState;
        ConfigureButtons;
        UpdateRegistration;
        ChangeStateFields(Self, 'edtIDAttachmentDetach', False);
      end;
    end;
  IDNO :
    begin
      exit;
    end;
  end;
end;

procedure TfrmRegAttachmentDetach.btnEditClick(Sender: TObject);
begin
  inherited;
  // Não pode editar
end;

procedure TfrmRegAttachmentDetach.btnNewClick(Sender: TObject);
begin
  inherited;
  frmListingAttachmentDetach.qryAttachmentDetach.Append;
  if UploadAttachment then
  begin
    ButtonsState;
    ConfigureButtons;
    ChangeStateFields(Self, 'edtIDAttachmentDetach', True);
  end
  else
  begin
    btnCancelClick(Self);
  end;
end;

procedure TfrmRegAttachmentDetach.btnNextClick(Sender: TObject);
begin
  inherited;
  frmListingAttachmentDetach.qryAttachmentDetach.Next;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDAttachmentDetach', False);
end;

procedure TfrmRegAttachmentDetach.btnPriorClick(Sender: TObject);
begin
  inherited;
  frmListingAttachmentDetach.qryAttachmentDetach.Prior;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDAttachmentDetach', False);
end;

procedure TfrmRegAttachmentDetach.btnSaveClick(Sender: TObject);
const
  cSuccessMessage: PWideChar = 'Registro gravado com sucesso!';
var
  lPathAttachmentDetach, lPathGroup: string;
begin
  inherited;
  if (frmListingAttachmentDetach.qryAttachmentDetachCD_ATTACHMENT_DETACHED_GROUP.AsInteger <= 0) then
  begin
    raise Exception.Create('Informe um grupo para o Anexo.');
  end;

  try
    if frmListingAttachmentDetach.qryAttachmentDetachASSIGNED.AsString = 'Y' then
    begin
      frmListingAttachmentDetach.qryAttachmentDetach.Post;
      Application.MessageBox(cSuccessMessage, 'Confirmação', MB_ICONEXCLAMATION + MB_OK);
    end
    else
    begin
      lPathGroup := FetchPathGroup(frmListingAttachmentDetach.qryAttachmentDetachCD_ATTACHMENT_DETACHED_GROUP.AsInteger);
      lPathAttachmentDetach := dmConnectionFD.AttachmentDetachPath + lPathGroup;

      if not DirectoryExists(lPathAttachmentDetach) then
        ForceDirectories(lPathAttachmentDetach);

      if CopyFile(PChar(openAttachmentDetach.FileName), PChar(lPathAttachmentDetach + '\' + FAttachmentName), True) then
      begin
        frmListingAttachmentDetach.qryAttachmentDetach.Post;
        Application.MessageBox(cSuccessMessage, 'Confirmação', MB_ICONEXCLAMATION + MB_OK);
      end
      else
      begin
        frmListingAttachmentDetach.qryAttachmentDetach.Cancel;
        Application.MessageBox('NÃO FOI POSSÍVEL GRAVAR O REGISTRO. Reinicie o sistema', 'Falha', MB_ICONERROR + MB_OK);
      end;
    end;
  except
    Application.MessageBox('NÃO FOI POSSÍVEL GRAVAR O REGISTRO. Reinicie o sistema', 'Falha', MB_ICONERROR + MB_OK);
  end;

  ButtonsState;
  ConfigureButtons;
  UpdateRegistration;
  ChangeStateFields(Self, 'edtIDAttachmentDetach', False);
end;

procedure TfrmRegAttachmentDetach.ButtonsState;
begin
  btnPrior.Enabled := frmListingAttachmentDetach.qryAttachmentDetach.State in [dsBrowse];
  btnNext.Enabled := frmListingAttachmentDetach.qryAttachmentDetach.State in [dsBrowse];
  btnSave.Enabled := frmListingAttachmentDetach.qryAttachmentDetach.State in [dsInsert, dsEdit];
  btnCancel.Enabled := frmListingAttachmentDetach.qryAttachmentDetach.State in [dsInsert, dsEdit];
  btnNew.Enabled := frmListingAttachmentDetach.qryAttachmentDetach.State in [dsBrowse];
  btnEdit.Enabled := frmListingAttachmentDetach.qryAttachmentDetach.State in [dsBrowse];
  btnDelete.Enabled := frmListingAttachmentDetach.qryAttachmentDetach.State in [dsbrowse];
end;

function TfrmRegAttachmentDetach.CheckPDF(const pFilePath: string): Boolean;
begin
  Result := (Pos('.PDF', UpperCase(pFilePath)) > 0);
end;

function TfrmRegAttachmentDetach.FetchPathGroup(pIDGroup: Integer): string;
var
  lSQLQuery: string;
  lDataSetResult: TDataSet;
begin
  Result := '';
  try
    lSQLQuery :=
      ' select ATT_GROUP.PATH_GROUP ' + sLineBreak +
      ' from ATTACHMENT_DETACHED_GROUP ATT_GROUP ' + sLineBreak +
      ' where ATT_GROUP.ID_ATTACHMENT_DETACHED_GROUP = ' + pIDGroup.ToString;
    dmConnectionFD.fdConnection.ExecSQL(lSQLQuery, lDataSetResult);
    Result := lDataSetResult.FieldByName('PATH_GROUP').AsString;
  finally
    FreeAndNil(lDataSetResult);
  end;
end;

function TfrmRegAttachmentDetach.RecordAlReadyExists: Boolean;
var
  lSQLQuery: string;
  lDataSetResult: TDataSet;
  lSuccessMessage: PWideChar;
begin
  try
    lSQLQuery :=
      ' select first 1 ATT_GROUP.DESCRIPTION ' + sLineBreak +
      ' from ATTACHMENT_DETACHED ATT_DET ' + sLineBreak +
      ' inner join ATTACHMENT_DETACHED_GROUP ATT_GROUP on (ATT_GROUP.ID_ATTACHMENT_DETACHED_GROUP = ATT_DET.CD_ATTACHMENT_DETACHED_GROUP) ' + sLineBreak +
      ' where ATT_DET.ATTACHMENT_DETACHED_NAME = ' + QuotedStr(FAttachmentName);
    dmConnectionFD.fdConnection.ExecSQL(lSQLQuery, lDataSetResult);
    Result := (lDataSetResult.RecordCount > 0);
  finally
    FreeAndNil(lDataSetResult);
  end;
  if Result then
  begin
    lSuccessMessage := pwidechar(widestring('Anexo já presente no grupo "' + lDataSetResult.FieldByName('DESCRIPTION').AsString) + '"');
    Application.MessageBox(lSuccessMessage, 'Falha', MB_ICONEXCLAMATION + MB_OK);
  end;
end;

procedure TfrmRegAttachmentDetach.UpdateRegistration;
begin
  frmListingAttachmentDetach.qryAttachmentDetach.Refresh;
end;

function TfrmRegAttachmentDetach.UploadAttachment: Boolean;
begin
  Result := True;
  if openAttachmentDetach.Execute then
  begin
    FAttachmentName := ExtractFileName(openAttachmentDetach.FileName);

    if RecordAlReadyExists then
    begin
      btnCancelClick(Self);
    end
    else
    begin
      if CheckPDF(FAttachmentName) then
      begin
        frmListingAttachmentDetach.qryAttachmentDetachATTACHMENT_DETACHED_NAME.AsString := FAttachmentName;
        frmListingAttachmentDetach.qryAttachmentDetachASSIGNED.AsString := 'Y';
        frmListingAttachmentDetach.qryAttachmentDetachATTACHMENT_DETACHED.LoadFromFile(openAttachmentDetach.FileName);
      end
      else
      begin
        frmListingAttachmentDetach.qryAttachmentDetachATTACHMENT_DETACHED_NAME.AsString := FAttachmentName;
        frmListingAttachmentDetach.qryAttachmentDetachASSIGNED.AsString := 'N';
      end;
    end;
  end
  else
  begin
    Result := False;
  end;
end;

end.
