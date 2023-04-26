unit reportFinancialAccountFR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, reportDefaultFR, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, frxClass, frxDBSet, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TrptFinancialAccountFR = class(TrptDefaultFR)
    qryPrintID_FINANCIAL_ACCOUNT: TIntegerField;
    qryPrintCD_OPERATION: TIntegerField;
    qryPrintOPERATION_DESCRIPTION: TStringField;
    qryPrintTYPE_ACCOUNT: TStringField;
    qryPrintDATA_ACCOUNT: TDateField;
    qryPrintVALUE_ACCOUNT: TFMTBCDField;
    qryPrintCD_FINANCIAL_INSTITUTION: TIntegerField;
    qryPrintINSTITUTION_DESCRIPTION: TStringField;
    qryPrintOBSERVATION_ACCOUNT: TStringField;
    qryPrintVALUE_ACCOUNT_TYPE: TFMTBCDField;
    procedure btnPrintOutClick(Sender: TObject);
  private
    { Private declarations }
    procedure SQLReport(pQry: TFDQuery);
    procedure ValidateFilter;
  public
    { Public declarations }
  end;

var
  rptFinancialAccountFR: TrptFinancialAccountFR;

implementation

{$R *.dfm}

procedure TrptFinancialAccountFR.btnPrintOutClick(Sender: TObject);
begin
  inherited;
  ValidateFilter;

  SQLReport(qryPrint);

  PrintOut(printReport, qryPrint);
end;

procedure TrptFinancialAccountFR.SQLReport(pQry: TFDQuery);
begin
  pQry.Close;
  pQry.SQL.Clear;
  pQry.SQL.Text :=
    ' select FA.ID_FINANCIAL_ACCOUNT, FA.CD_OPERATION, OPE.DESCRIPTION as OPERATION_DESCRIPTION, FA.TYPE_ACCOUNT, ' + sLineBreak +
    '        FA.DATA_ACCOUNT, FA.VALUE_ACCOUNT, FA.CD_FINANCIAL_INSTITUTION, FI.DESCRIPTION as INSTITUTION_DESCRIPTION, ' + sLineBreak +
    '        FA.OBSERVATION as OBSERVATION_ACCOUNT, ' + sLineBreak +
    '        case FA.TYPE_ACCOUNT ' + sLineBreak +
    '          when ''S'' then (FA.VALUE_ACCOUNT * -1) ' + sLineBreak +
    '          else FA.VALUE_ACCOUNT ' + sLineBreak +
    '        end as VALUE_ACCOUNT_TYPE ' + sLineBreak +
    ' from FINANCIAL_ACCOUNT FA ' + sLineBreak +
    ' inner join OPERATION OPE on (OPE.ID_OPERATION = FA.CD_OPERATION) ' + sLineBreak +
    ' inner join FINANCIAL_INSTITUTION FI on (FI.ID_FINANCIAL_INSTITUTION = FA.CD_FINANCIAL_INSTITUTION) ' + sLineBreak +
    ' order by FI.DESCRIPTION asc, FA.DATA_ACCOUNT asc, FA.TYPE_ACCOUNT asc, FA.VALUE_ACCOUNT desc ';
end;

procedure TrptFinancialAccountFR.ValidateFilter;
begin
  // Quanto tiver filtros para validar.
end;

end.
