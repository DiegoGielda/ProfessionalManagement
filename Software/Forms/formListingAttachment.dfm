inherited frmListingAttachment: TfrmListingAttachment
  Caption = 'Consulta de Anexos'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgPattern: TDBGrid
    DataSource = dsAttachment
    PopupMenu = popActionRecordGrid
    OnDblClick = dbgPatternDblClick
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
  inherited pnlHeader: TPanel
    inherited btnEdit: TSpeedButton
      Visible = False
    end
    inherited btnNew: TSpeedButton
      OnClick = btnNewClick
    end
  end
  object qryAttachment: TFDQuery
    OnNewRecord = qryAttachmentNewRecord
    Connection = dmConnectionFD.fdConnection
    SQL.Strings = (
      
        'select ATT.ID_ATTACHMENT, ATT.TABLE_NAME, ATT.TABLE_ID, ATT.ATTA' +
        'CHMENT, ATT.ATTACHMENT_NAME, ATT.ASSIGNED'
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
    end
    object qryAttachmentATTACHMENT_NAME: TStringField
      FieldName = 'ATTACHMENT_NAME'
      Origin = 'ATTACHMENT_NAME'
      Required = True
      Size = 255
    end
    object qryAttachmentASSIGNED: TStringField
      FieldName = 'ASSIGNED'
      Origin = 'ASSIGNED'
      Required = True
      FixedChar = True
      Size = 1
    end
  end
  object dsAttachment: TDataSource
    DataSet = qryAttachment
    Left = 248
    Top = 184
  end
  object openAttachment: TOpenDialog
    Left = 440
    Top = 112
  end
  object popActionRecordGrid: TPopupMenu
    Left = 616
    Top = 136
    object popRecordGridDonwload: TMenuItem
      Caption = 'Baixar Anexo'
      ShortCut = 16450
      OnClick = popRecordGridDonwloadClick
    end
    object popRecordGridDelete: TMenuItem
      Caption = 'Deletar Anexo'
      ShortCut = 16452
      OnClick = popRecordGridDeleteClick
    end
  end
  object saveAttachment: TSaveDialog
    Title = 'Selecione a pasta para salvar o anexo'
    Left = 440
    Top = 168
  end
end
