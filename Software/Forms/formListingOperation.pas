unit formListingOperation;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formDefaultListing, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmListingOperation = class(TfrmDefaultListing)
    qryOperation: TFDQuery;
    dsOperation: TDataSource;
    qryOperationID_OPERATION: TIntegerField;
    qryOperationDESC_OPERATION: TStringField;
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
  frmListingOperation: TfrmListingOperation;

implementation

uses
  dtmConnectionFD,
  formRegOperation;

{$R *.dfm}

procedure TfrmListingOperation.btnEditClick(Sender: TObject);
begin
  inherited;
  frmRegOperation := TfrmRegOperation.Create(Self);
  try
    frmRegOperation.btnEdit.Click;
    frmRegOperation.ShowModal;
  finally
    FreeAndNil(frmRegOperation)
  end;
end;

procedure TfrmListingOperation.btnNewClick(Sender: TObject);
begin
  inherited;
  frmRegOperation := TfrmRegOperation.Create(Self);
  try
    frmRegOperation.btnNew.Click;
    frmRegOperation.ShowModal;
  finally
    FreeAndNil(frmRegOperation)
  end;
end;

procedure TfrmListingOperation.dbgPatternDblClick(Sender: TObject);
begin
  inherited;
  frmRegOperation := TfrmRegOperation.Create(Self);
  try
    frmRegOperation.btnEdit.Click;
    frmRegOperation.ShowModal;
  finally
    FreeAndNil(frmRegOperation)
  end;
end;

procedure TfrmListingOperation.FormCreate(Sender: TObject);
begin
  inherited;
  qryOperation.Active := false;
  qryOperation.Active := true;
end;

procedure TfrmListingOperation.FormShow(Sender: TObject);
begin
  inherited;
  qryOperation.Close;
  qryOperation.SQL.Clear;
  qryOperation.SQL.Text :=
    ' select OP.ID_OPERATION, OP.DESCRIPTION as DESC_OPERATION ' + sLineBreak +
    ' from OPERATION as OP ' + sLineBreak +
    ' order by OP.ID_OPERATION ';
  qryOperation.Open;
end;

end.
