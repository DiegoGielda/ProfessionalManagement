inherited frmListingRecordSheet: TfrmListingRecordSheet
  Caption = 'Consulta de Registro Ponto'
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgPattern: TDBGrid
    DataSource = dmRecordSheet
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID_RECORD_SHEET'
        Title.Alignment = taCenter
        Title.Caption = 'ID REGISTRO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 98
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DATE_RECORD'
        Title.Alignment = taCenter
        Title.Caption = 'DATA REGISTRO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 124
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID_RECORD_SHEET_TIME'
        Title.Alignment = taCenter
        Title.Caption = 'ID TEMPO'
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
        FieldName = 'TIME_START'
        Title.Alignment = taCenter
        Title.Caption = 'TEMPO IN'#205'CIO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 112
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'TIME_END'
        Title.Alignment = taCenter
        Title.Caption = 'TEMPO FINAL'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 99
        Visible = True
      end>
  end
  object qryRecordSheet: TFDQuery
    Active = True
    Connection = dmConnectionFD.fdConnection
    SQL.Strings = (
      
        'select R_SHEET.ID_RECORD_SHEET, R_SHEET.CD_PERSON_EMPLOYEE, R_SH' +
        'EET.DATE_RECORD, RS_TIME.ID_RECORD_SHEET_TIME,'
      '       RS_TIME.TIME_START, RS_TIME.TIME_END'
      'from RECORD_SHEET as R_SHEET'
      
        'inner join RECORD_SHEET_TIME as RS_TIME on (RS_TIME.CD_RECORD_SH' +
        'EET = R_SHEET.ID_RECORD_SHEET)')
    Left = 544
    Top = 112
    object qryRecordSheetID_RECORD_SHEET: TIntegerField
      FieldName = 'ID_RECORD_SHEET'
      Origin = 'ID_RECORD_SHEET'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryRecordSheetCD_PERSON_EMPLOYEE: TIntegerField
      FieldName = 'CD_PERSON_EMPLOYEE'
      Origin = 'CD_PERSON_EMPLOYEE'
      Required = True
    end
    object qryRecordSheetDATE_RECORD: TDateField
      FieldName = 'DATE_RECORD'
      Origin = 'DATE_RECORD'
      Required = True
    end
    object qryRecordSheetID_RECORD_SHEET_TIME: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_RECORD_SHEET_TIME'
      Origin = 'ID_RECORD_SHEET_TIME'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryRecordSheetTIME_START: TTimeField
      AutoGenerateValue = arDefault
      FieldName = 'TIME_START'
      Origin = 'TIME_START'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryRecordSheetTIME_END: TTimeField
      AutoGenerateValue = arDefault
      FieldName = 'TIME_END'
      Origin = 'TIME_END'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dmRecordSheet: TDataSource
    DataSet = qryRecordSheet
    Left = 544
    Top = 184
  end
end
