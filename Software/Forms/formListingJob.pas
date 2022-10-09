unit formListingJob;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, formDefaultListing;

type
  TfrmListingJob = class(TfrmDefaultListing)
    qryJob: TFDQuery;
    dsJob: TDataSource;
    qryJobCompany: TFDQuery;
    dsJobCompany: TDataSource;
    qryJobCompanyID_COMPANY: TIntegerField;
    qryJobCompanyCOMPANY: TStringField;
    qryJobID_JOB: TIntegerField;
    qryJobJOB: TStringField;
    qryJobCD_COMPANY: TIntegerField;
    qryJobCOMPANY1: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure dbgPatternDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListingJob: TfrmListingJob;

implementation

{$R *.dfm}

uses
  dtmConnectionFD,
  formRegJob;

procedure TfrmListingJob.btnEditClick(Sender: TObject);
begin
  inherited;
  frmRegJob := TfrmRegJob.Create(Self);
  try
    frmRegJob.btnEdit.Click;
    frmRegJob.ShowModal;
  finally
    FreeAndNil(frmRegJob);
  end;
end;

procedure TfrmListingJob.btnNewClick(Sender: TObject);
begin
  inherited;
  frmRegJob := TfrmRegJob.Create(Self);
  try
    frmRegJob.btnNew.Click;
    frmRegJob.ShowModal;
  finally
    FreeAndNil(frmRegJob);
  end;
end;

procedure TfrmListingJob.dbgPatternDblClick(Sender: TObject);
begin
  inherited;
  frmRegJob := TfrmRegJob.Create(Self);
  try
    frmRegJob.btnEdit.Click;
    frmRegJob.ShowModal;
  finally
    FreeAndNil(frmRegJob);
  end;
end;

procedure TfrmListingJob.FormCreate(Sender: TObject);
begin
  inherited;
  qryJob.Active := false;
  qryJob.Active := true;

  qryJobCompany.Active := false;
  qryJobCompany.Active := true;
end;

procedure TfrmListingJob.FormShow(Sender: TObject);
begin
  inherited;
  qryJob.Close;
  qryJob.SQL.Clear;
  qryJob.SQL.Add(' select J.ID_JOB as ID_JOB, J.DESCRIPTION as JOB, J.CD_COMPANY as CD_COMPANY, COM.DESCRIPTION as COMPANY ');
  qryJob.SQL.Add(' from JOB as J ');
  qryJob.SQL.Add(' inner join COMPANY as COM on (COM.ID_COMPANY = J.CD_COMPANY) ');
  qryJob.Open;

  qryJobCompany.Close;
  qryJobCompany.SQL.Clear;
  qryJobCompany.SQL.Add(' select COM.ID_COMPANY as ID_COMPANY, COM.DESCRIPTION as COMPANY ');
  qryJobCompany.SQL.Add(' from COMPANY as COM ');
  qryJobCompany.Open;
end;

end.
