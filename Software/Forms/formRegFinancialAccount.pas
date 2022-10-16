unit formRegFinancialAccount;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formDefaultRegistration, dxGDIPlusClasses, Vcl.ExtCtrls, Vcl.Buttons, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxDropDownEdit, cxCalendar, cxDBEdit, cxTextEdit, cxMaskEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmRegFinancialAccount = class(TfrmDefaultRegistration)
    edtIDFinancialAccount: TDBEdit;
    lblIDFinancialAccount: TLabel;
    edtDescriptionFinancialAccount: TDBEdit;
    lblDescriptionFinancialAccount: TLabel;
    lookTypeFinancialAccount: TcxDBLookupComboBox;
    lblTypeFinancialAccount: TLabel;
    edtDateAccountFinancialAccount: TcxDBDateEdit;
    lblDateAccountFinancialAccount: TLabel;
    edtValueAccountFinancialAccount: TDBEdit;
    lblValueAccountFinancialAccount: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure ButtonsState;
    procedure UpdateRegistration;

  public
    { Public declarations }
  end;

var
  frmRegFinancialAccount: TfrmRegFinancialAccount;

implementation

uses
  dtmFinancialAccountFD,
  formListingFinancialAccount,
  Data.db;

{$R *.dfm}

{ TfrmRegFinancialAccount }

procedure TfrmRegFinancialAccount.btnCancelClick(Sender: TObject);
begin
  inherited;
  frmListingFinancialAccount.qryFinancialAccount.Cancel;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDFinancialAccount', False);
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
     ChangeStateFields(Self, 'edtIDFinancialAccount', False);
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
  ChangeStateFields(Self, 'edtIDFinancialAccount', True);
end;

procedure TfrmRegFinancialAccount.btnNewClick(Sender: TObject);
begin
  inherited;
  frmListingFinancialAccount.qryFinancialAccount.Insert;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDFinancialAccount', True);
end;

procedure TfrmRegFinancialAccount.btnNextClick(Sender: TObject);
begin
  inherited;
  frmListingFinancialAccount.qryFinancialAccount.Next;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDFinancialAccount', False);
end;

procedure TfrmRegFinancialAccount.btnPriorClick(Sender: TObject);
begin
  inherited;
  frmListingFinancialAccount.qryFinancialAccount.Prior;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDFinancialAccount', False);
end;

procedure TfrmRegFinancialAccount.btnSaveClick(Sender: TObject);
begin
  inherited;
  try
    frmListingFinancialAccount.qryFinancialAccount.Post;
    Application.MessageBox('Registro gravado com sucesso!', 'Confirmação', MB_ICONEXCLAMATION + MB_OK);
    ButtonsState;
    ConfigureButtons;
    UpdateRegistration;
  except
    Application.MessageBox('NÃO FOI POSSÍVEL GRAVAR O REGISTRO. Reinicie o sistema', 'Falha', MB_ICONERROR + MB_OK);
  end;
  ChangeStateFields(Self, 'edtIDFinancialAccount', False);
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

procedure TfrmRegFinancialAccount.UpdateRegistration;
begin
  frmListingFinancialAccount.qryFinancialAccount.Refresh;
end;

end.
