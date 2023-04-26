inherited rptFinancialAccountFR: TrptFinancialAccountFR
  Caption = 'Relat'#243'rio de Contas a Pagar/Receber'
  PixelsPerInch = 96
  TextHeight = 13
  inherited plnFilters: TPanel
    inherited pnlReportTitle: TPanel
      inherited lblReportTitle: TLabel
        Caption = 'Relat'#243'rio de Pagamentos e Recebimentos'
      end
    end
  end
  inherited pnlButtons: TPanel
    inherited btnPrintOut: TSpeedButton
      OnClick = btnPrintOutClick
    end
  end
  inherited printReport: TfrxReport
    ReportOptions.CreateDate = 45032.498756481500000000
    ReportOptions.LastChange = 45041.989205972220000000
    ScriptText.Strings = (
      'var'
      '  FSaldoAnteriorInstituicao: Currency;'
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  FSaldoAnteriorInstituicao := FSaldoAnteriorInstituicao + <Fina' +
        'nceiro."VALUE_ACCOUNT_TYPE">;                          '
      'end;'
      ''
      
        'procedure printReportOnStartReport_inherited(Sender: TfrxCompone' +
        'nt);'
      'begin'
      '  FSaldoAnteriorInstituicao := 0;         '
      'end;'
      ''
      'procedure GroupFooter1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  FSaldoAnteriorInstituicao := 0;  '
      'end;'
      ''
      'begin'
      '    '
      'end.')
    OnStartReport = 'printReportOnStartReport_inherited'
    Datasets = <
      item
        DataSet = dsPrint
        DataSetName = 'Financeiro'
      end>
    Variables = <>
    Style = <>
    inherited Page1: TfrxReportPage
      LargeDesignHeight = True
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 81.877180000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Width = 755.906000000000000000
          Height = 64.277180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de Pagamentos e Recebimentos')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 24.195300000000000000
        Top = 264.567100000000000000
        Width = 755.906000000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = dsPrint
        DataSetName = 'Financeiro'
        RowCount = 0
        object mmFundo: TfrxMemoView
          AllowVectorExport = True
          Width = 755.906000000000000000
          Height = 24.195300000000000000
          DataSet = dsPrint
          DataSetName = 'Financeiro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Highlight.ApplyFont = False
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = []
          Highlight.Condition = '(<Line> mod 2 = 1)'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = 14211288
          Highlight.Frame.Typ = []
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Width = 94.488250000000000000
          Height = 24.195300000000000000
          DataSet = dsPrint
          DataSetName = 'Financeiro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '  [Financeiro."DATA_ACCOUNT"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 94.488250000000000000
          Width = 331.553000000000000000
          Height = 24.195300000000000000
          DataField = 'OPERATION_DESCRIPTION'
          DataSet = dsPrint
          DataSetName = 'Financeiro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Financeiro."OPERATION_DESCRIPTION"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 426.041250000000000000
          Width = 116.888250000000000000
          Height = 24.195300000000000000
          DataSet = dsPrint
          DataSetName = 'Financeiro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[IIF(<Financeiro."TYPE_ACCOUNT"> = '#39'E'#39','#39'Entrada'#39','#39'Sa'#237'da'#39')]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 542.929500000000000000
          Width = 106.488250000000000000
          Height = 24.195300000000000000
          DataSet = dsPrint
          DataSetName = 'Financeiro'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Financeiro."VALUE_ACCOUNT"]   ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 649.417750000000000000
          Width = 106.488250000000000000
          Height = 24.195300000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[FSaldoAnteriorInstituicao]   ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 61.990575590000000000
        Top = 170.078850000000000000
        Width = 755.906000000000000000
        Condition = 'Financeiro."CD_FINANCIAL_INSTITUTION"'
        ReprintOnNewPage = True
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Width = 755.906000000000000000
          Height = 24.195300000000000000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '<b>Institui'#231#227'o: [Financeiro."INSTITUTION_DESCRIPTION"]</b>')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Top = 37.795275590551200000
          Width = 94.488250000000000000
          Height = 24.195300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            ' Data')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 94.488250000000000000
          Top = 37.795275590551200000
          Width = 331.553000000000000000
          Height = 24.195300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Opera'#231#227'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 426.041250000000000000
          Top = 37.795275590551200000
          Width = 116.888250000000000000
          Height = 24.195300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Movimento')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 542.929500000000000000
          Top = 37.795275590551200000
          Width = 106.488250000000000000
          Height = 24.195300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 649.417750000000000000
          Top = 37.795275590000000000
          Width = 106.488250000000000000
          Height = 24.195300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Saldo')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Overlay1: TfrxOverlay
        FillType = ftBrush
        Frame.Typ = []
        Height = 1084.724409448820000000
        Top = 396.850650000000000000
        Width = 755.906000000000000000
        object Memo13: TfrxMemoView
          Align = baClient
          AllowVectorExport = True
          Width = 755.906000000000000000
          Height = 1084.724409448820000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 38.595300000000000000
        Top = 321.260050000000000000
        Width = 755.906000000000000000
        OnBeforePrint = 'GroupFooter1OnBeforePrint'
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Top = 5.600000000000000000
          Width = 755.906000000000000000
          Height = 24.195300000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            
              'Total Institui'#231#227'o:   [SUM(<Financeiro."VALUE_ACCOUNT_TYPE">, Mas' +
              'terData1, 3)]   ')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
      end
    end
  end
  inherited qryPrint: TFDQuery
    Active = True
    SQL.Strings = (
      
        'select FA.ID_FINANCIAL_ACCOUNT, FA.CD_OPERATION, OPE.DESCRIPTION' +
        ' as OPERATION_DESCRIPTION, FA.TYPE_ACCOUNT,'
      
        '       FA.DATA_ACCOUNT, FA.VALUE_ACCOUNT, FA.CD_FINANCIAL_INSTIT' +
        'UTION, FI.DESCRIPTION as INSTITUTION_DESCRIPTION,'
      '       FA.OBSERVATION as OBSERVATION_ACCOUNT,'
      '       case FA.TYPE_ACCOUNT'
      '         when '#39'S'#39' then (FA.VALUE_ACCOUNT * -1)'
      '         else FA.VALUE_ACCOUNT'
      '       end as VALUE_ACCOUNT_TYPE'
      'from FINANCIAL_ACCOUNT FA'
      'inner join OPERATION OPE on (OPE.ID_OPERATION = FA.CD_OPERATION)'
      
        'inner join FINANCIAL_INSTITUTION FI on (FI.ID_FINANCIAL_INSTITUT' +
        'ION = FA.CD_FINANCIAL_INSTITUTION)'
      'where (0 = 1)'
      
        'order by FI.DESCRIPTION asc, FA.DATA_ACCOUNT asc, FA.TYPE_ACCOUN' +
        'T asc, FA.VALUE_ACCOUNT desc')
    object qryPrintID_FINANCIAL_ACCOUNT: TIntegerField
      DisplayLabel = 'ID Registro'
      FieldName = 'ID_FINANCIAL_ACCOUNT'
      Origin = 'ID_FINANCIAL_ACCOUNT'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPrintCD_OPERATION: TIntegerField
      DisplayLabel = 'Cd. Opera'#231#227'o'
      FieldName = 'CD_OPERATION'
      Origin = 'CD_OPERATION'
      Required = True
    end
    object qryPrintOPERATION_DESCRIPTION: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Descri'#231#227'o Opera'#231#227'o'
      FieldName = 'OPERATION_DESCRIPTION'
      Origin = 'DESCRIPTION'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
    object qryPrintTYPE_ACCOUNT: TStringField
      DisplayLabel = 'Entrada/Sa'#237'da'
      FieldName = 'TYPE_ACCOUNT'
      Origin = 'TYPE_ACCOUNT'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryPrintDATA_ACCOUNT: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DATA_ACCOUNT'
      Origin = 'DATA_ACCOUNT'
      Required = True
    end
    object qryPrintVALUE_ACCOUNT: TFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VALUE_ACCOUNT'
      Origin = 'VALUE_ACCOUNT'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryPrintCD_FINANCIAL_INSTITUTION: TIntegerField
      DisplayLabel = 'Cd. Institui'#231#227'o'
      FieldName = 'CD_FINANCIAL_INSTITUTION'
      Origin = 'CD_FINANCIAL_INSTITUTION'
      Required = True
    end
    object qryPrintINSTITUTION_DESCRIPTION: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Institui'#231#227'o Descri'#231#227'o'
      FieldName = 'INSTITUTION_DESCRIPTION'
      Origin = 'DESCRIPTION'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryPrintOBSERVATION_ACCOUNT: TStringField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVATION_ACCOUNT'
      Origin = 'OBSERVATION'
      Size = 255
    end
    object qryPrintVALUE_ACCOUNT_TYPE: TFMTBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Valor Movimento'
      FieldName = 'VALUE_ACCOUNT_TYPE'
      Origin = 'VALUE_ACCOUNT_TYPE'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  inherited dsPrint: TfrxDBDataset
    UserName = 'Financeiro'
    FieldAliases.Strings = (
      'ID_FINANCIAL_ACCOUNT=ID_FINANCIAL_ACCOUNT'
      'CD_OPERATION=CD_OPERATION'
      'OPERATION_DESCRIPTION=OPERATION_DESCRIPTION'
      'TYPE_ACCOUNT=TYPE_ACCOUNT'
      'DATA_ACCOUNT=DATA_ACCOUNT'
      'VALUE_ACCOUNT=VALUE_ACCOUNT'
      'CD_FINANCIAL_INSTITUTION=CD_FINANCIAL_INSTITUTION'
      'INSTITUTION_DESCRIPTION=INSTITUTION_DESCRIPTION'
      'OBSERVATION_ACCOUNT=OBSERVATION_ACCOUNT'
      'VALUE_ACCOUNT_TYPE=VALUE_ACCOUNT_TYPE')
  end
end
