inherited frmListingFinancialInstitution: TfrmListingFinancialInstitution
  Caption = 'Consulta de Institui'#231#227'o Financeira'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgPattern: TDBGrid
    DataSource = dsFinancialInstitution
    OnDblClick = dbgPatternDblClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID_FINANCIAL_INSTITUTION'
        Title.Alignment = taCenter
        Title.Caption = 'ID INSTITUI'#199#195'O'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 127
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DESC_FINANCIAL_INSTITUTION'
        Title.Alignment = taCenter
        Title.Caption = 'DESCRI'#199#195'O'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 483
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
  object qryFinancialInstitution: TFDQuery
    Connection = dmConnectionFD.fdConnection
    SQL.Strings = (
      
        'select FI.ID_FINANCIAL_INSTITUTION, FI.DESCRIPTION as DESC_FINAN' +
        'CIAL_INSTITUTION'
      'from FINANCIAL_INSTITUTION as FI'
      'order by FI.ID_FINANCIAL_INSTITUTION')
    Left = 560
    Top = 144
    object qryFinancialInstitutionID_FINANCIAL_INSTITUTION: TIntegerField
      AutoGenerateValue = arAutoInc
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
    Left = 560
    Top = 208
  end
end
