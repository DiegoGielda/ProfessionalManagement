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
    procedure dbgPadraoDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
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
  dmConnectionFD,
  formRegCompany;

procedure TfrmListingCompany.btnEditarClick(Sender: TObject);
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

procedure TfrmListingCompany.btnNovoClick(Sender: TObject);
begin
  inherited;
  frmRegCompany := TfrmRegCompany.Create(Self);
  try
    frmRegCompany.btnNew.Click;
    frmRegCompany.ShowModal;
  finally
    frmRegCompany.Free;
  end;
end;

procedure TfrmListingCompany.dbgPadraoDblClick(Sender: TObject);
begin
  inherited;
  frmRegCompany := TfrmRegCompany.Create(Self);
  try
    frmRegCompany.btnEdit.Click;
    frmRegCompany.ShowModal;
  finally
    frmRegCompany.Free;
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
  qryCompany.SQL.Add(' select COM.ID_COMPANY, COM.DESCRIPTION ');
  qryCompany.SQL.Add(' from COMPANY as COM ');
  qryCompany.Open;
end;

end.
