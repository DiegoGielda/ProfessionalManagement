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
        Width = 118
        Visible = True
      end
      item
        Expanded = False
        Visible = True
      end
      item
        Expanded = False
        Visible = True
      end
      item
        Expanded = False
        Visible = True
      end
      item
        Expanded = False
        Visible = True
      end
      item
        Expanded = False
        Visible = True
      end
      item
        Expanded = False
        Visible = True
      end
      item
        Expanded = False
        Visible = True
      end
      item
        Expanded = False
        Visible = True
      end
      item
        Expanded = False
        Visible = True
      end>
  end
  object qryRecordSheet: TFDQuery
    Connection = dmConnectionFD.fdConnection
    SQL.Strings = (
      
        'select REC_SHE.ID_RECORD_SHEET, REC_SHE.CD_PERSON_EMPLOYEE, REC_' +
        'SHE.DATE_RECORD, REC_SHE.TIME_START_ONE,'
      
        '       REC_SHE.TIME_END_ONE, REC_SHE.TIME_START_TWO, REC_SHE.TIM' +
        'E_END_TWO, REC_SHE.INTERVAL_PERIOD,'
      
        '       REC_SHE.AMOUNT_HOUR_WORKED_DAY, REC_SHE.LOG_DATE_INSERT_R' +
        'ECORD, REC_SHE.LOG_DATE_UPDATE_RECORD'
      'from RECORD_SHEET as REC_SHE  ')
    Left = 544
    Top = 112
  end
  object dmRecordSheet: TDataSource
    DataSet = qryRecordSheet
    Left = 544
    Top = 184
  end
end
