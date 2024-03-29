unit formRegJob;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formDefaultRegistration, dxGDIPlusClasses, Vcl.ExtCtrls, Vcl.Buttons, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, cxCalendar, cxDBEdit;

type
  TfrmRegJob = class(TfrmDefaultRegistration)
    edtDescriptionJob: TDBEdit;
    edtIDJob: TDBEdit;
    lblCompany: TLabel;
    lblDescriptionJob: TLabel;
    lblIDJob: TLabel;
    lookDescriptionCompany: TcxDBLookupComboBox;
    edtDateAdmissionJob: TcxDBDateEdit;
    lblDateAdmissionJob: TLabel;
    lblDateResignationJob: TLabel;
    edtDateResignationJob: TcxDBDateEdit;
    procedure btnSaveClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    procedure ButtonsState;
    procedure UpdateRegistration;
  public
    { Public declarations }
  end;

var
  frmRegJob: TfrmRegJob;

implementation

{$R *.dfm}

uses
  formListingJob,
  Data.db;

procedure TfrmRegJob.UpdateRegistration;
begin
  frmListingJob.qryJob.Refresh;
  frmListingJob.qryJobCompany.Refresh;
end;

procedure TfrmRegJob.btnCancelClick(Sender: TObject);
begin
  inherited;
  frmListingJob.qryJob.Cancel;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, ['edtIDJob'], False);
end;

procedure TfrmRegJob.btnDeleteClick(Sender: TObject);
begin
  inherited;
  case Application.MessageBox('Deseja excluir o Cargo ?', 'Excluir Cargo', MB_YESNO + MB_ICONQUESTION) of
    IDYES :
    begin
      frmListingJob.qryJob.Delete;
      ShowMessage('O Cargo foi excluido');
      ButtonsState;
      ConfigureButtons;
      UpdateRegistration;
      ChangeStateFields(Self, ['edtIDJob'], False);
    end;
    IDNO :
    begin
      exit;
    end;
  end;
end;

procedure TfrmRegJob.btnEditClick(Sender: TObject);
begin
  inherited;
  frmListingJob.qryJob.Edit;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, ['edtIDJob'], True);
end;

procedure TfrmRegJob.btnNewClick(Sender: TObject);
begin
  inherited;
  frmListingJob.qryJob.Append;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, ['edtIDJob'], True);
end;

procedure TfrmRegJob.btnNextClick(Sender: TObject);
begin
  inherited;
  frmListingJob.qryJob.Next;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, ['edtIDJob'], False);
end;

procedure TfrmRegJob.btnPriorClick(Sender: TObject);
begin
  inherited;
  frmListingJob.qryJob.Prior;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, ['edtIDJob'], False);
end;

procedure TfrmRegJob.btnSaveClick(Sender: TObject);
begin
  inherited;
  try
    frmListingJob.qryJob.Post;
    Application.MessageBox('Registro gravado com sucesso!', 'Confirma��o', MB_ICONEXCLAMATION + MB_OK);
    ButtonsState;
    ConfigureButtons;
    UpdateRegistration;
    ChangeStateFields(Self, ['edtIDJob'], False);
  except
    Application.MessageBox('N�O FOI POSS�VEL GRAVAR O REGISTRO. Reinicie o sistema', 'Falha', MB_ICONERROR + MB_OK);
  end;
end;

procedure TfrmRegJob.ButtonsState;
begin
  btnPrior.Enabled := frmListingJob.qryJob.State in [dsBrowse];
  btnNext.Enabled := frmListingJob.qryJob.State in [dsBrowse];
  btnSave.Enabled := frmListingJob.qryJob.State in [dsInsert, dsEdit];
  btnCancel.Enabled := frmListingJob.qryJob.State in [dsInsert, dsEdit];
  btnNew.Enabled := frmListingJob.qryJob.State in [dsBrowse];
  btnEdit.Enabled := frmListingJob.qryJob.State in [dsBrowse];
  btnDelete.Enabled := frmListingJob.qryJob.State in [dsbrowse];
end;

end.
