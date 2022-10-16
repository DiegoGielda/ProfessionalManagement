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
    mnTask: TMenuItem;
    mnRegistrationTask: TMenuItem;
    mnFinancial: TMenuItem;
    mnRegistrationAccount: TMenuItem;
    procedure mnCompanyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnJobClick(Sender: TObject);
    procedure mnRegistrationTaskClick(Sender: TObject);
    procedure mnRegistrationAccountClick(Sender: TObject);
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
  dtmConnectionFD,
  formListingCompany,
  formListingJob,
  formListingTask,
  formListingFinancialAccount;

procedure TfrmMain.mnJobClick(Sender: TObject);
begin
  frmListingJob := TfrmListingJob.Create(Self);
  try
    frmListingJob.ShowModal;
  finally
    FreeAndNil(frmListingJob);
  end;
end;

procedure TfrmMain.mnRegistrationAccountClick(Sender: TObject);
begin
  frmListingFinancialAccount := TfrmListingFinancialAccount.Create(Self);
  try
    frmListingFinancialAccount.ShowModal;
  finally
    FreeAndNil(frmListingFinancialAccount);
  end;
end;

procedure TfrmMain.mnRegistrationTaskClick(Sender: TObject);
begin
  frmListingTask := TfrmListingTask.Create(Self);
  try
    frmListingTask.ShowModal;
  finally
    FreeAndNil(frmListingTask);
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  try
    dmConnectionFD := TdmConnectionFD.Create(Self);
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
