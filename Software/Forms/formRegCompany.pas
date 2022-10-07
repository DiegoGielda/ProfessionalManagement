unit formRegCompany;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, dxGDIPlusClasses, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  formDefaultRegistration;

type
  TfrmRegCompany = class(TfrmDefaultRegistration)
    edtIDCompany: TDBEdit;
    edtDescriptionCompany: TDBEdit;
    lblIDCompany: TLabel;
    lblDescriptionCompany: TLabel;
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
    procedure EstadoBotoes;
    procedure AtualizarRegistro;
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

procedure TfrmRegCompany.AtualizarRegistro;
begin
  frmListingCompany.qryCompany.Refresh;
end;

procedure TfrmRegCompany.btnAnteriorClick(Sender: TObject);
begin
  inherited;
  frmListingCompany.qryCompany.Prior;
  EstadoBotoes;
  ConfigureButtons;
end;

procedure TfrmRegCompany.btnCancelarClick(Sender: TObject);
begin
  inherited;
  frmListingCompany.qryCompany.Cancel;
  EstadoBotoes;
  ConfigureButtons;
end;

procedure TfrmRegCompany.btnDeletarClick(Sender: TObject);
begin
  inherited;
  case Application.MessageBox('Deseja excluir o Empresa ?', 'Excluir Empresa', MB_YESNO + MB_ICONQUESTION) of
  IDYES :
    begin
     frmListingCompany.qryCompany.Delete;
     ShowMessage('O Empresa foi excluido');
     EstadoBotoes;
     ConfigureButtons;
     AtualizarRegistro;
    end;
  IDNO :
    begin
      exit;
    end;
  end;
end;

procedure TfrmRegCompany.btnEditarClick(Sender: TObject);
begin
  inherited;
  frmListingCompany.qryCompany.Edit;
  EstadoBotoes;
  ConfigureButtons;
end;

procedure TfrmRegCompany.btnNovoClick(Sender: TObject);
begin
  inherited;
  frmListingCompany.qryCompany.Insert;
  EstadoBotoes;
  ConfigureButtons;
end;

procedure TfrmRegCompany.btnProximoClick(Sender: TObject);
begin
  inherited;
  frmListingCompany.qryCompany.Next;
  EstadoBotoes;
  ConfigureButtons;
end;

procedure TfrmRegCompany.btnSalvarClick(Sender: TObject);
begin
  inherited;
  try
    frmListingCompany.qryCompany.Post;
    Application.MessageBox('Registro gravado com sucesso!', 'Confirmação', MB_ICONEXCLAMATION + MB_OK);
    EstadoBotoes;
    ConfigureButtons;
    AtualizarRegistro;
  except
    Application.MessageBox('NÃO FOI POSSÍVEL GRAVAR O REGISTRO. Reinicie o sistema', 'Falha', MB_ICONERROR + MB_OK);
  end;
end;

procedure TfrmRegCompany.EstadoBotoes;
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
