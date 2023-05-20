unit formListingCardInvoice;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formDefaultListing, Data.DB, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmListingCardInvoice = class(TfrmDefaultListing)
    qryCardInvoice: TFDQuery;
    dsCardInvoice: TDataSource;
    qryCardInvoiceID_CARD_INVOICE: TIntegerField;
    qryCardInvoiceINVOICE_DESCRIPTION: TStringField;
    qryCardInvoiceDATE_OPENING: TDateField;
    qryCardInvoiceDATE_CLOSURE: TDateField;
    qryCardInvoiceDATE_PAYMENT: TDateField;
    qryCardInvoiceACTIVE_RECORD: TStringField;
    qryCardInvoiceCD_FINANCIAL_INSTITUTION: TIntegerField;
    qryCardInvoiceINSTITUTION_DESCRIPTION: TStringField;
    qryCardInstitution: TFDQuery;
    dsCardInstitution: TDataSource;
    qryCardInstitutionID_INSTITUTION: TIntegerField;
    qryCardInstitutionINSTITUTION_DESC: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgPatternDblClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure qryCardInvoiceNewRecord(DataSet: TDataSet);
    procedure qryCardInvoiceCD_FINANCIAL_INSTITUTIONChange(Sender: TField);
    procedure qryCardInvoiceDATE_OPENINGChange(Sender: TField);
  private
    function FetchInstitutionInvoiceDate(pIDInstitution: Integer): TDateTime;
  public
    { Public declarations }
  end;

var
  frmListingCardInvoice: TfrmListingCardInvoice;

implementation

uses
  System.DateUtils,
  uTypeMonth,
  dtmConnectionFD,
  formRegCardInvoice;

{$R *.dfm}

procedure TfrmListingCardInvoice.btnEditClick(Sender: TObject);
begin
  inherited;
  frmRegCardInvoice := TfrmRegCardInvoice.Create(Self);
  try
    frmRegCardInvoice.btnEdit.Click;
    frmRegCardInvoice.ShowModal;
  finally
    FreeAndNil(frmRegCardInvoice)
  end;
end;

procedure TfrmListingCardInvoice.btnNewClick(Sender: TObject);
begin
  inherited;
  frmRegCardInvoice := TfrmRegCardInvoice.Create(Self);
  try
    frmRegCardInvoice.btnNew.Click;
    frmRegCardInvoice.ShowModal;
  finally
    FreeAndNil(frmRegCardInvoice);
  end;
end;

procedure TfrmListingCardInvoice.dbgPatternDblClick(Sender: TObject);
begin
  inherited;
  frmRegCardInvoice := TfrmRegCardInvoice.Create(Self);
  try
    frmRegCardInvoice.btnEdit.Click;
    frmRegCardInvoice.ShowModal;
  finally
    FreeAndNil(frmRegCardInvoice)
  end;
end;

procedure TfrmListingCardInvoice.FormCreate(Sender: TObject);
begin
  inherited;
  qryCardInvoice.Active := False;
  qryCardInvoice.Active := True;

  qryCardInstitution.Active := False;
  qryCardInstitution.Active := True;
end;

procedure TfrmListingCardInvoice.FormShow(Sender: TObject);
begin
  inherited;

  qryCardInvoice.Close;
  qryCardInvoice.SQL.Clear;
  qryCardInvoice.SQL.Text :=
    ' select CARD.ID_CARD_INVOICE, CARD.DESCRIPTION as INVOICE_DESCRIPTION, CARD.DATE_OPENING, CARD.DATE_CLOSURE, ' + sLineBreak +
    '        CARD.DATE_PAYMENT, CARD.ACTIVE_RECORD, CARD.CD_FINANCIAL_INSTITUTION, ' + sLineBreak +
    '        INSTITUTION.DESCRIPTION as INSTITUTION_DESCRIPTION ' + sLineBreak +
    ' from CARD_INVOICE CARD ' + sLineBreak +
    ' inner join FINANCIAL_INSTITUTION INSTITUTION on (INSTITUTION.ID_FINANCIAL_INSTITUTION = CARD.CD_FINANCIAL_INSTITUTION) ' + sLineBreak +
    ' order by CARD.DATE_PAYMENT asc, CARD.ACTIVE_RECORD desc ';
  qryCardInvoice.Open;

  qryCardInstitution.Close;
  qryCardInstitution.SQL.Clear;
  qryCardInstitution.SQL.Text :=
    ' select INSTITUTION.ID_FINANCIAL_INSTITUTION as ID_INSTITUTION, INSTITUTION.DESCRIPTION as INSTITUTION_DESC ' + sLineBreak +
    ' from FINANCIAL_INSTITUTION as INSTITUTION ' + sLineBreak +
    ' order by INSTITUTION.DESCRIPTION asc ';
  qryCardInstitution.Open;
end;

function TfrmListingCardInvoice.FetchInstitutionInvoiceDate(pIDInstitution: Integer): TDateTime;
var
  lSQLQuery: string;
  lDataSetResult: TDataSet;
begin
  Result := IncMonth(Date(), 1);
  try
    lSQLQuery :=
      ' select first 1 CARD.DATE_PAYMENT ' + sLineBreak +
      ' from CARD_INVOICE CARD ' + sLineBreak +
      ' where CARD.CD_FINANCIAL_INSTITUTION = ' + pIDInstitution.ToString + sLineBreak +
      ' order by CARD.DATE_PAYMENT desc ';

    dmConnectionFD.fdConnection.ExecSQL(lSQLQuery, lDataSetResult);
    if lDataSetResult.RecordCount > 0 then
    begin
      Result := IncMonth(lDataSetResult.FieldByName('DATE_PAYMENT').AsDateTime, 1);
    end;
  finally
    FreeAndNil(lDataSetResult);
  end;
end;

procedure TfrmListingCardInvoice.qryCardInvoiceCD_FINANCIAL_INSTITUTIONChange(Sender: TField);
begin
  inherited;
  qryCardInvoiceDATE_PAYMENT.AsDateTime := FetchInstitutionInvoiceDate(Sender.AsInteger);
end;

procedure TfrmListingCardInvoice.qryCardInvoiceDATE_OPENINGChange(Sender: TField);
var
  lDay, lMonth, lYear: Word;
begin
  inherited;
  DecodeDate(qryCardInvoiceDATE_OPENING.AsDateTime, lYear, lMonth, lDay);
  qryCardInvoiceINVOICE_DESCRIPTION.AsString := string.UpperCase('FATURA MÊS - ' + TTypeMonth(lMonth - 1).GetDescription + ' DE ' + IntToStr(lYear));
end;

procedure TfrmListingCardInvoice.qryCardInvoiceNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryCardInvoiceDATE_OPENING.AsDateTime := StartOfTheMonth(Date());
  qryCardInvoiceDATE_CLOSURE.AsDateTime := EndOfTheMonth(Date());
  qryCardInvoiceACTIVE_RECORD.AsString := 'Y';
end;

end.
