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
      
        'select FA.ID_FINANCIAL_ACCOUNT, FA.CD_OPERATION, FA.TYPE_ACCOUNT' +
        ', FA.DATA_ACCOUNT, FA.VALUE_ACCOUNT, FA.CD_FINANCIAL_INSTITUTION' +
        ', FA.OBSERVATION AS OBSERVATION_ACCOUNT'
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
    object qryFinancialAccountCD_OPERATION: TIntegerField
      FieldName = 'CD_OPERATION'
      Origin = 'CD_OPERATION'
      Required = True
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
      DisplayFormat = '###,##0.00'
      Precision = 18
      Size = 2
    end
    object qryFinancialAccountCD_FINANCIAL_INSTITUTION: TIntegerField
      FieldName = 'CD_FINANCIAL_INSTITUTION'
      Origin = 'CD_FINANCIAL_INSTITUTION'
      Required = True
    end
    object qryFinancialAccountOBSERVATION_ACCOUNT: TStringField
      FieldName = 'OBSERVATION_ACCOUNT'
      Origin = 'OBSERVATION'
      Size = 255
    end
  end
  object dsFinancialAccount: TDataSource
    DataSet = qryFinancialAccount
    Left = 480
    Top = 176
  end
  object qryFinancialInstitution: TFDQuery
    Connection = dmConnectionFD.fdConnection
    SQL.Strings = (
      
        'select FI.ID_FINANCIAL_INSTITUTION, FI.DESCRIPTION as DESC_FINAN' +
        'CIAL_INSTITUTION'
      'from FINANCIAL_INSTITUTION as FI'
      'order by FI.ID_FINANCIAL_INSTITUTION')
    Left = 480
    Top = 272
    object qryFinancialInstitutionID_FINANCIAL_INSTITUTION: TIntegerField
      FieldName = 'ID_FINANCIAL_INSTITUTION'
      Origin = 'ID_FINANCIAL_INSTITUTION'
      Required = True
    end
    object qryFinancialInstitutionDESC_FINANCIAL_INSTITUTION: TStringField
      FieldName = 'DESC_FINANCIAL_INSTITUTION'
      Origin = 'DESCRIPTION'
      Required = True
      Size = 100
    end
  end
  object dsFinancialInstitution: TDataSource
    DataSet = qryFinancialInstitution
    Left = 480
    Top = 336
  end
  object qryOperation: TFDQuery
    Connection = dmConnectionFD.fdConnection
    SQL.Strings = (
      'select OP.ID_OPERATION, OP.DESCRIPTION as DESC_OPERATION'
      'from OPERATION as OP'
      'order by OP.ID_OPERATION')
    Left = 592
    Top = 272
    object qryOperationID_OPERATION: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_OPERATION'
      Origin = 'ID_OPERATION'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryOperationDESC_OPERATION: TStringField
      FieldName = 'DESC_OPERATION'
      Origin = 'DESCRIPTION'
      Required = True
      Size = 255
    end
  end
  object dsOperation: TDataSource
    DataSet = qryOperation
    Left = 592
    Top = 336
  end
end
