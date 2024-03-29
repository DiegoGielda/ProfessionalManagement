unit formListingCompany;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, formDefaultListing;

type
  TfrmListingCompany = class(TfrmDefaultListing)
    dsCompany: TDataSource;
    qryCompany: TFDQuery;
    qryCompanyID_COMPANY: TIntegerField;
    qryCompanyDESCRIPTION: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure dbgPatternDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListingCompany: TfrmListingCompany;

implementation

{$R *.dfm}

uses
  dtmConnectionFD,
  formRegCompany;

procedure TfrmListingCompany.btnEditClick(Sender: TObject);
begin
  inherited;
  frmRegCompany := TfrmRegCompany.Create(Self);
  try
    frmRegCompany.btnEdit.Click;
    frmRegCompany.ShowModal;
  finally
    FreeAndNil(frmRegCompany);
  end;
end;

procedure TfrmListingCompany.btnNewClick(Sender: TObject);
begin
  inherited;
  frmRegCompany := TfrmRegCompany.Create(Self);
  try
    frmRegCompany.btnNew.Click;
    frmRegCompany.ShowModal;
  finally
    FreeAndNil(frmRegCompany)
  end;
end;

procedure TfrmListingCompany.dbgPatternDblClick(Sender: TObject);
begin
  inherited;
  frmRegCompany := TfrmRegCompany.Create(Self);
  try
    frmRegCompany.btnEdit.Click;
    frmRegCompany.ShowModal;
  finally
    FreeAndNil(frmRegCompany)
  end;
end;

procedure TfrmListingCompany.FormCreate(Sender: TObject);
begin
  inherited;
  qryCompany.Active := false;
  qryCompany.Active := true;
end;

procedure TfrmListingCompany.FormShow(Sender: TObject);
begin
  inherited;
  qryCompany.Close;
  qryCompany.SQL.Clear;
  qryCompany.SQL.Text :=
    ' select COM.ID_COMPANY, COM.DESCRIPTION ' + sLineBreak +
    ' from COMPANY as COM ' + sLineBreak +
    ' order by COM.DESCRIPTION asc ';
  qryCompany.Open;
end;

end.
