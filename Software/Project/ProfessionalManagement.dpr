program ProfessionalManagement;

uses
  Vcl.Forms,
  dmConnectionFD in '..\DataModules\dmConnectionFD.pas' {dtmConnectionFD: TDataModule},
  dmDefaultFD in '..\DataModules\dmDefaultFD.pas' {dtmDefaultFD: TDataModule},
  formDefaultListing in '..\Forms\formDefaultListing.pas' {frmDefaultListing},
  formDefaultRegistration in '..\Forms\formDefaultRegistration.pas' {frmDefaultRegistration},
  formListingCompany in '..\Forms\formListingCompany.pas' {frmListingCompany},
  formListingJob in '..\Forms\formListingJob.pas' {frmListingJob},
  formMain in '..\Forms\formMain.pas' {frmMain},
  formRegCompany in '..\Forms\formRegCompany.pas' {frmRegCompany},
  formRegJob in '..\Forms\formRegJob.pas' {frmRegJob};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
