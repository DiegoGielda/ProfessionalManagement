unit formListingAttachmentDetach;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formDefaultListing, Data.DB, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmListingAttachmentDetach = class(TfrmDefaultListing)
    qryAttachmentDetach: TFDQuery;
    dsAttachmentDetach: TDataSource;
    qryAttachmentDetachATTACHMENT_DETACHED: TBlobField;
    qryAttachmentDetachATTACHMENT_DETACHED_NAME: TStringField;
    qryAttachmentDetachASSIGNED: TStringField;
    qryAttachmentDetachCD_ATTACHMENT_DETACHED_GROUP: TIntegerField;
    qryAttachmentDetachGROUP_ATTACHMENT: TStringField;
    qryAttachmentGroup: TFDQuery;
    qryAttachmentGroupID_ATTACHMENT_DETACHED_GROUP: TIntegerField;
    qryAttachmentGroupDESC_ATTACHMENT_GROUP: TStringField;
    dsAttachmentGroup: TDataSource;
    procedure btnNewClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure dbgPatternDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListingAttachmentDetach: TfrmListingAttachmentDetach;

implementation

uses
  dtmConnectionFD,
  formRegAttachmentDetach;

{$R *.dfm}

procedure TfrmListingAttachmentDetach.btnEditClick(Sender: TObject);
begin
  inherited;
  frmRegAttachmentDetach := TfrmRegAttachmentDetach.Create(Self);
  try
    frmRegAttachmentDetach.btnEdit.Click;
    frmRegAttachmentDetach.ShowModal;
  finally
    FreeAndNil(frmRegAttachmentDetach)
  end;
end;

procedure TfrmListingAttachmentDetach.btnNewClick(Sender: TObject);
begin
  inherited;
  frmRegAttachmentDetach := TfrmRegAttachmentDetach.Create(Self);
  try
    frmRegAttachmentDetach.btnNew.Click;
    frmRegAttachmentDetach.ShowModal;
  finally
    FreeAndNil(frmRegAttachmentDetach)
  end;
end;

procedure TfrmListingAttachmentDetach.dbgPatternDblClick(Sender: TObject);
begin
  inherited;
  frmRegAttachmentDetach := TfrmRegAttachmentDetach.Create(Self);
  try
    frmRegAttachmentDetach.btnEdit.Click;
    frmRegAttachmentDetach.ShowModal;
  finally
    FreeAndNil(frmRegAttachmentDetach)
  end;
end;

procedure TfrmListingAttachmentDetach.FormCreate(Sender: TObject);
begin
  inherited;
  qryAttachmentDetach.Active := False;
  qryAttachmentDetach.Active := True;
end;

procedure TfrmListingAttachmentDetach.FormShow(Sender: TObject);
begin
  inherited;
  qryAttachmentDetach.Close;
  qryAttachmentDetach.SQL.Clear;
  qryAttachmentDetach.SQL.Text :=
    ' select ATT_DET.ID_ATTACHMENT_DETACHED, ATT_DET.ATTACHMENT_DETACHED, ATT_DET.ATTACHMENT_DETACHED_NAME, ATT_DET.ASSIGNED, ' + sLineBreak +
    '        ATT_DET.CD_ATTACHMENT_DETACHED_GROUP, ATT_GROUP.DESCRIPTION as GROUP_ATTACHMENT ' + sLineBreak +
    ' from ATTACHMENT_DETACHED ATT_DET ' + sLineBreak +
    ' inner join ATTACHMENT_DETACHED_GROUP ATT_GROUP on (ATT_GROUP.ID_ATTACHMENT_DETACHED_GROUP = ATT_DET.CD_ATTACHMENT_DETACHED_GROUP) ' + sLineBreak +
    ' order by ATT_GROUP.DESCRIPTION asc ';
  qryAttachmentDetach.Open;

  qryAttachmentGroup.Close;
  qryAttachmentGroup.SQL.Clear;
  qryAttachmentGroup.SQL.Text :=
    ' select ATT_GROUP.ID_ATTACHMENT_DETACHED_GROUP, ATT_GROUP.DESCRIPTION as DESC_ATTACHMENT_GROUP ' + sLineBreak +
    ' from ATTACHMENT_DETACHED_GROUP ATT_GROUP ' + sLineBreak +
    ' order by ATT_GROUP.DESCRIPTION ';
  qryAttachmentGroup.Open;
end;

end.
