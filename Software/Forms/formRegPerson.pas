unit formRegPerson;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formDefaultRegistration, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, dxGDIPlusClasses, Vcl.ExtCtrls, Vcl.Buttons;

type
  TfrmRegPerson = class(TfrmDefaultRegistration)
    edtIDPerson: TDBEdit;
    lblIDPerson: TLabel;
    edtNamePerson: TDBEdit;
    lblNamePerson: TLabel;
    edtCPFPerson: TDBEdit;
    lblCPFPerson: TLabel;
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
  frmRegPerson: TfrmRegPerson;

implementation

uses
  formListingPerson,
  Data.db;

{$R *.dfm}

procedure TfrmRegPerson.btnCancelClick(Sender: TObject);
begin
  inherited;
  frmListingPerson.qryPerson.Cancel;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, ['edtIDPerson'], False);
end;

procedure TfrmRegPerson.btnDeleteClick(Sender: TObject);
begin
  inherited;
  case Application.MessageBox('Deseja excluir a Pessoa ?', 'Excluir Pessoa', MB_YESNO + MB_ICONQUESTION) of
  IDYES :
    begin
     frmListingPerson.qryPerson.Delete;
     ShowMessage('A Pessoa foi excluida');
     ButtonsState;
     ConfigureButtons;
     UpdateRegistration;
     ChangeStateFields(Self, ['edtIDPerson'], False);
    end;
  IDNO :
    begin
      exit;
    end;
  end;
end;

procedure TfrmRegPerson.btnEditClick(Sender: TObject);
begin
  inherited;
  frmListingPerson.qryPerson.Edit;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, ['edtIDPerson'], True);
end;

procedure TfrmRegPerson.btnNewClick(Sender: TObject);
begin
  inherited;
  frmListingPerson.qryPerson.Append;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, ['edtIDPerson'], True);
end;

procedure TfrmRegPerson.btnNextClick(Sender: TObject);
begin
  inherited;
  frmListingPerson.qryPerson.Next;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, ['edtIDPerson'], False);
end;

procedure TfrmRegPerson.btnPriorClick(Sender: TObject);
begin
  inherited;
  inherited;
  frmListingPerson.qryPerson.Prior;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, ['edtIDPerson'], False);
end;

procedure TfrmRegPerson.btnSaveClick(Sender: TObject);
begin
  inherited;
  try
    frmListingPerson.qryPerson.Post;
    Application.MessageBox('Registro gravado com sucesso!', 'Confirmação', MB_ICONEXCLAMATION + MB_OK);
    ButtonsState;
    ConfigureButtons;
    UpdateRegistration;
  except
    Application.MessageBox('NÃO FOI POSSÍVEL GRAVAR O REGISTRO. Reinicie o sistema', 'Falha', MB_ICONERROR + MB_OK);
  end;
  ChangeStateFields(Self, ['edtIDPerson'], False);

end;

procedure TfrmRegPerson.ButtonsState;
begin
  btnPrior.Enabled := frmListingPerson.qryPerson.State in [dsBrowse];
  btnNext.Enabled := frmListingPerson.qryPerson.State in [dsBrowse];
  btnSave.Enabled := frmListingPerson.qryPerson.State in [dsInsert, dsEdit];
  btnCancel.Enabled := frmListingPerson.qryPerson.State in [dsInsert, dsEdit];
  btnNew.Enabled := frmListingPerson.qryPerson.State in [dsBrowse];
  btnEdit.Enabled := frmListingPerson.qryPerson.State in [dsBrowse];
  btnDelete.Enabled := frmListingPerson.qryPerson.State in [dsbrowse];
end;

procedure TfrmRegPerson.UpdateRegistration;
begin
  frmListingPerson.qryPerson.Refresh;
end;

end.
