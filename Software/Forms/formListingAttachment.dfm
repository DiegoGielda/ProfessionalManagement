inherited frmListingAttachment: TfrmListingAttachment
  Caption = 'Consulta de Anexos'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgPattern: TDBGrid
    DataSource = dsAttachment
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ID_ATTACHMENT'
        Title.Alignment = taCenter
        Title.Caption = 'ID ANEXO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 83
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ATTACHMENT_NAME'
        Title.Alignment = taCenter
        Title.Caption = 'DESCRI'#199#195'O DO ANEXO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 433
        Visible = True
      end>
  end
  object qryAttachment: TFDQuery
    Connection = dmConnectionFD.fdConnection
    SQL.Strings = (
      
        'select ATT.ID_ATTACHMENT, ATT.TABLE_NAME, ATT.TABLE_ID, ATT.ATTA' +
        'CHMENT, ATT.ATTACHMENT_NAME'
      'from ATTACHMENT as ATT'
      'where ATT.TABLE_NAME = :TABLE_NAME and'
      '      ATT.TABLE_ID = :TABLE_ID')
    Left = 248
    Top = 120
    ParamData = <
      item
        Name = 'TABLE_NAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TABLE_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryAttachmentID_ATTACHMENT: TIntegerField
      FieldName = 'ID_ATTACHMENT'
      Origin = 'ID_ATTACHMENT'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryAttachmentTABLE_NAME: TStringField
      FieldName = 'TABLE_NAME'
      Origin = 'TABLE_NAME'
      Required = True
      Size = 50
    end
    object qryAttachmentTABLE_ID: TIntegerField
      FieldName = 'TABLE_ID'
      Origin = 'TABLE_ID'
      Required = True
    end
    object qryAttachmentATTACHMENT: TBlobField
      FieldName = 'ATTACHMENT'
      Origin = 'ATTACHMENT'
      Required = True
    end
    object qryAttachmentATTACHMENT_NAME: TStringField
      FieldName = 'ATTACHMENT_NAME'
      Origin = 'ATTACHMENT_NAME'
      Required = True
      Size = 255
    end
  end
  object dsAttachment: TDataSource
    DataSet = qryAttachment
    Left = 248
    Top = 184
  end
end
