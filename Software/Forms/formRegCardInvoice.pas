unit formRegCardInvoice;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formDefaultRegistration, dxGDIPlusClasses, Vcl.ExtCtrls, Vcl.Buttons, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxDropDownEdit, cxCalendar, cxDBEdit, cxTextEdit, cxMaskEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmRegCardInvoice = class(TfrmDefaultRegistration)
    lblIDCard: TLabel;
    edtIDCardInvoice: TDBEdit;
    edtDescriptionCard: TDBEdit;
    lblDescriptionCard: TLabel;
    lookDescriptionInstitution: TcxDBLookupComboBox;
    lblInstitutionCard: TLabel;
    edtDateOpeningCard: TcxDBDateEdit;
    lblDateOpeningCard: TLabel;
    edtDateClosureCard: TcxDBDateEdit;
    lblDateClosureCard: TLabel;
    edtDatePaymentCard: TcxDBDateEdit;
    lblDatePaymentCard: TLabel;
    lookActiveCardInvoice: TDBComboBox;
    lblActiveCardInvoice: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    procedure ButtonsState;
    procedure UpdateRegistration;
    procedure ValidateRegister;
  public
    { Public declarations }
  end;

var
  frmRegCardInvoice: TfrmRegCardInvoice;

implementation

uses
  formListingCardInvoice,
  Data.db;

{$R *.dfm}

{ TfrmRegCardInvoice }

procedure TfrmRegCardInvoice.btnCancelClick(Sender: TObject);
begin
  inherited;
  frmListingCardInvoice.qryCardInvoice.Cancel;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, ['edtIDCardInvoice'], False);
end;

procedure TfrmRegCardInvoice.btnDeleteClick(Sender: TObject);
begin
  inherited;
  case Application.MessageBox('Deseja excluir a Fatura ?', 'Excluir Fatura', MB_YESNO + MB_ICONQUESTION) of
  IDYES :
    begin
     frmListingCardInvoice.qryCardInvoice.Delete;
     ShowMessage('A Fatura foi excluida.');
     ButtonsState;
     ConfigureButtons;
     UpdateRegistration;
     ChangeStateFields(Self, ['edtIDCardInvoice'], False);
    end;
  IDNO :
    begin
      exit;
    end;
  end;
end;

procedure TfrmRegCardInvoice.btnEditClick(Sender: TObject);
begin
  inherited;
  frmListingCardInvoice.qryCardInvoice.Edit;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, ['edtIDCardInvoice'], True);
end;

procedure TfrmRegCardInvoice.btnNewClick(Sender: TObject);
begin
  inherited;
  frmListingCardInvoice.qryCardInvoice.Append;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, ['edtIDCardInvoice'], True);
end;

procedure TfrmRegCardInvoice.btnNextClick(Sender: TObject);
begin
  inherited;
  frmListingCardInvoice.qryCardInvoice.Next;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, ['edtIDCardInvoice'], False);
end;

procedure TfrmRegCardInvoice.btnPriorClick(Sender: TObject);
begin
  inherited;
  frmListingCardInvoice.qryCardInvoice.Prior;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, ['edtIDCardInvoice'], False);
end;

procedure TfrmRegCardInvoice.btnSaveClick(Sender: TObject);
begin
  inherited;
  ValidateRegister;
  try
    frmListingCardInvoice.qryCardInvoice.Post;
    Application.MessageBox('Registro gravado com sucesso!', 'Confirmação', MB_ICONEXCLAMATION + MB_OK);
    ButtonsState;
    ConfigureButtons;
    UpdateRegistration;
  except
    Application.MessageBox('NÃO FOI POSSÍVEL GRAVAR O REGISTRO. Reinicie o sistema', 'Falha', MB_ICONERROR + MB_OK);
  end;
  ChangeStateFields(Self, ['edtIDCardInvoice'], False);
end;

procedure TfrmRegCardInvoice.ButtonsState;
begin
  btnPrior.Enabled := frmListingCardInvoice.qryCardInvoice.State in [dsBrowse];
  btnNext.Enabled := frmListingCardInvoice.qryCardInvoice.State in [dsBrowse];
  btnSave.Enabled := frmListingCardInvoice.qryCardInvoice.State in [dsInsert, dsEdit];
  btnCancel.Enabled := frmListingCardInvoice.qryCardInvoice.State in [dsInsert, dsEdit];
  btnNew.Enabled := frmListingCardInvoice.qryCardInvoice.State in [dsBrowse];
  btnEdit.Enabled := frmListingCardInvoice.qryCardInvoice.State in [dsBrowse];
  btnDelete.Enabled := frmListingCardInvoice.qryCardInvoice.State in [dsbrowse];
end;

procedure TfrmRegCardInvoice.UpdateRegistration;
begin
  frmListingCardInvoice.qryCardInvoice.Refresh;
end;

procedure TfrmRegCardInvoice.ValidateRegister;
begin
  if (frmListingCardInvoice.qryCardInvoiceDATE_OPENING.AsDateTime > frmListingCardInvoice.qryCardInvoiceDATE_CLOSURE.AsDateTime) then
  begin
    raise Exception.Create('Data de Abertura não deve ser superior a Data de Fechamento.');
  end;
end;

end.
