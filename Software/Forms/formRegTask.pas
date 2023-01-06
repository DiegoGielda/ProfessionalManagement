unit formRegTask;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formDefaultRegistration, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, cxTextEdit, cxMaskEdit, cxCalendar, cxDBEdit,
  dxGDIPlusClasses, Vcl.ExtCtrls, Vcl.Buttons;

type
  TfrmRegTask = class(TfrmDefaultRegistration)
    edtDateConcludedTask: TcxDBDateEdit;
    edtDateRegistrationTask: TcxDBDateEdit;
    edtDateToDoTask: TcxDBDateEdit;
    edtDescriptionTask: TDBEdit;
    edtIDTask: TDBEdit;
    edtRemarckTask: TDBEdit;
    lblContextTask: TLabel;
    lblDateConcludedTask: TLabel;
    lblDateRegistrationTask: TLabel;
    lblDateToDoTask: TLabel;
    lblDescriptionTask: TLabel;
    lblIDTask: TLabel;
    lblPeriodTask: TLabel;
    lblRemarckTask: TLabel;
    lblStateTask: TLabel;
    lookContextTask: TcxDBLookupComboBox;
    lookPeriodTask: TcxDBLookupComboBox;
    lookStateTask: TcxDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
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
  dtmTaskFD,
  formListingTask,
  Data.db;

{ TfrmRegTask }

procedure TfrmRegTask.btnCancelClick(Sender: TObject);
begin
  inherited;
  frmListingTask.qryTask.Cancel;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDTask', False);
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
  ChangeStateFields(Self, 'edtIDTask', False);
end;

procedure TfrmRegTask.btnEditClick(Sender: TObject);
begin
  inherited;
  frmListingTask.qryTask.Edit;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDTask', True);
end;

procedure TfrmRegTask.btnNewClick(Sender: TObject);
begin
  inherited;
  frmListingTask.qryTask.Append;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDTask', True);
end;

procedure TfrmRegTask.btnNextClick(Sender: TObject);
begin
  inherited;
  frmListingTask.qryTask.Next;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDTask', False);
end;

procedure TfrmRegTask.btnPriorClick(Sender: TObject);
begin
  inherited;
  frmListingTask.qryTask.Prior;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDTask', False);
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
  ChangeStateFields(Self, 'edtIDTask', False);
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

procedure TfrmRegTask.FormCreate(Sender: TObject);
begin
  inherited;
  dmTaskFD := TdmTaskFD.Create(Self);
end;

procedure TfrmRegTask.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(dmTaskFD);
end;

procedure TfrmRegTask.UpdateRegistration;
begin
  frmListingTask.qryTask.Refresh;
end;

end.
