inherited frmListingOperation: TfrmListingOperation
  Caption = 'Listagem de Opera'#231#227'o'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgPattern: TDBGrid
    DataSource = dsOperation
    OnDblClick = dbgPatternDblClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID_OPERATION'
        Title.Alignment = taCenter
        Title.Caption = 'ID OPERA'#199#195'O'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 118
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'DESC_OPERATION'
        Title.Alignment = taCenter
        Title.Caption = 'DESCRI'#199#195'O'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 873
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
  object qryOperation: TFDQuery
    Connection = dmConnectionFD.fdConnection
    SQL.Strings = (
      'select OP.ID_OPERATION, OP.DESCRIPTION as DESC_OPERATION'
      'from OPERATION as OP'
      'order by OP.ID_OPERATION')
    Left = 488
    Top = 128
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
    Left = 488
    Top = 184
  end
end
