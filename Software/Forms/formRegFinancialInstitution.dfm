inherited frmRegFinancialInstitution: TfrmRegFinancialInstitution
  Caption = 'Cadastro de Institui'#231#227'o Financeira'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRegistration: TPanel
    object lblIDFinancialInstitution: TLabel [0]
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
    inherited pnlHeader: TPanel
      inherited btnNew: TSpeedButton
        OnClick = btnNewClick
      end
      inherited btnSave: TSpeedButton
        OnClick = btnSaveClick
      end
      inherited btnEdit: TSpeedButton
        OnClick = btnEditClick
      end
      inherited btnNext: TSpeedButton
        OnClick = btnNextClick
      end
      inherited btnPrior: TSpeedButton
        OnClick = btnPriorClick
      end
      inherited btnCancel: TSpeedButton
        OnClick = btnCancelClick
      end
      inherited btnDelete: TSpeedButton
        OnClick = btnDeleteClick
      end
      inherited btnAttachment: TSpeedButton
        Visible = False
      end
    end
    object edtIDFinancialInstitution: TDBEdit
      Left = 25
      Top = 88
      Width = 40
      Height = 24
      DataField = 'ID_FINANCIAL_INSTITUTION'
      DataSource = frmListingFinancialInstitution.dsFinancialInstitution
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edtDescriptionFinancialinstitution: TDBEdit
      Left = 90
      Top = 88
      Width = 959
      Height = 24
      DataField = 'DESCRIPTION'
      DataSource = frmListingFinancialInstitution.dsFinancialInstitution
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
