inherited frmListingTask: TfrmListingTask
  Caption = 'Consulta de Tarefas'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgPattern: TDBGrid
    DataSource = dsTask
    OnDblClick = dbgPatternDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'STATE'
        Title.Alignment = taCenter
        Title.Caption = 'STATUS'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 71
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DATE_TO_DO'
        Title.Alignment = taCenter
        Title.Caption = 'DATA PARA REALIZAR'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 185
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
        Width = 366
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CONTEXT'
        Title.Alignment = taCenter
        Title.Caption = 'CONTEXTO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 89
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PERIOD'
        Title.Alignment = taCenter
        Title.Caption = 'PER'#205'ODO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 99
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DATE_REGISTRATION'
        Title.Alignment = taCenter
        Title.Caption = 'DATA DE REGISTRO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 155
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DATE_CONCLUDED'
        Title.Alignment = taCenter
        Title.Caption = 'DATA DE CONCLUS'#195'O'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 176
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'REMARK'
        Title.Alignment = taCenter
        Title.Caption = 'OBSERVA'#199#195'O'
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
        FieldName = 'ID_TASK'
        Title.Alignment = taCenter
        Title.Caption = 'ID_TAREFA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 85
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
  object qryTask: TFDQuery
    Connection = dmConnectionFD.fdConnection
    SQL.Strings = (
      
        'select T.ID_TASK, T.DESCRIPTION, T.STATE, T.REMARK, T.PERIOD, T.' +
        'CONTEXT, T.DATE_REGISTRATION, T.DATE_TO_DO,'
      '       T.DATE_CONCLUDED'
      'from TASK as T  ')
    Left = 488
    Top = 208
    object qryTaskID_TASK: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_TASK'
      Origin = 'ID_TASK'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryTaskDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Origin = 'DESCRIPTION'
      Required = True
      Size = 255
    end
    object qryTaskSTATE: TStringField
      FieldName = 'STATE'
      Origin = 'STATE'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryTaskREMARK: TStringField
      FieldName = 'REMARK'
      Origin = 'REMARK'
      Size = 500
    end
    object qryTaskPERIOD: TStringField
      FieldName = 'PERIOD'
      Origin = 'PERIOD'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryTaskCONTEXT: TStringField
      FieldName = 'CONTEXT'
      Origin = 'CONTEXT'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryTaskDATE_REGISTRATION: TDateField
      FieldName = 'DATE_REGISTRATION'
      Origin = 'DATE_REGISTRATION'
      Required = True
    end
    object qryTaskDATE_TO_DO: TDateField
      FieldName = 'DATE_TO_DO'
      Origin = 'DATE_TO_DO'
    end
    object qryTaskDATE_CONCLUDED: TDateField
      FieldName = 'DATE_CONCLUDED'
      Origin = 'DATE_CONCLUDED'
    end
  end
  object dsTask: TDataSource
    DataSet = qryTask
    Left = 488
    Top = 272
  end
end
