program ProfessionalManagement;

uses
  Vcl.Forms,
  dtmConnectionFD in '..\DataModules\dtmConnectionFD.pas' {dmConnectionFD: TDataModule},
  dtmDefaultFD in '..\DataModules\dtmDefaultFD.pas' {dmDefaultFD: TDataModule},
  dtmFinancialAccountFD in '..\DataModules\dtmFinancialAccountFD.pas' {dmFinancialAccountFD: TDataModule},
  dtmTaskFD in '..\DataModules\dtmTaskFD.pas' {dmTaskFD: TDataModule},
  formDefaultListing in '..\Forms\formDefaultListing.pas' {frmDefaultListing},
  formDefault in '..\Forms\formDefault.pas' {frmDefault},
  formListingCompany in '..\Forms\formListingCompany.pas' {frmListingCompany},
  formListingFinancialAccount in '..\Forms\formListingFinancialAccount.pas' {frmListingFinancialAccount},
  formListingJob in '..\Forms\formListingJob.pas' {frmListingJob},
  formListingTask in '..\Forms\formListingTask.pas' {frmListingTask},
  formMain in '..\Forms\formMain.pas' {frmMain},
  formListingRecordSheet in '..\Forms\formListingRecordSheet.pas' {frmListingRecordSheet},
  formDefaultRegistration in '..\Forms\formDefaultRegistration.pas' {frmDefaultRegistration},
  formRegCompany in '..\Forms\formRegCompany.pas' {frmRegCompany},
  formRegTask in '..\Forms\formRegTask.pas' {frmRegTask},
  formRegFinancialAccount in '..\Forms\formRegFinancialAccount.pas' {frmRegFinancialAccount},
  formRegJob in '..\Forms\formRegJob.pas' {frmRegJob},
  formDefaultRegistrationDetail in '..\Forms\formDefaultRegistrationDetail.pas' {frmDefaultRegistrationDetail},
  formRegRecordSheet in '..\Forms\formRegRecordSheet.pas' {frmRegRecordSheet};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
