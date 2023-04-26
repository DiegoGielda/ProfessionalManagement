unit reportDefaultFR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, frxClass, frxDBSet, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TrptDefaultFR = class(TForm)
    plnFilters: TPanel;
    pnlButtons: TPanel;
    btnBack: TSpeedButton;
    btnPrintOut: TSpeedButton;
    pnlReportTitle: TPanel;
    lblReportTitle: TLabel;
    printReport: TfrxReport;
    qryPrint: TFDQuery;
    dsPrint: TfrxDBDataset;
    procedure btnBackClick(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure PrintOut(const pReport: TfrxReport); overload;
    procedure PrintOut(const pReport: TfrxReport; const pQueryMain: TFDQuery); overload;
  end;

var
  rptDefaultFR: TrptDefaultFR;

implementation

uses
  dtmConnectionFD;

{$R *.dfm}

procedure TrptDefaultFR.btnBackClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TrptDefaultFR.PrintOut(const pReport: TfrxReport);
begin
  pReport.ShowReport;
end;

procedure TrptDefaultFR.PrintOut(const pReport: TfrxReport; const pQueryMain: TFDQuery);
begin
  if not pQueryMain.Active then
    pQueryMain.Open;
  pReport.ShowReport;
end;

end.
