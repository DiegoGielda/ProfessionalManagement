unit formRegFinancialAccount;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formDefaultRegistration, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, cxTextEdit, cxMaskEdit, cxCalendar, cxDBEdit,
  dxGDIPlusClasses, Vcl.ExtCtrls, Vcl.Buttons, cxCurrencyEdit, dxSkinsCore, dxSkinsDefaultPainters;

type
  TfrmRegFinancialAccount = class(TfrmDefaultRegistration)
    edtDateAccountFinancialAccount: TcxDBDateEdit;
    edtObservationFinancialAccount: TDBEdit;
    edtIDFinancialAccount: TDBEdit;
    edtValueAccountFinancialAccount: TDBEdit;
    lblDateAccountFinancialAccount: TLabel;
    lblObservationFinancialAccount: TLabel;
    lblIDFinancialAccount: TLabel;
    lblTypeFinancialAccount: TLabel;
    lblValueAccountFinancialAccount: TLabel;
    lookTypeFinancialAccount: TcxDBLookupComboBox;
    lblDescriptionFinancialInstitution: TLabel;
    lookDescriptionFinancialInstitution: TcxDBLookupComboBox;
    lookDescriptionOperation: TcxDBLookupComboBox;
    lblDescriptionOperation: TLabel;
    editInstallmentNumberRemove: TDBEdit;
    lblInstallmentNumber: TLabel;
    flpCardInvoice: TFlowPanel;
    grpCardInvoice: TGridPanel;
    lblCardInvoice: TLabel;
    lookDescriptionCardInvoice: TcxDBLookupComboBox;
    grpInstallments: TGridPanel;
    cbxInstallments: TCheckBox;
    grpTotalInstallments: TGridPanel;
    lblTotalinstallments: TLabel;
    edtTotalInstallments: TcxCurrencyEdit;
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAttachmentClick(Sender: TObject);
    procedure cbxInstallmentsClick(Sender: TObject);
  private
    { Private declarations }
    procedure ButtonsState;
    procedure UpdateRegistration;
    procedure UpdateScreenComponents;
    procedure GenerateInstallments;
  public
    { Public declarations }
  end;

var
  frmRegFinancialAccount: TfrmRegFinancialAccount;

implementation

uses
  dtmFinancialAccountFD,
  formListingFinancialAccount,
  formListingAttachment,
  Data.db;

{$R *.dfm}

{ TfrmRegFinancialAccount }

procedure TfrmRegFinancialAccount.btnAttachmentClick(Sender: TObject);
begin
  inherited;
  if frmListingFinancialAccount.qryFinancialAccount.State in [dsInsert, dsEdit] then
    raise Exception.Create('Salve o registro antes de anexar.');

  frmListingAttachment := TfrmListingAttachment.Create(Self);
  try
    frmListingAttachment.TableName := 'FINANCIAL_ACCOUNT';
    frmListingAttachment.TableID := frmListingFinancialAccount.qryFinancialAccountID_FINANCIAL_ACCOUNT.AsInteger;
    frmListingAttachment.ShowModal;
  finally
    FreeAndNil(frmListingAttachment);
  end;
end;

procedure TfrmRegFinancialAccount.btnCancelClick(Sender: TObject);
begin
  inherited;
  frmListingFinancialAccount.qryFinancialAccount.Cancel;
  ButtonsState;
  ConfigureButtons;
  UpdateScreenComponents;
  ChangeStateFields(Self, ['edtIDFinancialAccount', 'editInstallmentNumber'], False);
end;

procedure TfrmRegFinancialAccount.btnDeleteClick(Sender: TObject);
begin
  inherited;
  case Application.MessageBox('Deseja excluir a Conta ?', 'Excluir Conta', MB_YESNO + MB_ICONQUESTION) of
  IDYES :
    begin
     frmListingFinancialAccount.qryFinancialAccount.Delete;
     ShowMessage('A Conta foi excluida');
     ButtonsState;
     ConfigureButtons;
     UpdateRegistration;
     ChangeStateFields(Self, ['edtIDFinancialAccount', 'editInstallmentNumber'], False);
    end;
  IDNO :
    begin
      exit;
    end;
  end;
