unit formMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls;

type
  TfrmMain = class(TForm)
    MainMenu: TMainMenu;
    mnRegistration: TMenuItem;
    mnCompany: TMenuItem;
    pnlMain: TPanel;
    mnJob: TMenuItem;
    procedure mnCompanyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnJobClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  dmConnectionFD,
  formListingCompany,
  formListingJob;

procedure TfrmMain.mnJobClick(Sender: TObject);
begin
  frmListingJob := TfrmListingJob.Create(Self);
  try
    frmListingJob.ShowModal;
  finally
    FreeAndNil(frmListingJob);
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  try
    dtmConnectionFD := TdtmConnectionFD.Create(Self);
  except
    Application.Terminate;
    raise Exception.Create('Não foi possível iniciar a aplicação.');
  end;
end;

procedure TfrmMain.mnCompanyClick(Sender: TObject);
begin
  frmListingCompany := TfrmlistingCompany.Create(Self);
  try
    frmListingCompany.ShowModal;
  finally
    FreeAndNil(frmListingCompany);
  end;
end;

end.
