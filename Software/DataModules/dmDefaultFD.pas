unit dmDefaultFD;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdtmDefaultFD = class(TDataModule)
    qryMain: TFDQuery;
    dsMain: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmDefaultFD: TdtmDefaultFD;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  dmConnectionFD;

procedure TdtmDefaultFD.DataModuleCreate(Sender: TObject);
begin
  qryMain.Connection := dtmConnectionFD.fdConnection;
  qryMain.Close;

  dsMain.DataSet := qryMain.DataSource.DataSet;
end;

end.
