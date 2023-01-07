unit formPDFDevExpress;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxPDFBase,
  dxPDFText, dxPDFRecognizedObject, dxPDFDocument, dxBarBuiltInMenu, dxCustomPreview, dxPDFDocumentViewer, dxPDFViewer;

type
  TfrmPDFDevExpress = class(TForm)
    pnlActionPDF: TPanel;
    btnScreenClose: TSpeedButton;
    viewPDF: TdxPDFViewer;
    procedure btnScreenCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPDFDevExpress: TfrmPDFDevExpress;

implementation

{$R *.dfm}

procedure TfrmPDFDevExpress.btnScreenCloseClick(Sender: TObject);
begin
  Self.Close;
end;

end.
