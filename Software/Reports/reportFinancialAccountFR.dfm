inherited rptFinancialAccountFR: TrptFinancialAccountFR
  Caption = 'Relat'#243'rio de Contas a Pagar/Receber'
  PixelsPerInch = 96
  TextHeight = 13
  inherited plnFilters: TPanel
    inherited pnlReportTitle: TPanel
      inherited lblReportTitle: TLabel
        Width = 501
        Height = 36
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
    ReportOptions.LastChange = 45041.989205972200000000
    ScriptText.Strings = (
      'var'
      '  FSaldoInstituicao: Currency;           '
      '  FSaldoAnteriorInstituicao: Currency;'
      ''
      
        'procedure printReportOnStartReport_inherited(Sender: TfrxCompone' +
        'nt);'
      'begin'
      '  FSaldoInstituicao := 0;         '
      'end;    '
      '  '
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  FSaldoInstituicao := 0;                         '
      
        '// Temporario at'#233' adicionar o filtro de data                    ' +
        '                                                                ' +
        '                              '
      
        '//  FSaldoInstituicao := <mInstituicao."VALUE_ACCOUNT_CURRENT">;' +
        '                            '
      'end;'
      '  '
      'procedure DetailData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      
        '  FSaldoInstituicao := FSaldoInstituicao + <dFinanceiro."VALUE_A' +
        'CCOUNT_MOVEMENT">;  '
      'end;'
      ''
      'begin      '
      'end.')
    OnStartReport = 'printReportOnStartReport_inherited'
    Datasets = <
      item
        DataSet = frxDetailAccount
        DataSetName = 'dFinanceiro'
      end
      item
        DataSet = frxPrint
        DataSetName = 'mInstituicao'
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
            'Relat'#243'rio de Pagamentos e Recebimentos'
            'por Institui'#231#227'o Financeira')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 66.914533330000000000
        Top = 170.078850000000000000
        Width = 755.906000000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = frxPrint
        DataSetName = 'mInstituicao'
        PrintIfDetailEmpty = True
        RowCount = 0
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Top = 6.000000000000000000
          Width = 755.906000000000000000
          Height = 24.195300000000000000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '<b>Institui'#231#227'o: [mInstituicao."INSTITUTION_DESCRIPTION"]</b>')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 456.084416670000000000
          Top = 42.719233330000000000
          Width = 299.821583330000000000
          Height = 24.195300000000000000
          AllowHTMLTags = True
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Saldo Anterior:   <u>[FSaldoInstituicao]</u>   ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Width = 755.906000000000000000
          Height = 1.889763779527560000
          AllowHTMLTags = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          HAlign = haCenter
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object Overlay1: TfrxOverlay
        FillType = ftBrush
        Frame.Typ = []
        Height = 1084.724409448820000000
        Top = 434.645950000000000000
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
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Frame.Typ = []
        Height = 24.195300000000000000
        Top = 321.260050000000000000
        Width = 755.906000000000000000
        OnBeforePrint = 'DetailData1OnBeforePrint'
        DataSet = frxDetailAccount
        DataSetName = 'dFinanceiro'
        PrintIfDetailEmpty = True
        RowCount = 0
        object mmFundo: TfrxMemoView
          AllowVectorExport = True
          Width = 755.906000000000000000
          Height = 24.195300000000000000
          DataSet = frxPrint
          DataSetName = 'mInstituicao'
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
          DataSet = frxPrint
          DataSetName = 'mInstituicao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '  [dFinanceiro."DATA_ACCOUNT"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 94.488250000000000000
          Width = 331.553000000000000000
          Height = 24.195300000000000000
          DataSet = frxPrint
          DataSetName = 'mInstituicao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[dFinanceiro."OPERATION_DESCRIPTION"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 426.041250000000000000
          Width = 116.888250000000000000
          Height = 24.195300000000000000
          DataSet = frxPrint
          DataSetName = 'mInstituicao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[IIF(<dFinanceiro."TYPE_ACCOUNT"> = '#39'E'#39','#39'Entrada'#39','#39'Sa'#237'da'#39')]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 542.929500000000000000
          Width = 106.488250000000000000
          Height = 24.195300000000000000
          DataSet = frxPrint
          DataSetName = 'mInstituicao'
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
            '[dFinanceiro."VALUE_ACCOUNT_MOVEMENT"]')
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
            '[FSaldoInstituicao]   ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object HeaderDetailData1: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 24.195300000000000000
        Top = 264.567100000000000000
        Width = 755.906000000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 94.488250000000000000
          Height = 24.195300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            ' Data')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 94.488250000000000000
          Width = 331.553000000000000000
          Height = 24.195300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8W = (
            'Opera'#231#227'o')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 426.041250000000000000
          Width = 116.888250000000000000
          Height = 24.195300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Movimento')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 542.929500000000000000
          Width = 106.488250000000000000
          Height = 24.195300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 649.417750000000000000
          Width = 106.488250000000000000
          Height = 24.195300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Saldo')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object FooterDetailData1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 35.197924670000000000
        Top = 377.953000000000000000
        Width = 755.906000000000000000
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Top = 5.669291340000000000
          Width = 755.906000000000000000
          Height = 24.195300000000000000
          AllowHTMLTags = True
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 5676804
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Total Institui'#231#227'o:   <u>[FSaldoInstituicao]</u>   ')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
      end
    end
  end
  inherited qryPrint: TFDQuery
    SQL.Strings = (
      
        'select FI.ID_FINANCIAL_INSTITUTION, FI.DESCRIPTION as INSTITUTIO' +
        'N_DESCRIPTION,'
      '       (select sum(FA.VALUE_ACCOUNT_MOVEMENT)'
      '        from FINANCIAL_ACCOUNT FA'
      
        '        where (FA.CD_FINANCIAL_INSTITUTION = FI.ID_FINANCIAL_INS' +
        'TITUTION)) as VALUE_ACCOUNT_CURRENT'
      'from FINANCIAL_INSTITUTION FI'
      'where (0 = 1)'
      'order by FI.DESCRIPTION asc')
    Left = 552
    object qryPrintID_FINANCIAL_INSTITUTION: TIntegerField
      FieldName = 'ID_FINANCIAL_INSTITUTION'
      Origin = 'ID_FINANCIAL_INSTITUTION'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPrintINSTITUTION_DESCRIPTION: TStringField
      FieldName = 'INSTITUTION_DESCRIPTION'
      Origin = 'DESCRIPTION'
      Required = True
      Size = 100
    end
    object qryPrintVALUE_ACCOUNT_CURRENT: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALUE_ACCOUNT_CURRENT'
      Origin = 'VALUE_ACCOUNT_CURRENT'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  inherited frxPrint: TfrxDBDataset
    UserName = 'mInstituicao'
    FieldAliases.Strings = (
      'ID_FINANCIAL_INSTITUTION=ID_FINANCIAL_INSTITUTION'
      'INSTITUTION_DESCRIPTION=INSTITUTION_DESCRIPTION'
      'VALUE_ACCOUNT_CURRENT=VALUE_ACCOUNT_CURRENT')
  end
  object qryDetailAccount: TFDQuery [5]
    MasterSource = dsPrint
    MasterFields = 'ID_FINANCIAL_INSTITUTION'
    DetailFields = 'CD_FINANCIAL_INSTITUTION'
    Connection = dmConnectionFD.fdConnection
    SQL.Strings = (
      
        'select FA.ID_FINANCIAL_ACCOUNT, FA.CD_OPERATION, OPE.DESCRIPTION' +
        ' as OPERATION_DESCRIPTION, FA.TYPE_ACCOUNT,'
      
        '       FA.DATA_ACCOUNT, FA.VALUE_ACCOUNT, FA.VALUE_ACCOUNT_MOVEM' +
        'ENT, FA.CD_FINANCIAL_INSTITUTION,'
      
        '       FI.DESCRIPTION as INSTITUTION_DESCRIPTION, FA.OBSERVATION' +
        ' as OBSERVATION_ACCOUNT'
      'from FINANCIAL_ACCOUNT FA'
      'inner join OPERATION OPE on (OPE.ID_OPERATION = FA.CD_OPERATION)'
      
        'inner join FINANCIAL_INSTITUTION FI on (FI.ID_FINANCIAL_INSTITUT' +
        'ION = FA.CD_FINANCIAL_INSTITUTION)'
      'where (FA.CD_FINANCIAL_INSTITUTION = :ID_FINANCIAL_INSTITUTION)'
      
        'order by FI.DESCRIPTION asc, FA.DATA_ACCOUNT asc, FA.TYPE_ACCOUN' +
        'T asc, FA.VALUE_ACCOUNT desc')
    Left = 585
    Top = 280
    ParamData = <
      item
        Name = 'ID_FINANCIAL_INSTITUTION'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qryDetailAccountID_FINANCIAL_ACCOUNT: TIntegerField
      FieldName = 'ID_FINANCIAL_ACCOUNT'
      Origin = 'ID_FINANCIAL_ACCOUNT'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryDetailAccountCD_OPERATION: TIntegerField
      FieldName = 'CD_OPERATION'
      Origin = 'CD_OPERATION'
      Required = True
    end
    object qryDetailAccountOPERATION_DESCRIPTION: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'OPERATION_DESCRIPTION'
      Origin = 'DESCRIPTION'
      ProviderFlags = []
      ReadOnly = True
      Size = 255
    end
    object qryDetailAccountTYPE_ACCOUNT: TStringField
      FieldName = 'TYPE_ACCOUNT'
      Origin = 'TYPE_ACCOUNT'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryDetailAccountDATA_ACCOUNT: TDateField
      FieldName = 'DATA_ACCOUNT'
      Origin = 'DATA_ACCOUNT'
      Required = True
    end
    object qryDetailAccountVALUE_ACCOUNT: TFMTBCDField
      FieldName = 'VALUE_ACCOUNT'
      Origin = 'VALUE_ACCOUNT'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryDetailAccountVALUE_ACCOUNT_MOVEMENT: TFMTBCDField
      FieldName = 'VALUE_ACCOUNT_MOVEMENT'
      Origin = 'VALUE_ACCOUNT_MOVEMENT'
      Precision = 18
      Size = 2
    end
    object qryDetailAccountCD_FINANCIAL_INSTITUTION: TIntegerField
      FieldName = 'CD_FINANCIAL_INSTITUTION'
      Origin = 'CD_FINANCIAL_INSTITUTION'
      Required = True
    end
    object qryDetailAccountINSTITUTION_DESCRIPTION: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'INSTITUTION_DESCRIPTION'
      Origin = 'DESCRIPTION'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryDetailAccountOBSERVATION_ACCOUNT: TStringField
      FieldName = 'OBSERVATION_ACCOUNT'
      Origin = 'OBSERVATION'
      Size = 255
    end
  end
  object frxDetailAccount: TfrxDBDataset [6]
    UserName = 'dFinanceiro'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ID_FINANCIAL_ACCOUNT=ID_FINANCIAL_ACCOUNT'
      'CD_OPERATION=CD_OPERATION'
      'OPERATION_DESCRIPTION=OPERATION_DESCRIPTION'
      'TYPE_ACCOUNT=TYPE_ACCOUNT'
      'DATA_ACCOUNT=DATA_ACCOUNT'
      'VALUE_ACCOUNT=VALUE_ACCOUNT'
      'VALUE_ACCOUNT_MOVEMENT=VALUE_ACCOUNT_MOVEMENT'
      'CD_FINANCIAL_INSTITUTION=CD_FINANCIAL_INSTITUTION'
      'INSTITUTION_DESCRIPTION=INSTITUTION_DESCRIPTION'
      'OBSERVATION_ACCOUNT=OBSERVATION_ACCOUNT')
    DataSet = qryDetailAccount
    BCDToCurrency = False
    Left = 585
    Top = 328
  end
end
