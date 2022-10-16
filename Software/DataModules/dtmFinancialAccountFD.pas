unit dtmFinancialAccountFD;

interface

uses
  System.SysUtils, System.Classes, dtmDefaultFD, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmFinancialAccountFD = class(TdmDefaultFD)
    dsFinancialAccountType: TDataSource;
    tableFinancialAccountType: TFDMemTable;
    tableFinancialAccountTypeID: TIntegerField;
    tableFinancialAccountTypeCODE: TStringField;
    tableFinancialAccountTypeDESCRIPTION: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure FillFinancialAccountType;
  public
    { Public declarations }
  end;

var
  dmFinancialAccountFD: TdmFinancialAccountFD;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmFinancialAccountFD }

procedure TdmFinancialAccountFD.DataModuleCreate(Sender: TObject);
begin
  inherited;
  FillFinancialAccountType;
end;

procedure TdmFinancialAccountFD.FillFinancialAccountType;
begin
  tableFinancialAccountType.Open;         // S-EXIT   E-PROHIBITED
  tableFinancialAccountType.Append;
  tableFinancialAccountTypeID.AsInteger := 1;
  tableFinancialAccountTypeCODE.AsString := 'S';
  tableFinancialAccountTypeDESCRIPTION.AsString := 'SAÍDA';

  tableFinancialAccountType.Append;
  tableFinancialAccountTypeID.AsInteger := 2;
  tableFinancialAccountTypeCODE.AsString := 'E';
  tableFinancialAccountTypeDESCRIPTION.AsString := 'ENTRADA';
  tableFinancialAccountType.Post;
end;

end.
