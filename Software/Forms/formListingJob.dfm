inherited frmListingJob: TfrmListingJob
  Caption = 'Consulta de Cargo'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgPattern: TDBGrid
    DataSource = dsJob
    OnDblClick = dbgPatternDblClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID_JOB'
        Title.Alignment = taCenter
        Title.Caption = 'ID_CARGO'
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
        FieldName = 'JOB'
        Title.Alignment = taCenter
        Title.Caption = 'CARGO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 305
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CD_COMPANY'
        Title.Alignment = taCenter
        Title.Caption = 'CD_EMPRESA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 102
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'COMPANY'
        Title.Alignment = taCenter
        Title.Caption = 'EMPRESA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 379
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DATE_ADMISSION'
        Title.Alignment = taCenter
        Title.Caption = 'DATA IN'#205'CIO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 104
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DATE_RESIGNATION'
        Title.Alignment = taCenter
        Title.Caption = 'DATA FIM'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 92
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
  object qryJob: TFDQuery
    OnNewRecord = qryJobNewRecord
    Connection = dmConnectionFD.fdConnection
    SQL.Strings = (
      
        'select J.ID_JOB as ID_JOB, J.DESCRIPTION as JOB, J.CD_COMPANY as' +
        ' CD_COMPANY, COM.DESCRIPTION as COMPANY,'
      '       J.DATE_ADMISSION, J.DATE_RESIGNATION'
      'from JOB as J'
      'inner join COMPANY as COM on (COM.ID_COMPANY = J.CD_COMPANY)')
    Left = 472
    Top = 104
    object qryJobID_JOB: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_JOB'
      Origin = 'ID_JOB'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Required = True
    end
    object qryJobJOB: TStringField
      FieldName = 'JOB'
      Origin = 'DESCRIPTION'
      Required = True
      Size = 30
    end
    object qryJobCD_COMPANY: TIntegerField
      FieldName = 'CD_COMPANY'
      Origin = 'CD_COMPANY'
      Required = True
    end
    object qryJobCOMPANY1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COMPANY'
      Origin = 'DESCRIPTION'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryJobDATE_ADMISSION: TDateField
      FieldName = 'DATE_ADMISSION'
      Origin = 'DATE_ADMISSION'
      Required = True
    end
    object qryJobDATE_RESIGNATION: TDateField
      FieldName = 'DATE_RESIGNATION'
      Origin = 'DATE_RESIGNATION'
    end
  end
  object dsJob: TDataSource
    DataSet = qryJob
    Left = 568
    Top = 104
  end
  object qryJobCompany: TFDQuery
    Connection = dmConnectionFD.fdConnection
    SQL.Strings = (
      'select COM.ID_COMPANY as ID_COMPANY, COM.DESCRIPTION as COMPANY'
      'from COMPANY as COM')
    Left = 472
    Top = 176
    object qryJobCompanyID_COMPANY: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_COMPANY'
      Origin = 'ID_COMPANY'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryJobCompanyCOMPANY: TStringField
      FieldName = 'COMPANY'
      Origin = 'DESCRIPTION'
      Required = True
      Size = 50
    end
  end
  object dsJobCompany: TDataSource
    DataSet = qryJobCompany
    Left = 568
    Top = 176
  end
end
