unit dtmConnectionFD;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB, FireDAC.Comp.UI,
  Data.DB, FireDAC.Comp.Client, FireDAC.VCLUI.Error;

type
  TdmConnectionFD = class(TDataModule)
    fdConnection: TFDConnection;
    fdCursor: TFDGUIxWaitCursor;
    fdDriver: TFDPhysFBDriverLink;
    fdErroDialog: TFDGUIxErrorDialog;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConnectionFD: TdmConnectionFD;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmConnectionFD.DataModuleCreate(Sender: TObject);
var
  lWay: string;
begin
  lWay := Copy(GetCurrentDir, 1, Pos('\ProfessionalManagement', GetCurrentDir));

  fdConnection.Params.Database := lWay + 'ProfessionalManagement\Database\ProfessionalManagement.FDB';
  fdDriver.VendorLib := lWay + 'ProfessionalManagement\Database\fbclient.dll';
  fdConnection.Params.UserName := 'sysdba';
  fdConnection.Params.Password := 'masterkey';
  fdConnection.Connected := true;
end;

end.
