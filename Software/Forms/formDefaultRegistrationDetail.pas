unit formDefaultRegistrationDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, formDefaultRegistration, dxGDIPlusClasses, Vcl.ExtCtrls, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TfrmDefaultRegistrationDetail = class(TfrmDefaultRegistration)
    gridDetail: TGridPanel;
    gridDetailButtons: TGridPanel;
    dbgPatternDetail: TDBGrid;
    btnNewDetail: TSpeedButton;
    btnEditDetail: TSpeedButton;
    btnDeleteDetail: TSpeedButton;
    procedure dbgPatternDetailDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TDBGridPadrao = class(TDBGrid);

var
  frmDefaultRegistrationDetail: TfrmDefaultRegistrationDetail;

implementation

{$R *.dfm}

procedure TfrmDefaultRegistrationDetail.dbgPatternDetailDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 if Odd( dbgPatternDetail.DataSource.DataSet.RecNo) then
  begin
    dbgPatternDetail.Canvas.Brush.Color := $00E9E9E9;
  end
  else
  begin
    dbgPatternDetail.Canvas.Brush.Color := clWhite;
  end;

  if (gdSelected in State) then
  begin
    dbgPatternDetail.Canvas.Brush.Color := clRed;
    dbgPatternDetail.Canvas.Font.Color := clWhite;
    dbgPatternDetail.Canvas.Font.Style := [fsBold];
  end;

  dbgPatternDetail.Canvas.FillRect(Rect);
  dbgPatternDetail.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  dbgPatternDetail.Canvas.TextRect(Rect, Rect.Left + 8, Rect.Top + 0, Column.Field.DisplayText);
end;

procedure TfrmDefaultRegistrationDetail.FormShow(Sender: TObject);
begin
  inherited;
  TDBGridPadrao(dbgPatternDetail).DefaultRowHeight := 30;
  TDBGridPadrao(dbgPatternDetail).ClientHeight := (30  * TDBGridPadrao(dbgPatternDetail).RowCount) + 30;
end;

end.
