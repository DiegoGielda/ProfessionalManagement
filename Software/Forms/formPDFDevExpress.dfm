object frmPDFDevExpress: TfrmPDFDevExpress
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 338
  ClientWidth = 868
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object pnlActionPDF: TPanel
    Left = 0
    Top = 0
    Width = 868
    Height = 35
    Align = alTop
    TabOrder = 0
    DesignSize = (
      868
      35)
    object btnScreenClose: TSpeedButton
      Left = 400
      Top = 1
      Width = 90
      Height = 33
      Cursor = crHandPoint
      Anchors = []
      Caption = 'FECHAR'
      Font.Charset = ARABIC_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Roboto Th'
      Font.Pitch = fpVariable
      Font.Style = [fsBold, fsUnderline]
      Font.Quality = fqProof
      ParentFont = False
      OnClick = btnScreenCloseClick
    end
  end
  object viewPDF: TdxPDFViewer
    Left = 0
    Top = 35
    Width = 868
    Height = 303
    Align = alClient
  end
end
