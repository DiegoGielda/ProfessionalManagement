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
    FAttachmentPath: string;
    FAttachmentDetachPath: string;

    procedure ConfigDatabase;
  public
    property AttachmentPath: string read FAttachmentPath;
    property AttachmentDetachPath: string read FAttachmentDetachPath;
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
      lFileINI.WriteString('ProfessionalManagementConnection', 'database', lWay + '\ProfessionalManagement.FDB');
      lFileINI.WriteString('ProfessionalManagementConnection', 'user_name', 'SYSDBA');
      lFileINI.WriteString('ProfessionalManagementConnection', 'password', 'masterkey');
      lFileINI.WriteString('ProfessionalManagementConnection', 'fbclient', lWay + '\fbclient.dll');

      { TODO : Implementar correção de classe para arquivo de configuração,
        lembrar de criar a pasta Attachment caso ela não existir. }
      lFileINI.WriteString('ProfessionalManagementAttachment', 'attachment_path', lWay + '\Attachment\Record');
      lFileINI.WriteString('ProfessionalManagementAttachment', 'attachment_detach_path', lWay + '\Attachment\Detach');
    finally
      lFileINI.Free;
    end;
    ShowMessage('Configure o arquivo "Config.ini" corretamente.');
  end;

  lFileINI := TIniFile.create(GetCurrentDir + '\Config.ini');
  try
    fdConnection.Params.Database := lFileINI.ReadString('ProfessionalManagementConnection', 'database', '');
    fdConnection.Params.UserName := lFileINI.ReadString('ProfessionalManagementConnection', 'user_name', '');
    fdConnection.Params.Password := lFileINI.ReadString('ProfessionalManagementConnection', 'password', '');
    fdDriver.VendorLib := lFileINI.ReadString('ProfessionalManagementConnection', 'fbclient', '');

    FAttachmentPath := Trim(lFileINI.ReadString('ProfessionalManagementAttachment', 'attachment_path', ''));
    FAttachmentDetachPath := Trim(lFileINI.ReadString('ProfessionalManagementAttachment', 'attachment_detach_path', ''));
  finally
    lFileINI.Free;
  end;
end;

procedure TdmConnectionFD.DataModuleCreate(Sender: TObject);
begin
  ConfigDatabase;
end;

end.
