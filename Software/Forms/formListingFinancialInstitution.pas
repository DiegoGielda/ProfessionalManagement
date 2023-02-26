unit formListingFinancialInstitution;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formDefaultListing, Data.DB, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmListingFinancialInstitution = class(TfrmDefaultListing)
    qryFinancialInstitution: TFDQuery;
    dsFinancialInstitution: TDataSource;
    qryFinancialInstitutionID_FINANCIAL_INSTITUTION: TIntegerField;
    qryFinancialInstitutionDESC_FINANCIAL_INSTITUTION: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure dbgPatternDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListingFinancialInstitution: TfrmListingFinancialInstitution;

implementation

uses
  dtmConnectionFD,
  formRegFinancialInstitution;

{$R *.dfm}

procedure TfrmListingFinancialInstitution.btnEditClick(Sender: TObject);
begin
  inherited;
  frmRegFinancialInstitution := TfrmRegFinancialInstitution.Create(Self);
  try
    frmRegFinancialInstitution.btnEdit.Click;
    frmRegFinancialInstitution.ShowModal;
  finally
    FreeAndNil(frmRegFinancialInstitution)
  end;
end;

procedure TfrmListingFinancialInstitution.btnNewClick(Sender: TObject);
begin
  inherited;
  frmRegFinancialInstitution := TfrmRegFinancialInstitution.Create(Self);
  try
    frmRegFinancialInstitution.btnNew.Click;
    frmRegFinancialInstitution.ShowModal;
  finally
    FreeAndNil(frmRegFinancialInstitution)
  end;
end;

procedure TfrmListingFinancialInstitution.dbgPatternDblClick(Sender: TObject);
begin
  inherited;
  frmRegFinancialInstitution := TfrmRegFinancialInstitution.Create(Self);
  try
    frmRegFinancialInstitution.btnEdit.Click;
    frmRegFinancialInstitution.ShowModal;
  finally
    FreeAndNil(frmRegFinancialInstitution)
  end;
end;

procedure TfrmListingFinancialInstitution.FormCreate(Sender: TObject);
begin
  inherited;
  qryFinancialInstitution.Active := false;
  qryFinancialInstitution.Active := true;
end;

procedure TfrmListingFinancialInstitution.FormShow(Sender: TObject);
begin
  inherited;
  qryFinancialInstitution.Close;
  qryFinancialInstitution.SQL.Clear;
  qryFinancialInstitution.SQL.Text :=
    ' select FI.ID_FINANCIAL_INSTITUTION, FI.DESCRIPTION as DESC_FINANCIAL_INSTITUTION ' + sLineBreak +
    ' from FINANCIAL_INSTITUTION as FI ' + sLineBreak +
    ' order by FI.ID_FINANCIAL_INSTITUTION ';
  qryFinancialInstitution.Open;
end;

end.
