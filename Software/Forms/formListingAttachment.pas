unit formListingAttachment;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formDefaultListing, Data.DB, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmListingAttachment = class(TfrmDefaultListing)
    qryAttachment: TFDQuery;
    dsAttachment: TDataSource;
    qryAttachmentID_ATTACHMENT: TIntegerField;
    qryAttachmentTABLE_NAME: TStringField;
    qryAttachmentTABLE_ID: TIntegerField;
    qryAttachmentATTACHMENT: TBlobField;
    qryAttachmentATTACHMENT_NAME: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FTableName: string;
    FTableID: Integer;
    procedure SetTableName(const Value: string);
    procedure SetTableID(const Value: Integer);
  public
    { Public declarations }
    property TableName: string write SetTableName;
    property TableID: Integer write SetTableID;
  end;

var
  frmListingAttachment: TfrmListingAttachment;

implementation

{$R *.dfm}

uses
  dtmConnectionFD;

procedure TfrmListingAttachment.FormCreate(Sender: TObject);
begin
  inherited;
  qryAttachment.Active := False;
  qryAttachment.Active := True;
end;

procedure TfrmListingAttachment.FormShow(Sender: TObject);
begin
  inherited;
  qryAttachment.Close;
  qryAttachment.SQL.Clear;
  qryAttachment.SQL.Text :=
    ' select ID_ATTACHMENT, TABLE_NAME, TABLE_ID, ATTACHMENT, ATTACHMENT_NAME ' + sLineBreak +
    ' from ATTACHMENT ' + sLineBreak +
    ' where ATT.TABLE_NAME = :TABLE_NAME and ' + sLineBreak +
    '       ATT.TABLE_ID = :TABLE_ID ';
  qryAttachment.ParamByName('TABLE_NAME').AsString := FTableName;
  qryAttachment.ParamByName('TABLE_ID').AsInteger := FTableID;
  qryAttachment.Open;
end;

procedure TfrmListingAttachment.SetTableID(const Value: Integer);
begin
  FTableID := Value;
end;

procedure TfrmListingAttachment.SetTableName(const Value: string);
begin
  FTableName := Value;
end;

end.
