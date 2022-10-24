unit formRegRecordSheet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formDefaultRegistrationDetail, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, dxGDIPlusClasses, Vcl.Buttons,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxDropDownEdit, cxCalendar, cxDBEdit, cxTextEdit, cxMaskEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TfrmRegRecordSheet = class(TfrmDefaultRegistrationDetail)
    lblIDRecordSheet: TLabel;
    edtIDRecordSheet: TDBEdit;
    lblPersonEmployeeRecordSheet: TLabel;
    lookPersonEmployeeRecordSheet: TcxDBLookupComboBox;
    lblDateRecordRecordSheet: TLabel;
    edtDateRecordRecordSheet: TcxDBDateEdit;
    procedure btnCancelClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnNewDetailClick(Sender: TObject);
    procedure btnEditDetailClick(Sender: TObject);
    procedure btnDeleteDetailClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ButtonsState;
    procedure UpdateRegistration;
  end;

var
  frmRegRecordSheet: TfrmRegRecordSheet;

implementation

uses
  formListingRecordSheet;
  //Data.db;

{$R *.dfm}

{ TfrmRegRecordSheet }

procedure TfrmRegRecordSheet.btnCancelClick(Sender: TObject);
begin
  inherited;
  frmListingRecordSheet.qryRecordSheet.Cancel;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDRecordSheet', False);
end;

procedure TfrmRegRecordSheet.btnDeleteClick(Sender: TObject);
begin
  inherited;
  case Application.MessageBox('Deseja excluir o Registro ?', 'Excluir Registro', MB_YESNO + MB_ICONQUESTION) of
    IDYES :
    begin
      frmListingRecordSheet.qryRecordSheet.Delete;
      //ShowMessage('O Registro foi excluido');
      ButtonsState;
      ConfigureButtons;
      UpdateRegistration;
      ChangeStateFields(Self, 'edtIDRecordSheet', False);
      frmRegRecordSheet.Close;
    end;
    IDNO :
    begin
      exit;
    end;
  end;
end;

procedure TfrmRegRecordSheet.btnDeleteDetailClick(Sender: TObject);
begin
  inherited;
  frmListingRecordSheet.qryRecordSheetItemTime.Delete;
  ButtonsState;
  ConfigureButtons;
  UpdateRegistration;
  ChangeStateFields(Self, 'edtIDRecordSheet', False);
end;

procedure TfrmRegRecordSheet.btnEditClick(Sender: TObject);
begin
  inherited;
  frmListingRecordSheet.qryRecordSheet.Edit;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDRecordSheet', True);
end;

procedure TfrmRegRecordSheet.btnEditDetailClick(Sender: TObject);
begin
  inherited;
  frmListingRecordSheet.qryRecordSheetItemTime.Edit;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDRecordSheet', True);
end;

procedure TfrmRegRecordSheet.btnNewClick(Sender: TObject);
begin
  inherited;
  frmListingRecordSheet.qryRecordSheet.Insert;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDRecordSheet', True);
end;

procedure TfrmRegRecordSheet.btnNewDetailClick(Sender: TObject);
begin
  inherited;
  frmListingRecordSheet.qryRecordSheetItemTime.Insert;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDRecordSheet', True);
end;

procedure TfrmRegRecordSheet.btnNextClick(Sender: TObject);
begin
  inherited;
  frmListingRecordSheet.qryRecordSheet.Next;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDRecordSheet', False);
end;

procedure TfrmRegRecordSheet.btnPriorClick(Sender: TObject);
begin
  inherited;
  frmListingRecordSheet.qryRecordSheet.Prior;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, 'edtIDRecordSheet', False);
end;

procedure TfrmRegRecordSheet.btnSaveClick(Sender: TObject);
begin
  inherited;
  try
    if (frmListingRecordSheet.qryRecordSheetItemTime.State in [dsInsert, dsEdit]) then
    begin
      frmListingRecordSheet.qryRecordSheet.edit;
      frmListingRecordSheet.qryRecordSheet.Post;
      frmListingRecordSheet.qryRecordSheetItemTime.Post;
    end
    else
    begin
      frmListingRecordSheet.qryRecordSheet.Post;
    end;
    //Application.MessageBox('Registro gravado com sucesso!', 'Confirmação', MB_ICONEXCLAMATION + MB_OK);
    ButtonsState;
    ConfigureButtons;
    UpdateRegistration;
    ChangeStateFields(Self, 'edtIDRecordSheet', False);
    frmRegRecordSheet.Close;
  except
    Application.MessageBox('NÃO FOI POSSÍVEL GRAVAR O REGISTRO. Reinicie o sistema', 'Falha', MB_ICONERROR + MB_OK);
  end;
end;

procedure TfrmRegRecordSheet.ButtonsState;
begin
  btnPrior.Enabled := (frmListingRecordSheet.qryRecordSheet.State in [dsBrowse]) or (frmListingRecordSheet.qryRecordSheetItemTime.State in [dsBrowse]);
  btnNext.Enabled := (frmListingRecordSheet.qryRecordSheet.State in [dsBrowse]) or (frmListingRecordSheet.qryRecordSheetItemTime.State in [dsBrowse]) ;
  btnSave.Enabled := (frmListingRecordSheet.qryRecordSheet.State in [dsInsert, dsEdit]) or (frmListingRecordSheet.qryRecordSheetItemTime.State in [dsInsert, dsEdit]) ;
  btnCancel.Enabled := (frmListingRecordSheet.qryRecordSheet.State in [dsInsert, dsEdit]) or (frmListingRecordSheet.qryRecordSheetItemTime.State in [dsInsert, dsEdit]) ;
  btnNew.Enabled := (frmListingRecordSheet.qryRecordSheet.State in [dsBrowse]) or (frmListingRecordSheet.qryRecordSheetItemTime.State in [dsBrowse]) ;
  btnEdit.Enabled := (frmListingRecordSheet.qryRecordSheet.State in [dsBrowse]) or (frmListingRecordSheet.qryRecordSheetItemTime.State in [dsBrowse]) ;
  btnDelete.Enabled := (frmListingRecordSheet.qryRecordSheet.State in [dsbrowse]) or (frmListingRecordSheet.qryRecordSheetItemTime.State in [dsBrowse]) ;
end;

procedure TfrmRegRecordSheet.UpdateRegistration;
begin
  frmListingRecordSheet.qryRecordSheet.Refresh;
  frmListingRecordSheet.qryRecordSheetItemTime.Refresh;
  frmListingRecordSheet.qryConRecordSheet.Refresh;
end;

end.
