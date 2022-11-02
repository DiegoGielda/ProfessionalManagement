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
    mmRecordSheet: TMenuItem;
    mnRegistrationRecordSheet: TMenuItem;
    mnPerson: TMenuItem;
    procedure mnCompanyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnJobClick(Sender: TObject);
    procedure mnRegistrationTaskClick(Sender: TObject);
    procedure mnRegistrationAccountClick(Sender: TObject);
    procedure mnRegistrationRecordSheetClick(Sender: TObject);
    procedure mnPersonClick(Sender: TObject);
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
  formListingFinancialAccount,
  formListingRecordSheet, formListingPerson;

procedure TfrmMain.mnJobClick(Sender: TObject);
begin
  frmListingJob := TfrmListingJob.Create(Self);
  try
    frmListingJob.ShowModal;
  finally
    FreeAndNil(frmListingJob);
  end;
end;

procedure TfrmMain.mnPersonClick(Sender: TObject);
begin
  frmListingPerson := TfrmListingPerson.Create(Self);
  try
    frmListingPerson.ShowModal;
  finally
    FreeAndNil(frmListingPerson);
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

procedure TfrmMain.mnRegistrationRecordSheetClick(Sender: TObject);
begin
  frmListingRecordSheet := TfrmListingRecordSheet.Create(Self);
  try
    frmListingRecordSheet.ShowModal;
  finally
    FreeAndNil(frmListingRecordSheet);
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
  dmConnectionFD := TdmConnectionFD.Create(Self);
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
