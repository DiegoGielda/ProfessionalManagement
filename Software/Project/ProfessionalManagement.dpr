program ProfessionalManagement;

uses
  Vcl.Forms,
  dtmConnectionFD in '..\DataModules\dtmConnectionFD.pas' {dmConnectionFD: TDataModule},
  dtmDefaultFD in '..\DataModules\dtmDefaultFD.pas' {dmDefaultFD: TDataModule},
  dtmFinancialAccountFD in '..\DataModules\dtmFinancialAccountFD.pas' {dmFinancialAccountFD: TDataModule},
  dtmTaskFD in '..\DataModules\dtmTaskFD.pas' {dmTaskFD: TDataModule},
  formDefault in '..\Forms\formDefault.pas' {frmDefault},
  formDefaultListing in '..\Forms\formDefaultListing.pas' {frmDefaultListing},
  formDefaultRegistration in '..\Forms\formDefaultRegistration.pas' {frmDefaultRegistration},
  formDefaultRegistrationDetail in '..\Forms\formDefaultRegistrationDetail.pas' {frmDefaultRegistrationDetail},
  formListingAttachment in '..\Forms\formListingAttachment.pas' {frmListingAttachment},
  formListingCompany in '..\Forms\formListingCompany.pas' {frmListingCompany},
  formListingFinancialAccount in '..\Forms\formListingFinancialAccount.pas' {frmListingFinancialAccount},
  formListingFinancialInstitution in '..\Forms\formListingFinancialInstitution.pas' {frmListingFinancialInstitution},
  formListingJob in '..\Forms\formListingJob.pas' {frmListingJob},
  formListingOperation in '..\Forms\formListingOperation.pas' {frmListingOperation},
  formListingPerson in '..\Forms\formListingPerson.pas' {frmListingPerson},
  formListingRecordSheet in '..\Forms\formListingRecordSheet.pas' {frmListingRecordSheet},
  formListingTask in '..\Forms\formListingTask.pas' {frmListingTask},
  formMain in '..\Forms\formMain.pas' {frmMain},
  formPDFDevExpress in '..\Forms\formPDFDevExpress.pas' {frmPDFDevExpress},
  formRegCompany in '..\Forms\formRegCompany.pas' {frmRegCompany},
  formRegFinancialAccount in '..\Forms\formRegFinancialAccount.pas' {frmRegFinancialAccount},
  formRegFinancialInstitution in '..\Forms\formRegFinancialInstitution.pas' {frmRegFinancialInstitution},
  formRegJob in '..\Forms\formRegJob.pas' {frmRegJob},
  formRegOperation in '..\Forms\formRegOperation.pas' {frmRegOperation},
  formRegPerson in '..\Forms\formRegPerson.pas' {frmRegPerson},
  formRegRecordSheet in '..\Forms\formRegRecordSheet.pas' {frmRegRecordSheet},
  formRegTask in '..\Forms\formRegTask.pas' {frmRegTask},
  reportDefaultFR in '..\Reports\reportDefaultFR.pas' {rptDefaultFR},
  Vcl.Styles,
  Vcl.Themes;

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Turquoise Gray');
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
