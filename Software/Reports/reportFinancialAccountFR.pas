unit reportFinancialAccountFR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, reportDefaultFR, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, frxClass, frxDBSet, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TrptFinancialAccountFR = class(TrptDefaultFR)
    qryPrintID_FINANCIAL_INSTITUTION: TIntegerField;
    qryPrintINSTITUTION_DESCRIPTION: TStringField;
    qryDetailAccount: TFDQuery;
    qryDetailAccountID_FINANCIAL_ACCOUNT: TIntegerField;
    qryDetailAccountCD_OPERATION: TIntegerField;
    qryDetailAccountOPERATION_DESCRIPTION: TStringField;
    qryDetailAccountTYPE_ACCOUNT: TStringField;
    qryDetailAccountDATA_ACCOUNT: TDateField;
    qryDetailAccountVALUE_ACCOUNT: TFMTBCDField;
    qryDetailAccountVALUE_ACCOUNT_MOVEMENT: TFMTBCDField;
    qryDetailAccountCD_FINANCIAL_INSTITUTION: TIntegerField;
    qryDetailAccountINSTITUTION_DESCRIPTION: TStringField;
    qryDetailAccountOBSERVATION_ACCOUNT: TStringField;
    frxDetailAccount: TfrxDBDataset;
    qryPrintVALUE_ACCOUNT_CURRENT: TFMTBCDField;
    procedure btnPrintOutClick(Sender: TObject);
  private
    { Private declarations }
    procedure ValidateFilter;
    procedure SQLReport(pQry: TFDQuery);
    procedure SQLReportDetailAccount(pQry: TFDQuery);
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

  SQLReportDetailAccount(qryDetailAccount);
  SQLReport(qryPrint);

  PrintOut(printReport, qryPrint);
end;

procedure TrptFinancialAccountFR.SQLReport(pQry: TFDQuery);
begin
  pQry.Close;
  pQry.SQL.Clear;
  pQry.SQL.Text :=
    ' select FI.ID_FINANCIAL_INSTITUTION, FI.DESCRIPTION as INSTITUTION_DESCRIPTION, ' + sLineBreak +
    '        (select sum(FA.VALUE_ACCOUNT_MOVEMENT) ' + sLineBreak +
    '         from FINANCIAL_ACCOUNT FA ' + sLineBreak +
    '         where (FA.CD_FINANCIAL_INSTITUTION = FI.ID_FINANCIAL_INSTITUTION)) as VALUE_ACCOUNT_CURRENT ' + sLineBreak +
    ' from FINANCIAL_INSTITUTION FI ' + sLineBreak +
    ' order by FI.DESCRIPTION asc ';
end;

procedure TrptFinancialAccountFR.SQLReportDetailAccount(pQry: TFDQuery);
begin
  pQry.Close;
  pQry.SQL.Clear;
  pQry.SQL.Text :=
    ' select FA.ID_FINANCIAL_ACCOUNT, FA.CD_OPERATION, OPE.DESCRIPTION as OPERATION_DESCRIPTION, FA.TYPE_ACCOUNT, ' + sLineBreak +
    '        FA.DATA_ACCOUNT, FA.VALUE_ACCOUNT, FA.VALUE_ACCOUNT_MOVEMENT, FA.CD_FINANCIAL_INSTITUTION, ' + sLineBreak +
    '        FI.DESCRIPTION as INSTITUTION_DESCRIPTION, FA.OBSERVATION as OBSERVATION_ACCOUNT ' + sLineBreak +
    ' from FINANCIAL_ACCOUNT FA ' + sLineBreak +
    ' inner join OPERATION OPE on (OPE.ID_OPERATION = FA.CD_OPERATION) ' + sLineBreak +
    ' inner join FINANCIAL_INSTITUTION FI on (FI.ID_FINANCIAL_INSTITUTION = FA.CD_FINANCIAL_INSTITUTION) ' + sLineBreak +
    ' where (FA.CD_FINANCIAL_INSTITUTION = :ID_FINANCIAL_INSTITUTION) ' + sLineBreak +
    ' order by FI.DESCRIPTION asc, FA.DATA_ACCOUNT asc, FA.TYPE_ACCOUNT asc, FA.VALUE_ACCOUNT desc   ';
end;

procedure TrptFinancialAccountFR.ValidateFilter;
begin
  // Quanto tiver filtros para validar.
end;

end.
