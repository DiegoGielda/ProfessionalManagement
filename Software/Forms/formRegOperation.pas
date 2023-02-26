unit formRegOperation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formDefaultRegistration, dxGDIPlusClasses, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmRegOperation = class(TfrmDefaultRegistration)
    edtDescriptionOperation: TDBEdit;
    lblDescriptionOperation: TLabel;
    edtIDOperation: TDBEdit;
    lblIDOperation: TLabel;
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
  frmRegOperation: TfrmRegOperation;

implementation

uses
  formListingOperation,
  Data.db;

{$R *.dfm}

{ TfrmRegOperation }

procedure TfrmRegOperation.UpdateRegistration;
begin
  frmListingOperation.qryOperation.Refresh;
end;

procedure TfrmRegOperation.btnCancelClick(Sender: TObject);
begin
  inherited;
  frmListingOperation.qryOperation.Cancel;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDOperation', False);
end;

procedure TfrmRegOperation.btnDeleteClick(Sender: TObject);
begin
  inherited;
  case Application.MessageBox('Deseja excluir a Operação ?', 'Excluir Operação', MB_YESNO + MB_ICONQUESTION) of
  IDYES :
    begin
     frmListingOperation.qryOperation.Delete;
     ShowMessage('A Operação foi excluida');
     ButtonsState;
     ConfigureButtons;
     UpdateRegistration;
     ChangeStateFields(Self, 'edtIDOperation', False);
    end;
  IDNO :
    begin
      exit;
    end;
  end;
end;

procedure TfrmRegOperation.btnEditClick(Sender: TObject);
begin
  inherited;
  frmListingOperation.qryOperation.Edit;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDOperation', True);
end;

procedure TfrmRegOperation.btnNewClick(Sender: TObject);
begin
  inherited;
  frmListingOperation.qryOperation.Append;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDOperation', True);
end;

procedure TfrmRegOperation.btnNextClick(Sender: TObject);
begin
  inherited;
  frmListingOperation.qryOperation.Next;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDOperation', False);
end;

procedure TfrmRegOperation.btnPriorClick(Sender: TObject);
begin
  inherited;
  frmListingOperation.qryOperation.Prior;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDOperation', False);
end;

procedure TfrmRegOperation.btnSaveClick(Sender: TObject);
begin
  inherited;
  try
    frmListingOperation.qryOperation.Post;
    Application.MessageBox('Registro gravado com sucesso!', 'Confirmação', MB_ICONEXCLAMATION + MB_OK);
    ButtonsState;
    ConfigureButtons;
    UpdateRegistration;
  except
    Application.MessageBox('NÃO FOI POSSÍVEL GRAVAR O REGISTRO. Reinicie o sistema', 'Falha', MB_ICONERROR + MB_OK);
  end;
  ChangeStateFields(Self, 'edtIDOperation', False);
end;

procedure TfrmRegOperation.ButtonsState;
begin
  btnPrior.Enabled := frmListingOperation.qryOperation.State in [dsBrowse];
  btnNext.Enabled := frmListingOperation.qryOperation.State in [dsBrowse];
  btnSave.Enabled := frmListingOperation.qryOperation.State in [dsInsert, dsEdit];
  btnCancel.Enabled := frmListingOperation.qryOperation.State in [dsInsert, dsEdit];
  btnNew.Enabled := frmListingOperation.qryOperation.State in [dsBrowse];
  btnEdit.Enabled := frmListingOperation.qryOperation.State in [dsBrowse];
  btnDelete.Enabled := frmListingOperation.qryOperation.State in [dsbrowse];
end;

end.
