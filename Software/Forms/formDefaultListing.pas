unit formDefaultListing;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmDefaultListing = class(TForm)
    dbgPattern: TDBGrid;
    pnlHeader: TPanel;
    btnEdit: TSpeedButton;
    btnNew: TSpeedButton;
    procedure dbgPatternDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TDBGridPadrao = class(TDBGrid);

var
  frmDefaultListing: TfrmDefaultListing;

implementation

{$R *.dfm}

procedure TfrmDefaultListing.dbgPatternDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Odd( dbgPattern.DataSource.DataSet.RecNo) then
  begin
    dbgPattern.Canvas.Brush.Color := $00E9E9E9;
  end
  else
  begin
    dbgPattern.Canvas.Brush.Color := clWhite;
  end;

  if (gdSelected in State) then
  begin
    dbgPattern.Canvas.Brush.Color := clRed;
    dbgPattern.Canvas.Font.Color := clWhite;
    dbgPattern.Canvas.Font.Style := [fsBold];
  end;

  dbgPattern.Canvas.FillRect(Rect);
  dbgPattern.DefaultDrawColumnCell(Rect, DataCol, Column, State);

  dbgPattern.Canvas.TextRect(Rect, Rect.Left + 8, Rect.Top + 0, Column.Field.DisplayText);
end;

procedure TfrmDefaultListing.FormShow(Sender: TObject);
begin
  inherited;
  TDBGridPadrao(dbgPattern).DefaultRowHeight := 30;
  TDBGridPadrao(dbgPattern).ClientHeight := (30  * TDBGridPadrao(dbgPattern).RowCount) + 30;
end;

end.