end;

procedure TfrmRegFinancialAccount.btnEditClick(Sender: TObject);
begin
  inherited;
  frmListingFinancialAccount.qryFinancialAccount.Edit;
  ButtonsState;
  ConfigureButtons;
  UpdateScreenComponents;
  ChangeStateFields(Self, ['edtIDFinancialAccount', 'editInstallmentNumber'], True);
end;

procedure TfrmRegFinancialAccount.btnNewClick(Sender: TObject);
begin
  inherited;
  frmListingFinancialAccount.qryFinancialAccount.Append;
  ButtonsState;
  ConfigureButtons;
  UpdateScreenComponents;
  ChangeStateFields(Self, ['edtIDFinancialAccount', 'editInstallmentNumber'], True);
end;

procedure TfrmRegFinancialAccount.btnNextClick(Sender: TObject);
begin
  inherited;
  frmListingFinancialAccount.qryFinancialAccount.Next;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, ['edtIDFinancialAccount', 'editInstallmentNumber'], False);
end;

procedure TfrmRegFinancialAccount.btnPriorClick(Sender: TObject);
begin
  inherited;
  frmListingFinancialAccount.qryFinancialAccount.Prior;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, ['edtIDFinancialAccount', 'editInstallmentNumber'], False);
end;

procedure TfrmRegFinancialAccount.btnSaveClick(Sender: TObject);
begin
  inherited;
  try
    frmListingFinancialAccount.qryFinancialAccount.Post;
    if cbxInstallments.Checked then
    begin
      GenerateInstallments;
    end;

    Application.MessageBox('Registro gravado com sucesso!', 'Confirmação', MB_ICONEXCLAMATION + MB_OK);
    ButtonsState;
    ConfigureButtons;
    UpdateRegistration;
    UpdateScreenComponents;
  except
    Application.MessageBox('NÃO FOI POSSÍVEL GRAVAR O REGISTRO. Reinicie o sistema', 'Falha', MB_ICONERROR + MB_OK);
  end;
  ChangeStateFields(Self, ['edtIDFinancialAccount', 'editInstallmentNumber'], False);
end;

procedure TfrmRegFinancialAccount.ButtonsState;
begin
  btnPrior.Enabled := frmListingFinancialAccount.qryFinancialAccount.State in [dsBrowse];
  btnNext.Enabled := frmListingFinancialAccount.qryFinancialAccount.State in [dsBrowse];
  btnSave.Enabled := frmListingFinancialAccount.qryFinancialAccount.State in [dsInsert, dsEdit];
  btnCancel.Enabled := frmListingFinancialAccount.qryFinancialAccount.State in [dsInsert, dsEdit];
  btnNew.Enabled := frmListingFinancialAccount.qryFinancialAccount.State in [dsBrowse];
  btnEdit.Enabled := frmListingFinancialAccount.qryFinancialAccount.State in [dsBrowse];
  btnDelete.Enabled := frmListingFinancialAccount.qryFinancialAccount.State in [dsbrowse];
end;

procedure TfrmRegFinancialAccount.cbxInstallmentsClick(Sender: TObject);
begin
  inherited;
  grpTotalInstallments.Visible := (cbxInstallments.Checked);
end;

procedure TfrmRegFinancialAccount.FormCreate(Sender: TObject);
begin
  inherited;
  dmFinancialAccountFD := TdmFinancialAccountFD.Create(Self);
end;

procedure TfrmRegFinancialAccount.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(dmFinancialAccountFD);
end;

procedure TfrmRegFinancialAccount.GenerateInstallments;
begin
  { TODO : Criar processamento para realizar replicação de registro para o banco de multiplas parcelas }
end;

procedure TfrmRegFinancialAccount.UpdateRegistration;
begin
  frmListingFinancialAccount.qryFinancialAccount.Refresh;
end;

procedure TfrmRegFinancialAccount.UpdateScreenComponents;
begin
  { TODO : Criar um enumerado para os estados do dataset para controle dos componentes }
  grpInstallments.Visible := frmListingFinancialAccount.qryFinancialAccount.State in [dsInsert];
end;

end.
