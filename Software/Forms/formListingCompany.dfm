inherited frmListingCompany: TfrmListingCompany
  Caption = 'Consulta de Empresa'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgPattern: TDBGrid
    Anchors = [akLeft, akTop, akRight]
    DataSource = dsCompany
    OnDblClick = dbgPadraoDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_COMPANY'
        Title.Alignment = taCenter
        Title.Caption = 'ID EMPRESA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPTION'
        Title.Alignment = taCenter
        Title.Caption = 'DESCRI'#199#195'O'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 485
        Visible = True
      end>
  end
  inherited pnlHeader: TPanel
    inherited btnEdit: TSpeedButton
      OnClick = btnNovoClick
    end
  end
  object dsCompany: TDataSource
    DataSet = qryCompany
    Left = 584
    Top = 288
  end
  object qryCompany: TFDQuery
    Connection = dtmConnectionFD.fdConnection
    SQL.Strings = (
      'select COM.ID_COMPANY, COM.DESCRIPTION'
      'from COMPANY as COM')
    Left = 584
    Top = 224
    object qryCompanyID_COMPANY: TIntegerField
      FieldName = 'ID_COMPANY'
      Origin = 'ID_COMPANY'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCompanyDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Origin = 'DESCRIPTION'
      Required = True
      Size = 50
    end
  end
end
