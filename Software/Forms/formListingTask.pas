unit formListingTask;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formDefaultListing, Data.DB, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmListingTask = class(TfrmDefaultListing)
    qryTask: TFDQuery;
    dsTask: TDataSource;
    qryTaskID_TASK: TIntegerField;
    qryTaskDESCRIPTION: TStringField;
    qryTaskSTATE: TStringField;
    qryTaskREMARK: TStringField;
    qryTaskPERIOD: TStringField;
    qryTaskCONTEXT: TStringField;
    qryTaskDATE_REGISTRATION: TDateField;
    qryTaskDATE_TO_DO: TDateField;
    qryTaskDATE_CONCLUDED: TDateField;
    procedure btnEditClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure dbgPatternDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qryTaskSTATEGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure qryTaskPERIODGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure qryTaskCONTEXTGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListingTask: TfrmListingTask;

implementation

{$R *.dfm}

uses
  dtmconnectionFD,
  formRegTask;

procedure TfrmListingTask.btnEditClick(Sender: TObject);
begin
  inherited;
  frmRegTask := TfrmRegTask.Create(Self);
  try
    frmRegTask.btnEdit.Click;
    frmRegTask.ShowModal;
  finally
    FreeAndNil(frmRegTask)
  end;
end;

procedure TfrmListingTask.btnNewClick(Sender: TObject);
begin
  inherited;
  frmRegTask := TfrmRegTask.Create(Self);
  try
    frmRegTask.btnNew.Click;
    frmRegTask.ShowModal;
  finally
    frmRegTask.Free;
  end;
end;

procedure TfrmListingTask.dbgPatternDblClick(Sender: TObject);
begin
  inherited;
  frmRegTask := TfrmRegTask.Create(Self);
  try
    frmRegTask.btnEdit.Click;
    frmRegTask.ShowModal;
  finally
    frmRegTask.Free;
  end;
end;

procedure TfrmListingTask.FormCreate(Sender: TObject);
begin
  inherited;
  qryTask.Active := false;
  qryTask.Active := true;
end;

procedure TfrmListingTask.FormShow(Sender: TObject);
begin
  inherited;
  qryTask.Close;
  qryTask.SQL.Clear;
  qryTask.SQL.Add(' select T.ID_TASK, T.DESCRIPTION, T.STATE, T.REMARK, T.PERIOD, T.CONTEXT, T.DATE_REGISTRATION, T.DATE_TO_DO, ');
  qryTask.SQL.Add('   T.DATE_CONCLUDED ');
  qryTask.SQL.Add(' from TASK as T ');
  qryTask.Open;
end;

procedure TfrmListingTask.qryTaskCONTEXTGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  inherited;
  if (Sender.AsString = 'H') then
  begin
    Text := 'CASA';
  end
  else
  if (Sender.AsString = 'W') then
  begin
    Text := 'TRABALHO';
  end
  else
  if (Sender.AsString = 'C') then
  begin
    Text := 'CURSO';
  end
  else
  if (Sender.AsString = 'F') then
  begin
    Text := 'FACULDADE';
  end
  else
  if (Sender.AsString = 'E') then
  begin
    Text := 'EMPREENDIMENTO';
  end;
end;

procedure TfrmListingTask.qryTaskPERIODGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  inherited;
  if (Sender.AsString = 'D') then
  begin
    Text := 'DIA';
  end
  else
  if (Sender.AsString = 'W') then
  begin
    Text := 'SEMANA';
  end
  else
  if (Sender.AsString = 'M') then
  begin
    Text := 'MONTH';
  end
  else
  if (Sender.AsString = 'Y') then
  begin
    Text := 'ANO';
  end;
end;

procedure TfrmListingTask.qryTaskSTATEGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  inherited;
  if (Sender.AsString = 'A') then
  begin
    Text := 'ATIVO';
  end
  else
  if (Sender.AsString = 'T') then
  begin
    Text := 'COMPLETADA';
  end
  else
  if (Sender.AsString = 'C') then
  begin
    Text := 'CANCELADO';
  end;
end;

end.
