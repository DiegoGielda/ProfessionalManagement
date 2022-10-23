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
    dmRecordSheet: TDataSource;
    qryRecordSheetID_RECORD_SHEET: TIntegerField;
    qryRecordSheetCD_PERSON_EMPLOYEE: TIntegerField;
    qryRecordSheetDATE_RECORD: TDateField;
    qryRecordSheetID_RECORD_SHEET_TIME: TIntegerField;
    qryRecordSheetTIME_START: TTimeField;
    qryRecordSheetTIME_END: TTimeField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListingRecordSheet: TfrmListingRecordSheet;

implementation

uses
  dtmConnectionFD;

{$R *.dfm}

end.
