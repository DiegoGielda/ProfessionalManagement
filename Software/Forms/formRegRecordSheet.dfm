inherited frmRegRecordSheet: TfrmRegRecordSheet
  Caption = 'Cadastro de Folha Ponto'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRegistration: TPanel
    object lblPersonEmployeeRecordSheet: TLabel [0]
      Left = 239
      Top = 69
      Width = 49
      Height = 16
      Caption = 'Trabalho'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lblIDRecordSheet: TLabel [1]
      Left = 25
      Top = 67
      Width = 12
      Height = 16
      Caption = 'ID'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lblDateRecordRecordSheet: TLabel [2]
      Left = 84
      Top = 69
      Width = 97
      Height = 16
      Caption = 'Data de Registro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    inherited pnlHeader: TPanel
      inherited btnNew: TSpeedButton
        OnClick = btnNewClick
      end
      inherited btnSave: TSpeedButton
        OnClick = btnSaveClick
      end
      inherited btnEdit: TSpeedButton
        OnClick = btnEditClick
      end
      inherited btnNext: TSpeedButton
        OnClick = btnNextClick
      end
      inherited btnPrior: TSpeedButton
        OnClick = btnPriorClick
      end
      inherited btnCancel: TSpeedButton
        OnClick = btnCancelClick
      end
      inherited btnDelete: TSpeedButton
        OnClick = btnDeleteClick
      end
    end
    inherited gridDetail: TGridPanel
      TabOrder = 4
      inherited gridDetailButtons: TGridPanel
        inherited btnNewDetail: TSpeedButton
          OnClick = btnNewDetailClick
        end
        inherited btnEditDetail: TSpeedButton
          OnClick = btnEditDetailClick
        end
        inherited btnDeleteDetail: TSpeedButton
          OnClick = btnDeleteDetailClick
        end
      end
      inherited dbgPatternDetail: TDBGrid
        DataSource = frmListingRecordSheet.dsRecordSheetItemTime
        Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgTitleClick]
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ID_RECORD_SHEET_TIME'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'ID TEMPO RECORD'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMoneyGreen
            Title.Font.Height = -13
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 140
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'TIME_START'
            Title.Alignment = taCenter
            Title.Caption = 'IN'#205'CIO'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMoneyGreen
            Title.Font.Height = -13
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 128
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'TIME_END'
            Title.Alignment = taCenter
            Title.Caption = 'T'#201'RMINO'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clMoneyGreen
            Title.Font.Height = -13
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 120
            Visible = True
          end>
      end
    end
    object edtIDRecordSheet: TDBEdit
      Left = 25
      Top = 88
      Width = 40
      Height = 24
      DataField = 'ID_RECORD_SHEET'
      DataSource = frmListingRecordSheet.dsRecordSheet
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object lookPersonEmployeeRecordSheet: TcxDBLookupComboBox
      Left = 239
      Top = 88
      AutoSize = False
      DataBinding.DataField = 'CD_PERSON_EMPLOYEE'
      DataBinding.DataSource = frmListingRecordSheet.dsRecordSheet
      Properties.KeyFieldNames = 'ID_PERSON_EMPLOYEE'
      Properties.ListColumns = <
        item
          Caption = 'ID'
          HeaderAlignment = taCenter
          Width = 20
          FieldName = 'ID_PERSON_EMPLOYEE'
        end
        item
          Caption = 'NOME'
          HeaderAlignment = taCenter
          FieldName = 'NAME'
        end>
      Properties.ListFieldIndex = 1
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = frmListingRecordSheet.dsPersonEmployee
      TabOrder = 3
      Height = 24
      Width = 282
    end
    object edtDateRecordRecordSheet: TcxDBDateEdit
      Left = 84
      Top = 88
      AutoSize = False
      DataBinding.DataField = 'DATE_RECORD'
      DataBinding.DataSource = frmListingRecordSheet.dsRecordSheet
      TabOrder = 2
      Height = 24
      Width = 127
    end
  end
end
