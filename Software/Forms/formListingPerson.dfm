inherited frmListingPerson: TfrmListingPerson
  Caption = 'Consulta de Pessoa'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgPattern: TDBGrid
    DataSource = dsPerson
    OnDblClick = dbgPatternDblClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID_PERSON'
        Title.Alignment = taCenter
        Title.Caption = 'ID PESSOA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 90
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NAME'
        Title.Alignment = taCenter
        Title.Caption = 'NOME'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 473
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'CPF'
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 207
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
  object qryPerson: TFDQuery
    Connection = dmConnectionFD.fdConnection
    SQL.Strings = (
      'select P.ID_PERSON, P.NAME, P.CPF'
      'from PERSON as P')
    Left = 352
    Top = 96
    object qryPersonID_PERSON: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_PERSON'
      Origin = 'ID_PERSON'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPersonNAME: TStringField
      FieldName = 'NAME'
      Origin = 'NAME'
      Required = True
      Size = 50
    end
    object qryPersonCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Required = True
      EditMask = '000.000.000-00;0;_'
      FixedChar = True
      Size = 11
    end
  end
  object dsPerson: TDataSource
    DataSet = qryPerson
    Left = 352
    Top = 152
  end
end
