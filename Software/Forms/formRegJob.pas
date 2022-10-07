unit formRegJob;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  formDefaultRegistration;

type
  TfrmRegJob = class(TfrmDefaultRegistration)
    edtIDJob: TDBEdit;
    edtDescriptionJob: TDBEdit;
    lblDescriptionJob: TLabel;
    lblIDJob: TLabel;
    lookCompany: TDBLookupComboBox;
    lblCompany: TLabel;
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ButtonsState;
    procedure AtualizarRegistro;
  end;

var
  frmRegJob: TfrmRegJob;

implementation

{$R *.dfm}

uses
  formListingJob,
  Data.db;

procedure TfrmRegJob.AtualizarRegistro;
begin
  frmListingJob.qryJob.Refresh;
  frmListingJob.qryJobCompany.Refresh;
end;

procedure TfrmRegJob.btnAnteriorClick(Sender: TObject);
begin
  inherited;
  frmListingJob.qryJob.Prior;
  ButtonsState;
  ConfigureButtons;
end;

procedure TfrmRegJob.btnCancelarClick(Sender: TObject);
begin
  inherited;
  frmListingJob.qryJob.Cancel;
  ButtonsState;
  ConfigureButtons;
end;

procedure TfrmRegJob.btnDeletarClick(Sender: TObject);
begin
  inherited;
  case Application.MessageBox('Deseja excluir o Cargo ?', 'Excluir Cargo', MB_YESNO + MB_ICONQUESTION) of
  IDYES :
    begin
     frmListingJob.qryJob.Delete;
     ShowMessage('O Cargo foi excluido');
     ButtonsState;
     ConfigureButtons;
     AtualizarRegistro;
    end;
  IDNO :
    begin
      exit;
    end;
  end;
end;

procedure TfrmRegJob.btnEditarClick(Sender: TObject);
begin
  inherited;
  frmListingJob.qryJob.Edit;
  ButtonsState;
  ConfigureButtons;
end;

procedure TfrmRegJob.btnNovoClick(Sender: TObject);
begin
  inherited;
  frmListingJob.qryJob.Insert;
  ButtonsState;
  ConfigureButtons;
end;

procedure TfrmRegJob.btnProximoClick(Sender: TObject);
begin
  inherited;
  frmListingJob.qryJob.Next;
  ButtonsState;
  ConfigureButtons;
end;

procedure TfrmRegJob.btnSalvarClick(Sender: TObject);
begin
  inherited;
  try
    frmListingJob.qryJob.Post;
    Application.MessageBox('Registro gravado com sucesso!', 'Confirmação', MB_ICONEXCLAMATION + MB_OK);
    ButtonsState;
    ConfigureButtons;
    AtualizarRegistro;
  except
    Application.MessageBox('NÃO FOI POSSÍVEL GRAVAR O REGISTRO. Reinicie o sistema', 'Falha', MB_ICONERROR + MB_OK);
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
