unit formRegCompany;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  formDefault, formDefaultRegistration;

type
  TfrmRegCompany = class(TfrmDefaultRegistration)
    edtIDCompany: TDBEdit;
    edtDescriptionCompany: TDBEdit;
    lblIDCompany: TLabel;
    lblDescriptionCompany: TLabel;
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
  frmRegCompany: TfrmRegCompany;

implementation

{$R *.dfm}

uses
  formListingCompany,
  Data.db;

procedure TfrmRegCompany.UpdateRegistration;
begin
  frmListingCompany.qryCompany.Refresh;
end;

procedure TfrmRegCompany.btnCancelClick(Sender: TObject);
begin
  inherited;
  frmListingCompany.qryCompany.Cancel;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDCompany', False);
end;

procedure TfrmRegCompany.btnDeleteClick(Sender: TObject);
begin
  inherited;
  case Application.MessageBox('Deseja excluir o Empresa ?', 'Excluir Empresa', MB_YESNO + MB_ICONQUESTION) of
  IDYES :
    begin
     frmListingCompany.qryCompany.Delete;
     ShowMessage('O Empresa foi excluido');
     ButtonsState;
     ConfigureButtons;
     UpdateRegistration;
     ChangeStateFields(Self, 'edtIDCompany', False);
    end;
  IDNO :
    begin
      exit;
    end;
  end;
end;

procedure TfrmRegCompany.btnEditClick(Sender: TObject);
begin
  inherited;
  frmListingCompany.qryCompany.Edit;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDCompany', True);
end;

procedure TfrmRegCompany.btnNewClick(Sender: TObject);
begin
  inherited;
  frmListingCompany.qryCompany.Insert;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDCompany', True);
end;

procedure TfrmRegCompany.btnNextClick(Sender: TObject);
begin
  inherited;
  frmListingCompany.qryCompany.Next;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDCompany', False);
end;

procedure TfrmRegCompany.btnPriorClick(Sender: TObject);
begin
  inherited;
  frmListingCompany.qryCompany.Prior;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDCompany', False);
end;

procedure TfrmRegCompany.btnSaveClick(Sender: TObject);
begin
  inherited;
  try
    frmListingCompany.qryCompany.Post;
    Application.MessageBox('Registro gravado com sucesso!', 'Confirmação', MB_ICONEXCLAMATION + MB_OK);
    ButtonsState;
    ConfigureButtons;
    UpdateRegistration;
  except
    Application.MessageBox('NÃO FOI POSSÍVEL GRAVAR O REGISTRO. Reinicie o sistema', 'Falha', MB_ICONERROR + MB_OK);
  end;
  ChangeStateFields(Self, 'edtIDCompany', False);
end;

procedure TfrmRegCompany.ButtonsState;
begin
  btnPrior.Enabled := frmListingCompany.qryCompany.State in [dsBrowse];
  btnNext.Enabled := frmListingCompany.qryCompany.State in [dsBrowse];
  btnSave.Enabled := frmListingCompany.qryCompany.State in [dsInsert, dsEdit];
  btnCancel.Enabled := frmListingCompany.qryCompany.State in [dsInsert, dsEdit];
  btnNew.Enabled := frmListingCompany.qryCompany.State in [dsBrowse];
  btnEdit.Enabled := frmListingCompany.qryCompany.State in [dsBrowse];
  btnDelete.Enabled := frmListingCompany.qryCompany.State in [dsbrowse];
end;

end.
