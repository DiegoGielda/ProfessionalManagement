unit reportDefaultFR;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls;

type
  TrptDefaultFR = class(TForm)
    plnFilters: TPanel;
    pnlButtons: TPanel;
    btnBack: TSpeedButton;
    SpeedButton1: TSpeedButton;
    pnlReportTitle: TPanel;
    lblReportTitle: TLabel;
    procedure btnBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rptDefaultFR: TrptDefaultFR;

implementation

{$R *.dfm}

procedure TrptDefaultFR.btnBackClick(Sender: TObject);
begin
  Self.Close;
end;

end.
