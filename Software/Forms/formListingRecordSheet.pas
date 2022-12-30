unit formListingRecordSheet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formDefaultListing, Data.DB, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmListingRecordSheet = class(TfrmDefaultListing)
    qryRecordSheet: TFDQuery;
    qryRecordSheetItemTime: TFDQuery;
    dsRecordSheet: TDataSource;
    dsRecordSheetItemTime: TDataSource;
    qryRecordSheetID_RECORD_SHEET: TIntegerField;
    qryRecordSheetCD_PERSON_EMPLOYEE: TIntegerField;
    qryRecordSheetDATE_RECORD: TDateField;
    qryRecordSheetItemTimeID_RECORD_SHEET_TIME: TIntegerField;
    qryRecordSheetItemTimeCD_RECORD_SHEET: TIntegerField;
    qryRecordSheetItemTimeTIME_START: TTimeField;
    qryRecordSheetItemTimeTIME_END: TTimeField;
    qryPersonEmployee: TFDQuery;
    dsPersonEmployee: TDataSource;
    qryPersonEmployeeID_PERSON_EMPLOYEE: TIntegerField;
    qryPersonEmployeeCD_PERSON: TIntegerField;
    qryPersonEmployeeCD_JOB: TIntegerField;
    qryPersonEmployeeDATE_ADMISSION: TDateField;
    qryPersonEmployeeENROLLMENT: TStringField;
    qryPersonEmployeePIS: TStringField;
    qryPersonEmployeeNAME: TStringField;
    qryRecordSheetTIME_DAY_TOTAL: TTimeField;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgPatternDblClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure qryRecordSheetNewRecord(DataSet: TDataSet);
    procedure qryRecordSheetTIME_DAY_TOTALGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListingRecordSheet: TfrmListingRecordSheet;

implementation

uses
  dtmConnectionFD,
  formRegRecordSheet;

{$R *.dfm}

procedure TfrmListingRecordSheet.btnEditClick(Sender: TObject);
begin
  inherited;
  frmRegRecordSheet := TfrmRegRecordSheet.Create(Self);
  try
    frmRegRecordSheet.btnEdit.Click;
    frmRegRecordSheet.ShowModal;
  finally
    FreeAndNil(frmRegRecordSheet);
  end;
end;

procedure TfrmListingRecordSheet.btnNewClick(Sender: TObject);
begin
  inherited;
  frmRegRecordSheet := TfrmRegRecordSheet.Create(Self);
  try
    frmRegRecordSheet.btnNew.Click;
    frmRegRecordSheet.ShowModal;
  finally
    FreeAndNil(frmRegRecordSheet);
  end;
end;

procedure TfrmListingRecordSheet.dbgPatternDblClick(Sender: TObject);
begin
  inherited;
  frmRegRecordSheet := TfrmRegRecordSheet.Create(Self);
  try
    frmRegRecordSheet.btnEdit.Click;
    frmRegRecordSheet.ShowModal;
  finally
    FreeAndNil(frmRegRecordSheet);
  end;
end;

procedure TfrmListingRecordSheet.FormCreate(Sender: TObject);
begin
  inherited;
  qryRecordSheet.Active := false;
  qryRecordSheet.Active := true;

  qryRecordSheetItemTime.Active := false;
  qryRecordSheetItemTime.Active := true;

  qryPersonEmployee.Active := false;
  qryPersonEmployee.Active := true;
end;

procedure TfrmListingRecordSheet.FormShow(Sender: TObject);
begin
  inherited;

  qryRecordSheet.Close;
  qryRecordSheet.SQL.Clear;
  qryRecordSheet.SQL.Text :=
    ' select R_SHEET.ID_RECORD_SHEET, R_SHEET.CD_PERSON_EMPLOYEE, R_SHEET.DATE_RECORD, R_SHEET.TIME_DAY_TOTAL ' + sLineBreak +
    ' from RECORD_SHEET as R_SHEET ';
  qryRecordSheet.Open;

  qryRecordSheetItemTime.Close;
  qryRecordSheetItemTime.SQL.Clear;
  qryRecordSheetItemTime.SQL.Text :=
    ' select RS_TIME.ID_RECORD_SHEET_TIME, RS_TIME.CD_RECORD_SHEET, RS_TIME.TIME_START, RS_TIME.TIME_END ' + sLineBreak +
    ' from RECORD_SHEET_TIME as RS_TIME ' + sLineBreak +
    ' where RS_TIME.CD_RECORD_SHEET = :ID_RECORD_SHEET ';
  qryRecordSheetItemTime.Open;

  qryPersonEmployee.Close;
  qryPersonEmployee.SQL.Text :=
    ' select P_EMP.ID_PERSON_EMPLOYEE, P_EMP.CD_PERSON, P_EMP.CD_JOB, P_EMP.DATE_ADMISSION, P_EMP.ENROLLMENT, P_EMP.PIS, PER.NAME ' + sLineBreak +
    ' from PERSON_EMPLOYEE as P_EMP ' + sLineBreak +
    ' inner join PERSON as PER on (PER.ID_PERSON = P_EMP.CD_PERSON) ';
  qryPersonEmployee.Open;
end;

procedure TfrmListingRecordSheet.qryRecordSheetNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryRecordSheetDATE_RECORD.AsDateTime := Date();
  qryRecordSheetCD_PERSON_EMPLOYEE.AsInteger := 1;
  qryRecordSheetTIME_DAY_TOTAL.AsString := '00:00:00';
end;

procedure TfrmListingRecordSheet.qryRecordSheetTIME_DAY_TOTALGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  inherited;
  if Sender.Value = '00:00:00' then
  begin
    Text := '';
  end
  else
  begin
    Text := Sender.Value;
  end;
end;

end.
