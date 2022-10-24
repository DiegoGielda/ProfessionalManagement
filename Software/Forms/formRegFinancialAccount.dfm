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
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lblDescriptionFinancialAccount: TLabel [1]
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
      Top = 131
      Width = 24
      Height = 16
      Caption = 'Tipo'
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
    object edtDateAccountFinancialAccount: TcxDBDateEdit
      Left = 176
      Top = 150
      AutoSize = False
      DataBinding.DataField = 'DATA_ACCOUNT'
      DataBinding.DataSource = frmListingFinancialAccount.dsFinancialAccount
      TabOrder = 1
      Height = 24
      Width = 127
    end
    object edtDescriptionFinancialAccount: TDBEdit
      Left = 90
      Top = 88
      Width = 807
      Height = 24
      DataField = 'DESCRIPTION'
      DataSource = frmListingFinancialAccount.dsFinancialAccount
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
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
      TabOrder = 3
    end
    object edtValueAccountFinancialAccount: TDBEdit
      Left = 322
      Top = 151
      Width = 134
      Height = 24
      AutoSize = False
      DataField = 'VALUE_ACCOUNT'
      DataSource = frmListingFinancialAccount.dsFinancialAccount
      TabOrder = 4
    end
    object lookTypeFinancialAccount: TcxDBLookupComboBox
      Left = 25
      Top = 150
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
      TabOrder = 5
      Height = 24
      Width = 123
    end
  end
end
