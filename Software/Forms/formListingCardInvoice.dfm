inherited frmListingCardInvoice: TfrmListingCardInvoice
  Caption = 'Listagem de Fatura de Cart'#227'o'
  ClientWidth = 1115
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgPattern: TDBGrid
    Width = 1115
    DataSource = dsCardInvoice
    OnDblClick = dbgPatternDblClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID_CARD_INVOICE'
        Title.Alignment = taCenter
        Title.Caption = 'ID FATURA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 96
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'INSTITUTION_DESCRIPTION'
        Title.Alignment = taCenter
        Title.Caption = 'INSTITUI'#199#195'O FINANCEIRA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 237
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'INVOICE_DESCRIPTION'
        Title.Alignment = taCenter
        Title.Caption = 'FATURA DESCRI'#199#195'O'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 240
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DATE_PAYMENT'
        Title.Alignment = taCenter
        Title.Caption = 'DATA PAGAMENTO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 135
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DATE_OPENING'
        Title.Alignment = taCenter
        Title.Caption = 'DATA ABERTURA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 138
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DATE_CLOSURE'
        Title.Alignment = taCenter
        Title.Caption = 'DATA FECHAMENTO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 146
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ACTIVE_RECORD'
        Title.Alignment = taCenter
        Title.Caption = 'ATIVA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 76
        Visible = True
      end>
  end
  inherited pnlHeader: TPanel
    Width = 1115
    inherited btnEdit: TSpeedButton
      OnClick = btnEditClick
    end
    inherited btnNew: TSpeedButton
      OnClick = btnNewClick
    end
  end
  object qryCardInvoice: TFDQuery
    OnNewRecord = qryCardInvoiceNewRecord
    Connection = dmConnectionFD.fdConnection
    SQL.Strings = (
      
        'select CARD.ID_CARD_INVOICE, CARD.DESCRIPTION as INVOICE_DESCRIP' +
        'TION, CARD.DATE_OPENING, CARD.DATE_CLOSURE,'
      
        '       CARD.DATE_PAYMENT, CARD.ACTIVE_RECORD, CARD.CD_FINANCIAL_' +
        'INSTITUTION,'
      '       INSTITUTION.DESCRIPTION as INSTITUTION_DESCRIPTION'
      'from CARD_INVOICE CARD'
      
        'inner join FINANCIAL_INSTITUTION INSTITUTION on (INSTITUTION.ID_' +
        'FINANCIAL_INSTITUTION = CARD.CD_FINANCIAL_INSTITUTION)'
      'order by CARD.DATE_PAYMENT asc, CARD.ACTIVE_RECORD desc ')
    Left = 400
    Top = 152
    object qryCardInvoiceID_CARD_INVOICE: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_CARD_INVOICE'
      Origin = 'ID_CARD_INVOICE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCardInvoiceINVOICE_DESCRIPTION: TStringField
      FieldName = 'INVOICE_DESCRIPTION'
      Origin = 'DESCRIPTION'
      Required = True
      Size = 255
    end
    object qryCardInvoiceDATE_OPENING: TDateField
      FieldName = 'DATE_OPENING'
      Origin = 'DATE_OPENING'
      Required = True
      OnChange = qryCardInvoiceDATE_OPENINGChange
    end
    object qryCardInvoiceDATE_CLOSURE: TDateField
      FieldName = 'DATE_CLOSURE'
      Origin = 'DATE_CLOSURE'
      Required = True
    end
    object qryCardInvoiceDATE_PAYMENT: TDateField
      FieldName = 'DATE_PAYMENT'
      Origin = 'DATE_PAYMENT'
      Required = True
    end
    object qryCardInvoiceACTIVE_RECORD: TStringField
      FieldName = 'ACTIVE_RECORD'
      Origin = 'ACTIVE_RECORD'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryCardInvoiceCD_FINANCIAL_INSTITUTION: TIntegerField
      FieldName = 'CD_FINANCIAL_INSTITUTION'
      Origin = 'CD_FINANCIAL_INSTITUTION'
      Required = True
      OnChange = qryCardInvoiceCD_FINANCIAL_INSTITUTIONChange
    end
    object qryCardInvoiceINSTITUTION_DESCRIPTION: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'INSTITUTION_DESCRIPTION'
      Origin = 'DESCRIPTION'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object dsCardInvoice: TDataSource
    DataSet = qryCardInvoice
    Left = 400
    Top = 216
  end
  object qryCardInstitution: TFDQuery
    Connection = dmConnectionFD.fdConnection
    SQL.Strings = (
      
        'select INSTITUTION.ID_FINANCIAL_INSTITUTION as ID_INSTITUTION, I' +
        'NSTITUTION.DESCRIPTION as INSTITUTION_DESC'
      'from FINANCIAL_INSTITUTION as INSTITUTION'
      'order by INSTITUTION.DESCRIPTION asc')
    Left = 536
    Top = 152
    object qryCardInstitutionID_INSTITUTION: TIntegerField
      FieldName = 'ID_INSTITUTION'
      Origin = 'ID_FINANCIAL_INSTITUTION'
      Required = True
    end
    object qryCardInstitutionINSTITUTION_DESC: TStringField
      FieldName = 'INSTITUTION_DESC'
      Origin = 'DESCRIPTION'
      Required = True
      Size = 100
    end
  end
  object dsCardInstitution: TDataSource
    DataSet = qryCardInstitution
    Left = 536
    Top = 216
  end
end
