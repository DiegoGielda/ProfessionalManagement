unit dtmTaskFD;

interface

uses
  System.SysUtils, System.Classes, dtmDefaultFD, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmTaskFD = class(TdmDefaultFD)
    tableTaskState: TFDMemTable;
    dsTaskState: TDataSource;
    tableTaskStateID: TIntegerField;
    tableTaskStateCODE: TStringField;
    tableTaskStateDESCRIPTION: TStringField;
    tableTaskPeriod: TFDMemTable;
    dsTaskPeriod: TDataSource;
    tableTaskPeriodID: TIntegerField;
    tableTaskPeriodCODE: TStringField;
    tableTaskPeriodDESCRIPTION: TStringField;
    dsTaskContext: TDataSource;
    tableTaskContext: TFDMemTable;
    tableTaskContextID: TIntegerField;
    tableTaskContextCODE: TStringField;
    tableTaskContextDESCRIPTION: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure FillTaskState;
    procedure FillTaskPeriod;
    procedure FillTaskContext;
  public
    { Public declarations }
  end;

var
  dmTaskFD: TdmTaskFD;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmTaskFD.DataModuleCreate(Sender: TObject);
begin
  inherited;
  FillTaskState;
  FillTaskPeriod;
  FillTaskContext;
end;

procedure TdmTaskFD.FillTaskContext;
begin
  tableTaskContext.Open;        // H-HOUSE   W-WORK   C-COURSE   F-COLLAGE   E-ENTERPRISE
  tableTaskContext.Append;
  tableTaskContextID.AsInteger := 1;
  tableTaskContextCODE.AsString := 'H';
  tableTaskContextDESCRIPTION.AsString := 'CASA';

  tableTaskContext.Append;
  tableTaskContextID.AsInteger := 2;
  tableTaskContextCODE.AsString := 'W';
  tableTaskContextDESCRIPTION.AsString := 'TRABALHO';

  tableTaskContext.Append;
  tableTaskContextID.AsInteger := 3;
  tableTaskContextCODE.AsString := 'C';
  tableTaskContextDESCRIPTION.AsString := 'CURSO';

  tableTaskContext.Append;
  tableTaskContextID.AsInteger := 4;
  tableTaskContextCODE.AsString := 'F';
  tableTaskContextDESCRIPTION.AsString := 'FACULDADE';

  tableTaskContext.Append;
  tableTaskContextID.AsInteger := 5;
  tableTaskContextCODE.AsString := 'E';
  tableTaskContextDESCRIPTION.AsString := 'EMPREENDIMENTO';
  tableTaskContext.Post;
end;

procedure TdmTaskFD.FillTaskPeriod;
begin
  tableTaskPeriod.Open;        // D-DAY   W-WEEK   M-MONTH   Y-YEAR
  tableTaskPeriod.Append;
  tableTaskPeriodID.AsInteger := 1;
  tableTaskPeriodCODE.AsString := 'D';
  tableTaskPeriodDESCRIPTION.AsString := 'DIA';

  tableTaskPeriod.Append;
  tableTaskPeriodID.AsInteger := 2;
  tableTaskPeriodCODE.AsString := 'W';
  tableTaskPeriodDESCRIPTION.AsString := 'SEMANA';

  tableTaskPeriod.Append;
  tableTaskPeriodID.AsInteger := 3;
  tableTaskPeriodCODE.AsString := 'M';
  tableTaskPeriodDESCRIPTION.AsString := 'MÊS';

  tableTaskPeriod.Append;
  tableTaskPeriodID.AsInteger := 4;
  tableTaskPeriodCODE.AsString := 'Y';
  tableTaskPeriodDESCRIPTION.AsString := 'ANO';
  tableTaskPeriod.Post;
end;

procedure TdmTaskFD.FillTaskState;
begin
  {
  tableTaskState.FieldDefs.Add('ID', ftInteger);
  tableTaskState.FieldDefs.Add('CODE', ftString, 1);
  tableTaskState.FieldDefs.Add('DESCRIPTION', ftString, 10);
  tableTaskState.CreateDataSet;
  }

  tableTaskState.Open;         // A-ACTIVE   T-ACCOMPLISHED   C-CANCELED
  tableTaskState.Append;
  tableTaskStateID.AsInteger := 1;
  tableTaskStateCODE.AsString := 'A';
  tableTaskStateDESCRIPTION.AsString := 'ATIVA';

  tableTaskState.Append;
  tableTaskStateID.AsInteger := 2;
  tableTaskStateCODE.AsString := 'T';
  tableTaskStateDESCRIPTION.AsString := 'COMPLETADA';

  tableTaskState.Append;
  tableTaskStateID.AsInteger := 3;
  tableTaskStateCODE.AsString := 'C';
  tableTaskStateDESCRIPTION.AsString := 'CANCELADA';
  tableTaskState.Post;
end;

end.
