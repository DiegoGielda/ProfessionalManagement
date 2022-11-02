unit formListingPerson;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formDefaultListing, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmListingPerson = class(TfrmDefaultListing)
    qryPerson: TFDQuery;
    dsPerson: TDataSource;
    qryPersonID_PERSON: TIntegerField;
    qryPersonNAME: TStringField;
    qryPersonCPF: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgPatternDblClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListingPerson: TfrmListingPerson;

implementation

uses
  dtmConnectionFD,
  formRegPerson;

{$R *.dfm}

procedure TfrmListingPerson.btnEditClick(Sender: TObject);
begin
  inherited;
  frmRegPerson := TfrmRegPerson.Create(Self);
  try
    frmRegPerson.btnEdit.Click;
    frmRegPerson.ShowModal;
  finally
    FreeAndNil(frmRegPerson)
  end;
end;

procedure TfrmListingPerson.btnNewClick(Sender: TObject);
begin
  inherited;
  frmRegPerson := TfrmRegPerson.Create(Self);
  try
    frmRegPerson.btnNew.Click;
    frmRegPerson.ShowModal;
  finally
    FreeAndNil(frmRegPerson)
  end;
end;

procedure TfrmListingPerson.dbgPatternDblClick(Sender: TObject);
begin
  inherited;
  frmRegPerson := TfrmRegPerson.Create(Self);
  try
    frmRegPerson.btnEdit.Click;
    frmRegPerson.ShowModal;
  finally
    FreeAndNil(frmRegPerson)
  end;
end;

procedure TfrmListingPerson.FormCreate(Sender: TObject);
begin
  inherited;
  qryPerson.Active := false;
  qryPerson.Active := true;
end;

procedure TfrmListingPerson.FormShow(Sender: TObject);
begin
  inherited;
  qryPerson.Close;
  qryPerson.SQL.Clear;
  qryPerson.SQL.Add(' select P.ID_PERSON, P.NAME, P.CPF ');
  qryPerson.SQL.Add(' from PERSON as P ');
  qryPerson.Open;
end;

end.
