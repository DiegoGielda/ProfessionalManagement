unit formRegFinancialInstitution;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formDefaultRegistration, dxGDIPlusClasses, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmRegFinancialInstitution = class(TfrmDefaultRegistration)
    lblIDFinancialInstitution: TLabel;
    edtIDFinancialInstitution: TDBEdit;
    lblDescriptionCompany: TLabel;
    edtDescriptionFinancialinstitution: TDBEdit;
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
    procedure ButtonsState;
    procedure UpdateRegistration;
  public
    { Public declarations }
  end;

var
  frmRegFinancialInstitution: TfrmRegFinancialInstitution;

implementation

uses
  formListingFinancialInstitution,
  Data.db;

{$R *.dfm}

procedure TfrmRegFinancialInstitution.UpdateRegistration;
begin
  frmListingFinancialInstitution.qryFinancialInstitution.Refresh;
end;

procedure TfrmRegFinancialInstitution.btnCancelClick(Sender: TObject);
begin
  inherited;
  frmListingFinancialInstitution.qryFinancialInstitution.Cancel;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDFinancialInstitution', False);
end;

procedure TfrmRegFinancialInstitution.btnDeleteClick(Sender: TObject);
begin
  inherited;
  case Application.MessageBox('Deseja excluir a Instituição Financeira ?', 'Excluir Instituição Financeira', MB_YESNO + MB_ICONQUESTION) of
  IDYES :
    begin
     frmListingFinancialInstitution.qryFinancialInstitution.Delete;
     ShowMessage('A Instituição Financeira foi excluida');
     ButtonsState;
     ConfigureButtons;
     UpdateRegistration;
     ChangeStateFields(Self, 'edtIDFinancialInstitution', False);
    end;
  IDNO :
    begin
      exit;
    end;
  end;
end;

procedure TfrmRegFinancialInstitution.btnEditClick(Sender: TObject);
begin
  inherited;
  frmListingFinancialInstitution.qryFinancialInstitution.Edit;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDFinancialInstitution', True);
end;

procedure TfrmRegFinancialInstitution.btnNewClick(Sender: TObject);
begin
  inherited;
  frmListingFinancialInstitution.qryFinancialInstitution.Append;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDFinancialInstitution', True);
end;

procedure TfrmRegFinancialInstitution.btnNextClick(Sender: TObject);
begin
  inherited;
  frmListingFinancialInstitution.qryFinancialInstitution.Next;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDFinancialInstitution', False);
end;

procedure TfrmRegFinancialInstitution.btnPriorClick(Sender: TObject);
begin
  inherited;
  frmListingFinancialInstitution.qryFinancialInstitution.Prior;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDFinancialInstitution', False);
end;

procedure TfrmRegFinancialInstitution.btnSaveClick(Sender: TObject);
begin
  inherited;
  try
    frmListingFinancialInstitution.qryFinancialInstitution.Post;
    Application.MessageBox('Registro gravado com sucesso!', 'Confirmação', MB_ICONEXCLAMATION + MB_OK);
    ButtonsState;
    ConfigureButtons;
    UpdateRegistration;
  except
    Application.MessageBox('NÃO FOI POSSÍVEL GRAVAR O REGISTRO. Reinicie o sistema', 'Falha', MB_ICONERROR + MB_OK);
  end;
  ChangeStateFields(Self, 'edtIDFinancialInstitution', False);
end;

procedure TfrmRegFinancialInstitution.ButtonsState;
begin
  btnPrior.Enabled := frmListingFinancialInstitution.qryFinancialInstitution.State in [dsBrowse];
  btnNext.Enabled := frmListingFinancialInstitution.qryFinancialInstitution.State in [dsBrowse];
  btnSave.Enabled := frmListingFinancialInstitution.qryFinancialInstitution.State in [dsInsert, dsEdit];
  btnCancel.Enabled := frmListingFinancialInstitution.qryFinancialInstitution.State in [dsInsert, dsEdit];
  btnNew.Enabled := frmListingFinancialInstitution.qryFinancialInstitution.State in [dsBrowse];
  btnEdit.Enabled := frmListingFinancialInstitution.qryFinancialInstitution.State in [dsBrowse];
  btnDelete.Enabled := frmListingFinancialInstitution.qryFinancialInstitution.State in [dsbrowse];
end;

end.
