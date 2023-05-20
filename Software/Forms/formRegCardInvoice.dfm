inherited frmRegCardInvoice: TfrmRegCardInvoice
  Caption = 'Cadastro de Fatura de Cart'#227'o'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRegistration: TPanel
    object lblIDCard: TLabel [0]
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
    object lblDescriptionCard: TLabel [1]
      Left = 171
      Top = 117
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
    object lblInstitutionCard: TLabel [2]
      Left = 87
      Top = 67
      Width = 52
      Height = 16
      Caption = 'Intitui'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lblDateOpeningCard: TLabel [3]
      Left = 513
      Top = 70
      Width = 114
      Height = 16
      Caption = 'Data de Abertura'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lblDateClosureCard: TLabel [4]
      Left = 655
      Top = 70
      Width = 121
      Height = 16
      Caption = 'Data de Fechamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lblDatePaymentCard: TLabel [5]
      Left = 25
      Top = 119
      Width = 97
      Height = 16
      Caption = 'Data Pagamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lblActiveCardInvoice: TLabel [6]
      Left = 799
      Top = 70
      Width = 28
      Height = 16
      Caption = 'Ativo'
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
    end
    object edtIDCardInvoice: TDBEdit
      Left = 25
      Top = 88
      Width = 40
      Height = 24
      DataField = 'ID_CARD_INVOICE'
      DataSource = frmListingCardInvoice.dsCardInvoice
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edtDescriptionCard: TDBEdit
      Left = 171
      Top = 136
      Width = 604
      Height = 24
      DataField = 'INVOICE_DESCRIPTION'
      DataSource = frmListingCardInvoice.dsCardInvoice
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object lookDescriptionInstitution: TcxDBLookupComboBox
      Left = 87
      Top = 88
      AutoSize = False
      DataBinding.DataField = 'CD_FINANCIAL_INSTITUTION'
      DataBinding.DataSource = frmListingCardInvoice.dsCardInvoice
      Properties.KeyFieldNames = 'ID_INSTITUTION'
      Properties.ListColumns = <
        item
          Caption = 'ID'
          HeaderAlignment = taCenter
          MinWidth = 10
          Width = 10
          FieldName = 'ID_INSTITUTION'
        end
        item
          Caption = 'Institui'#231#227'o'
          HeaderAlignment = taRightJustify
          Width = 100
          FieldName = 'INSTITUTION_DESC'
        end>
      Properties.ListFieldIndex = 1
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = frmListingCardInvoice.dsCardInstitution
      TabOrder = 3
      Height = 24
      Width = 398
    end
    object edtDateOpeningCard: TcxDBDateEdit
      Left = 513
      Top = 88
      AutoSize = False
      DataBinding.DataField = 'DATE_OPENING'
      DataBinding.DataSource = frmListingCardInvoice.dsCardInvoice
      TabOrder = 4
      Height = 24
      Width = 121
    end
    object edtDateClosureCard: TcxDBDateEdit
      Left = 655
      Top = 88
      AutoSize = False
      DataBinding.DataField = 'DATE_CLOSURE'
      DataBinding.DataSource = frmListingCardInvoice.dsCardInvoice
      TabOrder = 5
      Height = 24
      Width = 121
    end
    object edtDatePaymentCard: TcxDBDateEdit
      Left = 25
      Top = 137
      AutoSize = False
      DataBinding.DataField = 'DATE_PAYMENT'
      DataBinding.DataSource = frmListingCardInvoice.dsCardInvoice
      TabOrder = 6
      Height = 24
      Width = 121
    end
    object lookActiveCardInvoice: TDBComboBox
      Left = 799
      Top = 89
      Width = 122
      Height = 22
      Style = csOwnerDrawFixed
      AutoDropDown = True
      DataField = 'ACTIVE_RECORD'
      DataSource = frmListingCardInvoice.dsCardInvoice
      Items.Strings = (
        'N'
        'Y')
      TabOrder = 7
    end
  end
end
