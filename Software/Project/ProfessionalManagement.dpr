program ProfessionalManagement;

uses
  Vcl.Forms,
  dtmConnectionFD in '..\DataModules\dtmConnectionFD.pas' {dmConnectionFD: TDataModule},
  dtmDefaultFD in '..\DataModules\dtmDefaultFD.pas' {dmDefaultFD: TDataModule},
  dtmTaskFD in '..\DataModules\dtmTaskFD.pas' {dmTaskFD: TDataModule},
  formDefaultListing in '..\Forms\formDefaultListing.pas' {frmDefaultListing},
  formDefaultRegistration in '..\Forms\formDefaultRegistration.pas' {frmDefaultRegistration},
  formListingCompany in '..\Forms\formListingCompany.pas' {frmListingCompany},
  formListingJob in '..\Forms\formListingJob.pas' {frmListingJob},
  formListingTask in '..\Forms\formListingTask.pas' {frmListingTask},
  formMain in '..\Forms\formMain.pas' {frmMain},
  formRegCompany in '..\Forms\formRegCompany.pas' {frmRegCompany},
  formRegJob in '..\Forms\formRegJob.pas' {frmRegJob},
  formRegTask in '..\Forms\formRegTask.pas' {frmRegTask};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
