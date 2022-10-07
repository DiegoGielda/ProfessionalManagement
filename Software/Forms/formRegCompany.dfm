inherited frmRegCompany: TfrmRegCompany
  Caption = 'Cadastro de Empresa'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRegistration: TPanel
    object lblIDCompany: TLabel [0]
      Left = 25
      Top = 67
      Width = 12
      Height = 16
      Caption = 'ID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lblDescriptionCompany: TLabel [1]
      Left = 90
      Top = 69
      Width = 58
      Height = 16
      Caption = 'Descri'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object edtIDCompany: TDBEdit
      Left = 25
      Top = 88
      Width = 40
      Height = 24
      DataField = 'ID_COMPANY'
      DataSource = frmListingCompany.dsCompany
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edtDescriptionCompany: TDBEdit
      Left = 90
      Top = 88
      Width = 248
      Height = 24
      DataField = 'DESCRIPTION'
      DataSource = frmListingCompany.dsCompany
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
end
