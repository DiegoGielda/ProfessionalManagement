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
    procedure ConfigDatabase;
  public
    { Public declarations }
  end;

var
  dmConnectionFD: TdmConnectionFD;

implementation

uses
  Vcl.Dialogs, IniFiles;

{$R *.dfm}

procedure TdmConnectionFD.ConfigDatabase;
var
{$IFDEF RELEASE}
  lFileINI: TIniFile;
{$ENDIF}
  lWay: string;
begin
  lWay := '';
{$IFDEF RELEASE}
  if not FileExists('Config.ini') then
  begin
    lWay := GetCurrentDir + '\Database\';
    lFileINI := TIniFile.create(GetCurrentDir + '\Config.ini');
    try
      lFileINI.WriteString('ProfessionalManagement', 'database', lWay + 'ProfessionalManagement.FDB');
      lFileINI.WriteString('ProfessionalManagement', 'user_name', 'SYSDBA');
      lFileINI.WriteString('ProfessionalManagement', 'password', 'masterkey');
      lFileINI.WriteString('ProfessionalManagement', 'fbclient', lWay + 'fbclient.dll');
    finally
      lFileINI.Free;
    end;
    ShowMessage('Configure o arquivo "Config.ini" corretamente.');
  end;

  lWay := Copy(GetCurrentDir, 1, Pos('\ProfessionalManagement', GetCurrentDir));
  lFileINI := TIniFile.create(GetCurrentDir + '\Config.ini');
  try
    fdConnection.Params.Database := lFileINI.ReadString('ProfessionalManagement', 'database', '');
    fdConnection.Params.UserName := lFileINI.ReadString('ProfessionalManagement', 'user_name', '');
    fdConnection.Params.Password := lFileINI.ReadString('ProfessionalManagement', 'password', '');
    fdDriver.VendorLib := lFileINI.ReadString('ProfessionalManagement', 'fbclient', '');
  finally
    lFileINI.Free;
  end;
{$ENDIF}
{$IFDEF DEBUG}
  lWay := Copy(GetCurrentDir, 1, Pos('\ProfessionalManagement', GetCurrentDir));
  fdConnection.Params.Database := lWay + 'ProfessionalManagement\Database\Development.FDB';
  fdDriver.VendorLib := lWay + 'ProfessionalManagement\Database\fbclient.dll';
  fdConnection.Params.UserName := 'sysdba';
  fdConnection.Params.Password := 'masterkey';
{$ENDIF}
end;

procedure TdmConnectionFD.DataModuleCreate(Sender: TObject);
begin
  try
    ConfigDatabase;
    fdConnection.Connected := true;
  except
    on E: Exception do
      ShowMessage('Verifique sua configuração no arquivo config.INI' + #13 + #13 + 'Erro: ' + E.Message );
  end;
end;

end.
