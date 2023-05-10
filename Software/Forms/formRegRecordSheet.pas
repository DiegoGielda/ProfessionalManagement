unit formRegRecordSheet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formDefaultRegistrationDetail, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, dxGDIPlusClasses, Vcl.Buttons,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxDropDownEdit, cxCalendar, cxDBEdit, cxTextEdit, cxMaskEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Data.DB;

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
    procedure FormShow(Sender: TObject);
  private
    procedure ButtonsState;
    procedure ButtonsDetailsState;
  public

  end;

var
  frmRegRecordSheet: TfrmRegRecordSheet;

implementation

uses
  formListingRecordSheet;

{$R *.dfm}

{ TfrmRegRecordSheet }

procedure TfrmRegRecordSheet.btnCancelClick(Sender: TObject);
begin
  inherited;
  dbgPatternDetail.ReadOnly := True;
  if (frmListingRecordSheet.qryRecordSheet.State in [dsInsert, dsEdit]) then
  begin
    frmListingRecordSheet.qryRecordSheet.Cancel;
  end
  else
  begin
    frmListingRecordSheet.qryRecordSheetItemTime.Cancel;
  end;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, ['edtIDRecordSheet'], False);
end;

procedure TfrmRegRecordSheet.btnDeleteClick(Sender: TObject);
begin
  inherited;
  case Application.MessageBox('Deseja excluir o Registro ?', 'Excluir Registro', MB_YESNO + MB_ICONQUESTION) of
    IDYES :
    begin
      frmListingRecordSheet.qryRecordSheet.Delete;
      ShowMessage('O Registro foi excluido');
      frmListingRecordSheet.qryRecordSheet.Refresh;
      frmListingRecordSheet.qryRecordSheetItemTime.Refresh;
      ButtonsState;
      ConfigureButtons;
      ChangeStateFields(Self, ['edtIDRecordSheet'], False);
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
  if (frmListingRecordSheet.qryRecordSheet.State in [dsInsert, dsEdit]) then
  begin
    frmListingRecordSheet.qryRecordSheet.Post;
    ChangeStateFields(Self, ['edtIDRecordSheet'], False);
  end;
  frmListingRecordSheet.qryRecordSheetItemTime.Delete;
  ButtonsState;
  ButtonsDetailsState;
  ConfigureButtons;
end;

procedure TfrmRegRecordSheet.btnEditClick(Sender: TObject);
begin
  inherited;
  frmListingRecordSheet.qryRecordSheet.Edit;
  ButtonsState;
  ConfigureButtons;
  ChangeStateFields(Self, ['edtIDRecordSheet'], True);
end;

procedure TfrmRegRecordSheet.btnEditDetailClick(Sender: TObject);
begin
  inherited;
  if (frmListingRecordSheet.qryRecordSheet.State in [dsInsert, dsEdit]) then
  begin
    frmListingRecordSheet.qryRecordSheet.Post;
    ChangeStateFields(Self, ['edtIDRecordSheet'], False);
  end;
  frmListingRecordSheet.qryRecordSheetItemTime.Edit;
  ButtonsState;
  ConfigureButtons;
  dbgPatternDetail.ReadOnly := False;
end;

procedure TfrmRegRecordSheet.btnNewClick(Sender: TObject);
begin
  inherited;
  frmListingRecordSheet.qryRecordSheet.Append;
  ButtonsState;
  ButtonsDetailsState;
  ConfigureButtons;
  ChangeStateFields(Self, ['edtIDRecordSheet'], True);
end;

procedure TfrmRegRecordSheet.btnNewDetailClick(Sender: TObject);
begin
  inherited;
  if (frmListingRecordSheet.qryRecordSheet.State in [dsInsert, dsEdit]) then
  begin
    frmListingRecordSheet.qryRecordSheet.Post;
    ChangeStateFields(Self, ['edtIDRecordSheet'], False);
  end;
  frmListingRecordSheet.qryRecordSheetItemTime.Append;
  ButtonsState;
  ConfigureButtons;
  dbgPatternDetail.ReadOnly := False;
end;

procedure TfrmRegRecordSheet.btnNextClick(Sender: TObject);
begin
  inherited;
  frmListingRecordSheet.qryRecordSheet.Next;
  ButtonsState;
  ButtonsDetailsState;
  ConfigureButtons;
  ChangeStateFields(Self, ['edtIDRecordSheet'], False);
end;

procedure TfrmRegRecordSheet.btnPriorClick(Sender: TObject);
begin
  inherited;
  frmListingRecordSheet.qryRecordSheet.Prior;
  ButtonsState;
  ButtonsDetailsState;
  ConfigureButtons;
  ChangeStateFields(Self, ['edtIDRecordSheet'], False);
end;

procedure TfrmRegRecordSheet.btnSaveClick(Sender: TObject);
begin
  inherited;
  try
    if (frmListingRecordSheet.qryRecordSheet.State in [dsInsert, dsEdit]) then
    begin
      frmListingRecordSheet.qryRecordSheet.Post; // Master
      frmListingRecordSheet.qryRecordSheet.Refresh;
      ChangeStateFields(Self, ['edtIDRecordSheet'], False);
    end
    else
    if (frmListingRecordSheet.qryRecordSheetItemTime.State in [dsInsert, dsEdit]) then
    begin
      frmListingRecordSheet.qryRecordSheetItemTime.Post;  // Child
      frmListingRecordSheet.qryRecordSheetItemTime.Refresh;
      ButtonsDetailsState;
    end;
    dbgPatternDetail.ReadOnly := True;
    ButtonsState;
    ConfigureButtons;
    Application.MessageBox('Registro gravado com sucesso!', 'Confirmação', MB_ICONEXCLAMATION + MB_OK);
  except
    on E: EAbort do
    begin
      // Abort de uma exeção de conversao anterior
    end;
    on E: Exception do
    begin
      Application.MessageBox('NÃO FOI POSSÍVEL GRAVAR O REGISTRO. Reinicie o sistema', 'Falha', MB_ICONERROR + MB_OK);
    end;
  end;
end;

procedure TfrmRegRecordSheet.ButtonsDetailsState;
begin
  btnEditDetail.Enabled := (not frmListingRecordSheet.qryRecordSheetItemTime.IsEmpty);
  btnDeleteDetail.Enabled := btnEditDetail.Enabled;
end;

procedure TfrmRegRecordSheet.ButtonsState;
begin
  btnSave.Enabled := (frmListingRecordSheet.qryRecordSheet.State in [dsInsert, dsEdit]) or (frmListingRecordSheet.qryRecordSheetItemTime.State in [dsInsert, dsEdit]);
  btnCancel.Enabled := btnSave.Enabled;

  btnPrior.Enabled := (frmListingRecordSheet.qryRecordSheet.State in [dsBrowse]);
  btnNext.Enabled := btnPrior.Enabled;
  btnNew.Enabled := btnPrior.Enabled;
  btnEdit.Enabled := btnPrior.Enabled;
  btnDelete.Enabled := btnPrior.Enabled;
end;

procedure TfrmRegRecordSheet.FormShow(Sender: TObject);
begin
  inherited;
  ButtonsDetailsState;
end;

end.
