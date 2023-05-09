unit formListingAttachmentGroup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formDefaultListing, Data.DB, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmListingAttachmentGroup = class(TfrmDefaultListing)
    qryAttachmentGroup: TFDQuery;
    dsAttachmentGroup: TDataSource;
    qryAttachmentGroupID_ATTACHMENT_DETACHED_GROUP: TIntegerField;
    qryAttachmentGroupDESCRIPTION: TStringField;
    qryAttachmentGroupPATH_GROUP: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgPatternDblClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListingAttachmentGroup: TfrmListingAttachmentGroup;

implementation

{$R *.dfm}

uses
  dtmConnectionFD,
  formRegAttachmentGroup;

procedure TfrmListingAttachmentGroup.btnEditClick(Sender: TObject);
begin
  inherited;
  frmRegAttachmentGroup := TfrmRegAttachmentGroup.Create(Self);
  try
    frmRegAttachmentGroup.btnEdit.Click;
    frmRegAttachmentGroup.ShowModal;
  finally
    FreeAndNil(frmRegAttachmentGroup)
  end;
end;

procedure TfrmListingAttachmentGroup.btnNewClick(Sender: TObject);
begin
  inherited;
  frmRegAttachmentGroup := TfrmRegAttachmentGroup.Create(Self);
  try
    frmRegAttachmentGroup.btnNew.Click;
    frmRegAttachmentGroup.ShowModal;
  finally
    FreeAndNil(frmRegAttachmentGroup)
  end;
end;

procedure TfrmListingAttachmentGroup.dbgPatternDblClick(Sender: TObject);
begin
  inherited;
  frmRegAttachmentGroup := TfrmRegAttachmentGroup.Create(Self);
  try
    frmRegAttachmentGroup.btnEdit.Click;
    frmRegAttachmentGroup.ShowModal;
  finally
    FreeAndNil(frmRegAttachmentGroup)
  end;
end;

procedure TfrmListingAttachmentGroup.FormCreate(Sender: TObject);
begin
  inherited;
  qryAttachmentGroup.Active := False;
  qryAttachmentGroup.Active := True;
end;

procedure TfrmListingAttachmentGroup.FormShow(Sender: TObject);
begin
  inherited;
  qryAttachmentGroup.Close;
  qryAttachmentGroup.SQL.Clear;
  qryAttachmentGroup.SQL.Text :=
    ' select ATT_GROUP.ID_ATTACHMENT_DETACHED_GROUP, ATT_GROUP.DESCRIPTION, ATT_GROUP.PATH_GROUP ' + sLineBreak +
    ' from ATTACHMENT_DETACHED_GROUP ATT_GROUP ' + sLineBreak +
    ' order by ATT_GROUP.DESCRIPTION asc ';
  qryAttachmentGroup.Open;
end;

end.
