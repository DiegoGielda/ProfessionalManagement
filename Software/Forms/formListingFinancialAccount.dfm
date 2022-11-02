inherited frmListingFinancialAccount: TfrmListingFinancialAccount
  Caption = 'Consulta de Contas'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgPattern: TDBGrid
    DataSource = dsFinancialAccount
    OnDblClick = dbgPatternDblClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID_FINANCIAL_ACCOUNT'
        Title.Alignment = taCenter
        Title.Caption = 'ID_CONTA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 87
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DESCRIPTION'
        Title.Alignment = taCenter
        Title.Caption = 'DESCRI'#199#195'O'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 386
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TYPE_ACCOUNT'
        Title.Alignment = taCenter
        Title.Caption = 'TIPO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 103
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'VALUE_ACCOUNT'
        Title.Alignment = taCenter
        Title.Caption = 'VALOR'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DATA_ACCOUNT'
        Title.Alignment = taCenter
        Title.Caption = 'DATA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 103
        Visible = True
      end>
  end
  inherited pnlHeader: TPanel
    inherited btnEdit: TSpeedButton
      OnClick = btnEditClick
    end
    inherited btnNew: TSpeedButton
      OnClick = btnNewClick
    end
  end
  object qryFinancialAccount: TFDQuery
    OnNewRecord = qryFinancialAccountNewRecord
    Connection = dmConnectionFD.fdConnection
    SQL.Strings = (
      
        'select FA.ID_FINANCIAL_ACCOUNT, FA.DESCRIPTION, FA.TYPE_ACCOUNT,' +
        ' FA.DATA_ACCOUNT, FA.VALUE_ACCOUNT'
      'from FINANCIAL_ACCOUNT FA'
      'order by FA.DATA_ACCOUNT, FA.TYPE_ACCOUNT, FA.VALUE_ACCOUNT desc')
    Left = 480
    Top = 120
    object qryFinancialAccountID_FINANCIAL_ACCOUNT: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_FINANCIAL_ACCOUNT'
      Origin = 'ID_FINANCIAL_ACCOUNT'
      ReadOnly = True
    end
    object qryFinancialAccountDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Origin = 'DESCRIPTION'
      Required = True
      Size = 255
    end
    object qryFinancialAccountTYPE_ACCOUNT: TStringField
      FieldName = 'TYPE_ACCOUNT'
      Origin = 'TYPE_ACCOUNT'
      Required = True
      OnGetText = qryFinancialAccountTYPE_ACCOUNTGetText
      FixedChar = True
      Size = 1
    end
    object qryFinancialAccountDATA_ACCOUNT: TDateField
      FieldName = 'DATA_ACCOUNT'
      Origin = 'DATA_ACCOUNT'
      Required = True
    end
    object qryFinancialAccountVALUE_ACCOUNT: TFMTBCDField
      FieldName = 'VALUE_ACCOUNT'
      Origin = 'VALUE_ACCOUNT'
      Required = True
      Precision = 18
      Size = 2
    end
  end
  object dsFinancialAccount: TDataSource
    DataSet = qryFinancialAccount
    Left = 480
    Top = 192
  end
end
