unit formRegAttachmentGroup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formDefaultRegistration, dxGDIPlusClasses, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmRegAttachmentGroup = class(TfrmDefaultRegistration)
    edtIDAttachmentGroup: TDBEdit;
    lblIDAttachmentGroup: TLabel;
    edtDescriptionAttachmentGroup: TDBEdit;
    lblDescriptionAttachmentGroup: TLabel;
    edtPathAttachmentGroup: TDBEdit;
    lblPathAttachmentGroup: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
  private
    procedure ButtonsState;
    procedure UpdateRegistration;
  public
    { Public declarations }
  end;

var
  frmRegAttachmentGroup: TfrmRegAttachmentGroup;

implementation

uses
  formListingAttachmentGroup,
  Data.db;

{$R *.dfm}

{ TfrmRegAttachmentGroup }

procedure TfrmRegAttachmentGroup.btnCancelClick(Sender: TObject);
begin
  inherited;
  frmListingAttachmentGroup.qryAttachmentGroup.Cancel;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDAttachmentGroup', False);
end;

procedure TfrmRegAttachmentGroup.btnDeleteClick(Sender: TObject);
begin
  inherited;
  case Application.MessageBox('Deseja excluir o Grupo ?', 'Excluir Grupo', MB_YESNO + MB_ICONQUESTION) of
  IDYES :
    begin
     frmListingAttachmentGroup.qryAttachmentGroup.Delete;
     ShowMessage('O Grupo foi excluido');
     ButtonsState;
     ConfigureButtons;
     UpdateRegistration;
     ChangeStateFields(Self, 'edtIDAttachmentGroup', False);
    end;
  IDNO :
    begin
      exit;
    end;
  end;
end;

procedure TfrmRegAttachmentGroup.btnEditClick(Sender: TObject);
begin
  inherited;
  frmListingAttachmentGroup.qryAttachmentGroup.Edit;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDAttachmentGroup', True);
end;

procedure TfrmRegAttachmentGroup.btnNewClick(Sender: TObject);
begin
  inherited;
  frmListingAttachmentGroup.qryAttachmentGroup.Append;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDAttachmentGroup', True);
end;

procedure TfrmRegAttachmentGroup.btnNextClick(Sender: TObject);
begin
  inherited;
  frmListingAttachmentGroup.qryAttachmentGroup.Next;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDAttachmentGroup', False);
end;

procedure TfrmRegAttachmentGroup.btnPriorClick(Sender: TObject);
begin
  inherited;
  frmListingAttachmentGroup.qryAttachmentGroup.Prior;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDAttachmentGroup', False);
end;

procedure TfrmRegAttachmentGroup.btnSaveClick(Sender: TObject);
begin
  inherited;
  try
    frmListingAttachmentGroup.qryAttachmentGroup.Post;
    Application.MessageBox('Registro gravado com sucesso!', 'Confirmação', MB_ICONEXCLAMATION + MB_OK);
    ButtonsState;
    ConfigureButtons;
    UpdateRegistration;
  except
    Application.MessageBox('NÃO FOI POSSÍVEL GRAVAR O REGISTRO. Reinicie o sistema', 'Falha', MB_ICONERROR + MB_OK);
  end;
  ChangeStateFields(Self, 'edtIDAttachmentGroup', False);
end;

procedure TfrmRegAttachmentGroup.ButtonsState;
begin
  btnPrior.Enabled := frmListingAttachmentGroup.qryAttachmentGroup.State in [dsBrowse];
  btnNext.Enabled := frmListingAttachmentGroup.qryAttachmentGroup.State in [dsBrowse];
  btnSave.Enabled := frmListingAttachmentGroup.qryAttachmentGroup.State in [dsInsert, dsEdit];
  btnCancel.Enabled := frmListingAttachmentGroup.qryAttachmentGroup.State in [dsInsert, dsEdit];
  btnNew.Enabled := frmListingAttachmentGroup.qryAttachmentGroup.State in [dsBrowse];
  btnEdit.Enabled := frmListingAttachmentGroup.qryAttachmentGroup.State in [dsBrowse];
  btnDelete.Enabled := frmListingAttachmentGroup.qryAttachmentGroup.State in [dsbrowse];
end;

procedure TfrmRegAttachmentGroup.UpdateRegistration;
begin
  frmListingAttachmentGroup.qryAttachmentGroup.Refresh;
end;

end.
