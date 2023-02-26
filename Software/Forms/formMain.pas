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
    N1: TMenuItem;
    mnPrintFinancial: TMenuItem;
    mmPrintAcont: TMenuItem;
    mnFinacialInstitution: TMenuItem;
    mnOperation: TMenuItem;
    procedure mnCompanyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mnJobClick(Sender: TObject);
    procedure mnRegistrationTaskClick(Sender: TObject);
    procedure mnRegistrationAccountClick(Sender: TObject);
    procedure mnRegistrationRecordSheetClick(Sender: TObject);
    procedure mnPersonClick(Sender: TObject);
    procedure mmPrintAcontClick(Sender: TObject);
    procedure mnFinacialInstitutionClick(Sender: TObject);
    procedure mnOperationClick(Sender: TObject);
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
  formListingRecordSheet,
  formListingPerson,
  formListingFinancialInstitution,
  formListingOperation,
  reportDefaultFR;

procedure TfrmMain.mnJobClick(Sender: TObject);
begin
  frmListingJob := TfrmListingJob.Create(Self);
  try
    frmListingJob.ShowModal;
  finally
    FreeAndNil(frmListingJob);
  end;
end;

procedure TfrmMain.mnOperationClick(Sender: TObject);
begin
  frmListingOperation := TfrmListingOperation.Create(Self);
  try
    frmListingOperation.ShowModal;
  finally
    FreeAndNil(frmListingOperation);
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
  try
    dmConnectionFD := TdmConnectionFD.Create(Self);
    dmConnectionFD.fdConnection.Connected := true;
  except
    on E: Exception do
    begin
      ShowMessage('Verifique sua configuração no arquivo config.INI' + #13 + #13 + 'Erro: ' + E.Message);
      Application.Terminate;
    end;
  end; 
end;

procedure TfrmMain.mmPrintAcontClick(Sender: TObject);
begin
  rptDefaultFR := TrptDefaultFR.Create(Self);
  try
    rptDefaultFR.ShowModal;
  finally
    FreeAndNil(rptDefaultFR);
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

procedure TfrmMain.mnFinacialInstitutionClick(Sender: TObject);
begin
  frmListingFinancialInstitution := TfrmListingFinancialInstitution.Create(Self);
  try
    frmListingFinancialInstitution.ShowModal;
  finally
    FreeAndNil(frmListingFinancialInstitution);
  end;
end;

end.
