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
  lFileINI: TIniFile;
  lWay: string;
begin
  lWay := '';
  if not FileExists('Config.ini') then
  begin
    lWay := GetCurrentDir;
    lFileINI := TIniFile.create(lWay + '\Config.ini');
    try
      lFileINI.WriteString('ProfessionalManagement', 'database', lWay + '\ProfessionalManagement.FDB');
      lFileINI.WriteString('ProfessionalManagement', 'user_name', 'SYSDBA');
      lFileINI.WriteString('ProfessionalManagement', 'password', 'masterkey');
      lFileINI.WriteString('ProfessionalManagement', 'fbclient', lWay + '\fbclient.dll');
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
end;

procedure TdmConnectionFD.DataModuleCreate(Sender: TObject);
begin
  ConfigDatabase;
end;

end.
