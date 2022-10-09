unit formRegTask;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  formDefaultRegistration;

type
  TfrmRegTask = class(TfrmDefaultRegistration)
    edtIDTask: TDBEdit;
    lblIDTask: TLabel;
    lblDescriptionTask: TLabel;
    edtDescriptionTask: TDBEdit;
    lblPeriod: TLabel;
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
  frmRegTask: TfrmRegTask;

implementation

{$R *.dfm}

uses
  formListingTask,
  Data.db;

{ TfrmRegTask }

procedure TfrmRegTask.btnCancelClick(Sender: TObject);
begin
  inherited;
  frmListingTask.qryTask.Cancel;
  ButtonsState;
  ConfigureButtons;
end;

procedure TfrmRegTask.btnDeleteClick(Sender: TObject);
begin
  inherited;
  case Application.MessageBox('Deseja excluir a Tarefa ?', 'Excluir Tarefa', MB_YESNO + MB_ICONQUESTION) of
  IDYES :
    begin
     frmListingTask.qryTask.Delete;
     ShowMessage('A Tarefa foi excluida');
     ButtonsState;
     ConfigureButtons;
     UpdateRegistration;
    end;
  IDNO :
    begin
      exit;
    end;
  end;
end;

procedure TfrmRegTask.btnEditClick(Sender: TObject);
begin
  inherited;
  frmListingTask.qryTask.Edit;
  ButtonsState;
  ConfigureButtons;
end;

procedure TfrmRegTask.btnNewClick(Sender: TObject);
begin
  inherited;
  frmListingTask.qryTask.Insert;
  ButtonsState;
  ConfigureButtons;
end;

procedure TfrmRegTask.btnNextClick(Sender: TObject);
begin
  inherited;
  frmListingTask.qryTask.Next;
  ButtonsState;
  ConfigureButtons;
end;

procedure TfrmRegTask.btnPriorClick(Sender: TObject);
begin
  inherited;
  frmListingTask.qryTask.Prior;
  ButtonsState;
  ConfigureButtons;
end;

procedure TfrmRegTask.btnSaveClick(Sender: TObject);
begin
  inherited;
  try
    frmListingTask.qryTask.Post;
    Application.MessageBox('Registro gravado com sucesso!', 'Confirmação', MB_ICONEXCLAMATION + MB_OK);
    ButtonsState;
    ConfigureButtons;
    UpdateRegistration;
  except
    Application.MessageBox('NÃO FOI POSSÍVEL GRAVAR O REGISTRO. Reinicie o sistema', 'Falha', MB_ICONERROR + MB_OK);
  end;
end;

procedure TfrmRegTask.ButtonsState;
begin
  btnPrior.Enabled := frmListingTask.qryTask.State in [dsBrowse];
  btnNext.Enabled := frmListingTask.qryTask.State in [dsBrowse];
  btnSave.Enabled := frmListingTask.qryTask.State in [dsInsert, dsEdit];
  btnCancel.Enabled := frmListingTask.qryTask.State in [dsInsert, dsEdit];
  btnNew.Enabled := frmListingTask.qryTask.State in [dsBrowse];
  btnEdit.Enabled := frmListingTask.qryTask.State in [dsBrowse];
  btnDelete.Enabled := frmListingTask.qryTask.State in [dsbrowse];
end;

procedure TfrmRegTask.UpdateRegistration;
begin
  frmListingTask.qryTask.Refresh;
end;

end.
