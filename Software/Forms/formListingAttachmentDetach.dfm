inherited frmListingAttachmentDetach: TfrmListingAttachmentDetach
  Caption = 'Consulta de Anexos Avulsos'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgPattern: TDBGrid
    DataSource = dsAttachmentDetach
    OnDblClick = dbgPatternDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_ATTACHMENT_DETACHED'
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
        FieldName = 'ATTACHMENT_DETACHED_NAME'
        Title.Alignment = taCenter
        Title.Caption = 'DESCRI'#199#195'O DO ANEXO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 365
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'GROUP_ATTACHMENT'
        Title.Alignment = taCenter
        Title.Caption = 'GRUPO ANEXO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 366
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
  object qryAttachmentDetach: TFDQuery
    Connection = dmConnectionFD.fdConnection
    SQL.Strings = (
      
        'select ATT_DET.ID_ATTACHMENT_DETACHED, ATT_DET.ATTACHMENT_DETACH' +
        'ED, ATT_DET.ATTACHMENT_DETACHED_NAME, ATT_DET.ASSIGNED,'
      
        '       ATT_DET.CD_ATTACHMENT_DETACHED_GROUP, ATT_GROUP.DESCRIPTI' +
        'ON as GROUP_ATTACHMENT'
      'from ATTACHMENT_DETACHED ATT_DET'
      
        'inner join ATTACHMENT_DETACHED_GROUP ATT_GROUP on (ATT_GROUP.ID_' +
        'ATTACHMENT_DETACHED_GROUP = ATT_DET.CD_ATTACHMENT_DETACHED_GROUP' +
        ')'
      'order by ATT_GROUP.DESCRIPTION asc')
    Left = 392
    Top = 176
    object qryAttachmentDetachID_ATTACHMENT_DETACHED: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_ATTACHMENT_DETACHED'
      Origin = 'ID_ATTACHMENT_DETACHED'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryAttachmentDetachATTACHMENT_DETACHED: TBlobField
      FieldName = 'ATTACHMENT_DETACHED'
      Origin = 'ATTACHMENT_DETACHED'
    end
    object qryAttachmentDetachATTACHMENT_DETACHED_NAME: TStringField
      FieldName = 'ATTACHMENT_DETACHED_NAME'
      Origin = 'ATTACHMENT_DETACHED_NAME'
      Required = True
      Size = 255
    end
    object qryAttachmentDetachASSIGNED: TStringField
      FieldName = 'ASSIGNED'
      Origin = 'ASSIGNED'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryAttachmentDetachCD_ATTACHMENT_DETACHED_GROUP: TIntegerField
      FieldName = 'CD_ATTACHMENT_DETACHED_GROUP'
      Origin = 'CD_ATTACHMENT_DETACHED_GROUP'
      Required = True
    end
    object qryAttachmentDetachGROUP_ATTACHMENT: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'GROUP_ATTACHMENT'
      Origin = 'DESCRIPTION'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object dsAttachmentDetach: TDataSource
    DataSet = qryAttachmentDetach
    Left = 392
    Top = 232
  end
  object qryAttachmentGroup: TFDQuery
    Connection = dmConnectionFD.fdConnection
    SQL.Strings = (
      
        'select ATT_GROUP.ID_ATTACHMENT_DETACHED_GROUP, ATT_GROUP.DESCRIP' +
        'TION as DESC_ATTACHMENT_GROUP'
      'from ATTACHMENT_DETACHED_GROUP ATT_GROUP'
      'order by ATT_GROUP.DESCRIPTION')
    Left = 576
    Top = 344
    object qryAttachmentGroupID_ATTACHMENT_DETACHED_GROUP: TIntegerField
      FieldName = 'ID_ATTACHMENT_DETACHED_GROUP'
      Origin = 'ID_ATTACHMENT_DETACHED_GROUP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Required = True
    end
    object qryAttachmentGroupDESC_ATTACHMENT_GROUP: TStringField
      FieldName = 'DESC_ATTACHMENT_GROUP'
      Origin = 'DESCRIPTION'
      ReadOnly = True
      Required = True
      Size = 100
    end
  end
  object dsAttachmentGroup: TDataSource
    DataSet = qryAttachmentGroup
    Left = 576
    Top = 400
  end
end
