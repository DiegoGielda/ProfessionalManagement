inherited frmListingAttachmentGroup: TfrmListingAttachmentGroup
  Caption = 'Consulta de Grupos de Anexo'
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgPattern: TDBGrid
    DataSource = dsAttachmentGroup
    OnDblClick = dbgPatternDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_ATTACHMENT_DETACHED_GROUP'
        Title.Alignment = taCenter
        Title.Caption = 'ID GRUPO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 79
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
        Width = 400
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PATH_GROUP'
        Title.Alignment = taCenter
        Title.Caption = 'CAMINHO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clMoneyGreen
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 400
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
  object qryAttachmentGroup: TFDQuery
    Connection = dmConnectionFD.fdConnection
    SQL.Strings = (
      
        'select ATT_GROUP.ID_ATTACHMENT_DETACHED_GROUP, ATT_GROUP.DESCRIP' +
        'TION, ATT_GROUP.PATH_GROUP'
      'from ATTACHMENT_DETACHED_GROUP ATT_GROUP'
      'order by ATT_GROUP.DESCRIPTION asc')
    Left = 464
    Top = 168
    object qryAttachmentGroupID_ATTACHMENT_DETACHED_GROUP: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_ATTACHMENT_DETACHED_GROUP'
      Origin = 'ID_ATTACHMENT_DETACHED_GROUP'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Required = True
    end
    object qryAttachmentGroupDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Origin = 'DESCRIPTION'
      Required = True
      Size = 100
    end
    object qryAttachmentGroupPATH_GROUP: TStringField
      FieldName = 'PATH_GROUP'
      Origin = 'PATH_GROUP'
      Required = True
      Size = 100
    end
  end
  object dsAttachmentGroup: TDataSource
    DataSet = qryAttachmentGroup
    Left = 464
    Top = 224
  end
end
