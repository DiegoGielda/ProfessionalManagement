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
  if (not qryFinancialAccount.Active) then
  begin
    qryFinancialAccount.Active := true;
  end;
end;

procedure TfrmListingFinancialAccount.FormShow(Sender: TObject);
begin
  inherited;
  qryFinancialAccount.Close;
  qryFinancialAccount.SQL.Clear;
  qryFinancialAccount.SQL.Add(' select FA.ID_FINANCIAL_ACCOUNT, FA.DESCRIPTION, FA.TYPE_ACCOUNT, FA.DATA_ACCOUNT, FA.VALUE_ACCOUNT ');
  qryFinancialAccount.SQL.Add(' from FINANCIAL_ACCOUNT FA ');
  qryFinancialAccount.SQL.Add(' order by FA.DATA_ACCOUNT, FA.TYPE_ACCOUNT, FA.VALUE_ACCOUNT desc ');
  qryFinancialAccount.Open;
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
