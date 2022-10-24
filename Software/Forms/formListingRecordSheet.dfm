inherited frmListingRecordSheet: TfrmListingRecordSheet
  Caption = 'Consulta de Registro Ponto'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgPattern: TDBGrid
    DataSource = dsConRecordSheet
    OnDblClick = dbgPatternDblClick
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
  inherited pnlHeader: TPanel
    inherited btnEdit: TSpeedButton
      OnClick = btnEditClick
    end
    inherited btnNew: TSpeedButton
      Top = 11
      OnClick = btnNewClick
      ExplicitTop = 11
    end
  end
  object qryConRecordSheet: TFDQuery
    Connection = dmConnectionFD.fdConnection
    SQL.Strings = (
      
        'select R_SHEET.ID_RECORD_SHEET, R_SHEET.CD_PERSON_EMPLOYEE, R_SH' +
        'EET.DATE_RECORD, RS_TIME.ID_RECORD_SHEET_TIME,'
      '       RS_TIME.TIME_START, RS_TIME.TIME_END'
      'from RECORD_SHEET as R_SHEET'
      
        'left join RECORD_SHEET_TIME as RS_TIME on (RS_TIME.CD_RECORD_SHE' +
        'ET = R_SHEET.ID_RECORD_SHEET)')
    Left = 352
    Top = 144
    object qryConRecordSheetID_RECORD_SHEET: TIntegerField
      FieldName = 'ID_RECORD_SHEET'
      Origin = 'ID_RECORD_SHEET'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryConRecordSheetCD_PERSON_EMPLOYEE: TIntegerField
      FieldName = 'CD_PERSON_EMPLOYEE'
      Origin = 'CD_PERSON_EMPLOYEE'
      Required = True
    end
    object qryConRecordSheetDATE_RECORD: TDateField
      FieldName = 'DATE_RECORD'
      Origin = 'DATE_RECORD'
      Required = True
    end
    object qryConRecordSheetID_RECORD_SHEET_TIME: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_RECORD_SHEET_TIME'
      Origin = 'ID_RECORD_SHEET_TIME'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryConRecordSheetTIME_START: TTimeField
      AutoGenerateValue = arDefault
      FieldName = 'TIME_START'
      Origin = 'TIME_START'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryConRecordSheetTIME_END: TTimeField
      AutoGenerateValue = arDefault
      FieldName = 'TIME_END'
      Origin = 'TIME_END'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object dsConRecordSheet: TDataSource
    DataSet = qryConRecordSheet
    Left = 352
    Top = 216
  end
  object qryRecordSheet: TFDQuery
    OnNewRecord = qryRecordSheetNewRecord
    Connection = dmConnectionFD.fdConnection
    SQL.Strings = (
      
        'select R_SHEET.ID_RECORD_SHEET, R_SHEET.CD_PERSON_EMPLOYEE, R_SH' +
        'EET.DATE_RECORD'
      'from RECORD_SHEET as R_SHEET')
    Left = 456
    Top = 144
    object qryRecordSheetID_RECORD_SHEET: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_RECORD_SHEET'
      Origin = 'ID_RECORD_SHEET'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
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
  end
  object qryRecordSheetItemTime: TFDQuery
    IndexFieldNames = 'CD_RECORD_SHEET'
    MasterSource = dsRecordSheet
    MasterFields = 'ID_RECORD_SHEET'
    DetailFields = 'CD_RECORD_SHEET'
    Connection = dmConnectionFD.fdConnection
    SQL.Strings = (
      
        'select RS_TIME.ID_RECORD_SHEET_TIME, RS_TIME.CD_RECORD_SHEET, RS' +
        '_TIME.TIME_START, RS_TIME.TIME_END'
      'from RECORD_SHEET_TIME as RS_TIME'
      'where RS_TIME.CD_RECORD_SHEET = :ID_RECORD_SHEET ')
    Left = 568
    Top = 144
    ParamData = <
      item
        Name = 'ID_RECORD_SHEET'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryRecordSheetItemTimeID_RECORD_SHEET_TIME: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_RECORD_SHEET_TIME'
      Origin = 'ID_RECORD_SHEET_TIME'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryRecordSheetItemTimeCD_RECORD_SHEET: TIntegerField
      FieldName = 'CD_RECORD_SHEET'
      Origin = 'CD_RECORD_SHEET'
    end
    object qryRecordSheetItemTimeTIME_START: TTimeField
      FieldName = 'TIME_START'
      Origin = 'TIME_START'
      Required = True
    end
    object qryRecordSheetItemTimeTIME_END: TTimeField
      FieldName = 'TIME_END'
      Origin = 'TIME_END'
    end
  end
  object dsRecordSheet: TDataSource
    DataSet = qryRecordSheet
    Left = 456
    Top = 216
  end
  object dsRecordSheetItemTime: TDataSource
    DataSet = qryRecordSheetItemTime
    Left = 568
    Top = 216
  end
  object qryPersonEmployee: TFDQuery
    Connection = dmConnectionFD.fdConnection
    SQL.Strings = (
      
        'select P_EMP.ID_PERSON_EMPLOYEE, P_EMP.CD_PERSON, P_EMP.CD_JOB, ' +
        'P_EMP.DATE_ADMISSION, P_EMP.ENROLLMENT, P_EMP.PIS,'
      '       PER.NAME'
      'from PERSON_EMPLOYEE as P_EMP'
      'inner join PERSON as PER on (PER.ID_PERSON = P_EMP.CD_PERSON)')
    Left = 688
    Top = 144
    object qryPersonEmployeeID_PERSON_EMPLOYEE: TIntegerField
      FieldName = 'ID_PERSON_EMPLOYEE'
      Origin = 'ID_PERSON_EMPLOYEE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPersonEmployeeCD_PERSON: TIntegerField
      FieldName = 'CD_PERSON'
      Origin = 'CD_PERSON'
      Required = True
    end
    object qryPersonEmployeeCD_JOB: TIntegerField
      FieldName = 'CD_JOB'
      Origin = 'CD_JOB'
      Required = True
    end
    object qryPersonEmployeeDATE_ADMISSION: TDateField
      FieldName = 'DATE_ADMISSION'
      Origin = 'DATE_ADMISSION'
    end
    object qryPersonEmployeeENROLLMENT: TStringField
      FieldName = 'ENROLLMENT'
      Origin = 'ENROLLMENT'
      FixedChar = True
      Size = 10
    end
    object qryPersonEmployeePIS: TStringField
      FieldName = 'PIS'
      Origin = 'PIS'
      FixedChar = True
      Size = 12
    end
    object qryPersonEmployeeNAME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NAME'
      Origin = 'NAME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object dsPersonEmployee: TDataSource
    DataSet = qryPersonEmployee
    Left = 688
    Top = 216
  end
end
