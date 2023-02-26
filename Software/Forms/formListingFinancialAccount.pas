unit formListingFinancialAccount;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formDefaultListing, Data.DB, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmListingFinancialAccount = class(TfrmDefaultListing)
    qryFinancialAccount: TFDQuery;
    dsFinancialAccount: TDataSource;
    qryFinancialAccountID_FINANCIAL_ACCOUNT: TIntegerField;
    qryFinancialAccountDESCRIPTION: TStringField;
    qryFinancialAccountTYPE_ACCOUNT: TStringField;
    qryFinancialAccountDATA_ACCOUNT: TDateField;
    qryFinancialAccountVALUE_ACCOUNT: TFMTBCDField;
    qryFinancialInstitution: TFDQuery;
    dsFinancialInstitution: TDataSource;
    qryFinancialInstitutionID_FINANCIAL_INSTITUTION: TIntegerField;
    qryFinancialInstitutionDESC_FINANCIAL_INSTITUTION: TStringField;
    qryFinancialAccountCD_FINANCIAL_INSTITUTION: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure dbgPatternDblClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryFinancialAccountTYPE_ACCOUNTGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure qryFinancialAccountNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListingFinancialAccount: TfrmListingFinancialAccount;

implementation

uses
  dtmConnectionFD,
  formRegFinancialAccount;

{$R *.dfm}

procedure TfrmListingFinancialAccount.btnEditClick(Sender: TObject);
begin
  inherited;
  frmRegFinancialAccount := TfrmRegFinancialAccount.Create(Self);
  try
    frmRegFinancialAccount.btnEdit.Click;
    frmRegFinancialAccount.ShowModal;
  finally
    FreeAndNil(frmRegFinancialAccount);
  end;
end;

procedure TfrmListingFinancialAccount.btnNewClick(Sender: TObject);
begin
  inherited;
  frmRegFinancialAccount := TfrmRegFinancialAccount.Create(Self);
  try
    frmRegFinancialAccount.btnNew.Click;
    frmRegFinancialAccount.ShowModal;
  finally
    FreeAndNil(frmRegFinancialAccount);
  end;
end;

procedure TfrmListingFinancialAccount.dbgPatternDblClick(Sender: TObject);
begin
  inherited;
  frmRegFinancialAccount := TfrmRegFinancialAccount.Create(Self);
  try
    frmRegFinancialAccount.btnEdit.Click;
    frmRegFinancialAccount.ShowModal;
  finally
    FreeAndNil(frmRegFinancialAccount);
  end;
end;

procedure TfrmListingFinancialAccount.FormCreate(Sender: TObject);
begin
  inherited;
  qryFinancialAccount.Active := false;
  qryFinancialAccount.Active := true;

  qryFinancialInstitution.Active := false;
  qryFinancialInstitution.Active := true;
end;

procedure TfrmListingFinancialAccount.FormShow(Sender: TObject);
begin
  inherited;
  qryFinancialAccount.Close;
  qryFinancialAccount.SQL.Clear;
  qryFinancialAccount.SQL.Text :=
    ' select FA.ID_FINANCIAL_ACCOUNT, FA.DESCRIPTION, FA.TYPE_ACCOUNT, FA.DATA_ACCOUNT, FA.VALUE_ACCOUNT, FA.CD_FINANCIAL_INSTITUTION ' + sLineBreak +
    ' from FINANCIAL_ACCOUNT FA ' + sLineBreak +
    ' order by FA.DATA_ACCOUNT, FA.TYPE_ACCOUNT, FA.VALUE_ACCOUNT desc ';
  qryFinancialAccount.Open;

  qryFinancialInstitution.Close;
  qryFinancialInstitution.SQL.Clear;
  qryFinancialInstitution.SQL.Text :=
    ' select FI.ID_FINANCIAL_INSTITUTION, FI.DESCRIPTION as DESC_FINANCIAL_INSTITUTION ' + sLineBreak +
    ' from FINANCIAL_INSTITUTION as FI ' + sLineBreak +
    ' order by FI.ID_FINANCIAL_INSTITUTION ';
  qryFinancialInstitution.Open;
end;

procedure TfrmListingFinancialAccount.qryFinancialAccountNewRecord(DataSet: TDataSet);
begin
  inherited;
  qryFinancialAccountTYPE_ACCOUNT.AsString := 'S';
  qryFinancialAccountDATA_ACCOUNT.AsDateTime := Date();
end;

procedure TfrmListingFinancialAccount.qryFinancialAccountTYPE_ACCOUNTGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  inherited;
  if (Sender.AsString = 'S') then
  begin
    Text := 'SAÍDA';
  end
  else
  if (Sender.AsString = 'E') then
  begin
    Text := 'ENTRADA';
  end;
end;

end.
