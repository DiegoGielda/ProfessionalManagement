inherited frmRegFinancialAccount: TfrmRegFinancialAccount
  Caption = 'Cadastro de Conta'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRegistration: TPanel
    object lblDateAccountFinancialAccount: TLabel [0]
      Left = 176
      Top = 132
      Width = 83
      Height = 16
      Caption = 'Data da Conta'
      FocusControl = edtDateAccountFinancialAccount
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lblObservationFinancialAccount: TLabel [1]
      Left = 25
      Top = 193
      Width = 68
      Height = 16
      Caption = 'Observa'#231#227'o'
      FocusControl = edtObservationFinancialAccount
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lblIDFinancialAccount: TLabel [2]
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
    object lblTypeFinancialAccount: TLabel [3]
      Left = 25
      Top = 132
      Width = 24
      Height = 16
      Caption = 'Tipo'
      FocusControl = lookTypeFinancialAccount
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lblValueAccountFinancialAccount: TLabel [4]
      Left = 322
      Top = 132
      Width = 29
      Height = 16
      Caption = 'Valor'
      FocusControl = edtValueAccountFinancialAccount
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lblDescriptionFinancialInstitution: TLabel [5]
      Left = 601
      Top = 69
      Width = 119
      Height = 16
      Caption = 'Insitui'#231#227'o Financeira'
      FocusControl = lookDescriptionFinancialInstitution
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lblDescriptionOperation: TLabel [6]
      Left = 90
      Top = 69
      Width = 56
      Height = 16
      Caption = 'Opera'#231#227'o'
      FocusControl = lookDescriptionOperation
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    inherited pnlHeader: TPanel
      TabOrder = 7
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
        OnClick = btnAttachmentClick
      end
    end
    object edtDateAccountFinancialAccount: TcxDBDateEdit
      Left = 176
      Top = 151
      AutoSize = False
      DataBinding.DataField = 'DATA_ACCOUNT'
      DataBinding.DataSource = frmListingFinancialAccount.dsFinancialAccount
      TabOrder = 4
      Height = 24
      Width = 127
    end
    object edtObservationFinancialAccount: TDBEdit
      Left = 25
      Top = 212
      Width = 776
      Height = 24
      DataField = 'OBSERVATION_ACCOUNT'
      DataSource = frmListingFinancialAccount.dsFinancialAccount
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object edtIDFinancialAccount: TDBEdit
      Left = 25
      Top = 88
      Width = 40
      Height = 24
      DataField = 'ID_FINANCIAL_ACCOUNT'
      DataSource = frmListingFinancialAccount.dsFinancialAccount
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edtValueAccountFinancialAccount: TDBEdit
      Left = 322
      Top = 151
      Width = 134
      Height = 24
      AutoSize = False
      DataField = 'VALUE_ACCOUNT'
      DataSource = frmListingFinancialAccount.dsFinancialAccount
      TabOrder = 5
    end
    object lookTypeFinancialAccount: TcxDBLookupComboBox
      Left = 25
      Top = 151
      AutoSize = False
      DataBinding.DataField = 'TYPE_ACCOUNT'
      DataBinding.DataSource = frmListingFinancialAccount.dsFinancialAccount
      Properties.KeyFieldNames = 'CODE'
      Properties.ListColumns = <
        item
          HeaderAlignment = taCenter
          MinWidth = 6
          Width = 10
          FieldName = 'ID'
        end
        item
          Caption = 'Descri'#231#227'o'
          HeaderAlignment = taCenter
          FieldName = 'DESCRIPTION'
        end
        item
          Caption = 'C'#243'digo'
          HeaderAlignment = taCenter
          FieldName = 'CODE'
        end>
      Properties.ListFieldIndex = 1
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = dmFinancialAccountFD.dsFinancialAccountType
      TabOrder = 3
      Height = 24
      Width = 123
    end
    object lookDescriptionFinancialInstitution: TcxDBLookupComboBox
      Left = 601
      Top = 88
      AutoSize = False
      DataBinding.DataField = 'CD_FINANCIAL_INSTITUTION'
      DataBinding.DataSource = frmListingFinancialAccount.dsFinancialAccount
      Properties.KeyFieldNames = 'ID_FINANCIAL_INSTITUTION'
      Properties.ListColumns = <
        item
          Caption = 'ID'
          HeaderAlignment = taCenter
          FieldName = 'ID_FINANCIAL_INSTITUTION'
        end
        item
          Caption = 'Institui'#231#227'o Financeira'
          HeaderAlignment = taCenter
          Width = 604
          FieldName = 'DESC_FINANCIAL_INSTITUTION'
        end>
      Properties.ListFieldIndex = 1
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = frmListingFinancialAccount.dsFinancialInstitution
      TabOrder = 2
      Height = 24
      Width = 200
    end
    object lookDescriptionOperation: TcxDBLookupComboBox
      Left = 90
      Top = 88
      AutoSize = False
      DataBinding.DataField = 'CD_OPERATION'
      DataBinding.DataSource = frmListingFinancialAccount.dsFinancialAccount
      Properties.KeyFieldNames = 'ID_OPERATION'
      Properties.ListColumns = <
        item
          Caption = 'ID'
          HeaderAlignment = taCenter
          FieldName = 'ID_OPERATION'
        end
        item
          Caption = 'Opera'#231#227'o'
          HeaderAlignment = taCenter
          Width = 604
          FieldName = 'DESC_OPERATION'
        end>
      Properties.ListFieldIndex = 1
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = frmListingFinancialAccount.dsOperation
      TabOrder = 1
      Height = 24
      Width = 487
    end
  end
end
