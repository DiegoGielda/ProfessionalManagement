inherited frmRegTask: TfrmRegTask
  Caption = 'Cadastro de Tarefa'
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object lblContextTask: TLabel [0]
    Left = 25
    Top = 181
    Width = 52
    Height = 16
    Caption = 'Contexto'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lblDateConcludedTask: TLabel [1]
    Left = 474
    Top = 182
    Width = 110
    Height = 16
    Caption = 'Data de Conclus'#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lblDateRegistrationTask: TLabel [2]
    Left = 186
    Top = 182
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
  object lblDateToDoTask: TLabel [3]
    Left = 330
    Top = 182
    Width = 107
    Height = 16
    Caption = 'Data para Realizar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lblDescriptionTask: TLabel [4]
    Left = 90
    Top = 69
    Width = 58
    Height = 16
    Caption = 'Descri'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lblIDTask: TLabel [5]
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
  object lblPeriodTask: TLabel [6]
    Left = 25
    Top = 125
    Width = 44
    Height = 16
    Caption = 'Per'#237'odo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lblRemarckTask: TLabel [7]
    Left = 186
    Top = 124
    Width = 68
    Height = 16
    Caption = 'Observa'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object lblStateTask: TLabel [8]
    Left = 525
    Top = 69
    Width = 38
    Height = 16
    Caption = 'Status'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  inherited pnlRegistration: TPanel
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
  end
  object edtDateConcludedTask: TcxDBDateEdit
    Left = 474
    Top = 200
    AutoSize = False
    DataBinding.DataField = 'DATE_CONCLUDED'
    DataBinding.DataSource = frmListingTask.dsTask
    TabOrder = 1
    Height = 24
    Width = 127
  end
  object edtDateRegistrationTask: TcxDBDateEdit
    Left = 186
    Top = 200
    AutoSize = False
    DataBinding.DataField = 'DATE_REGISTRATION'
    DataBinding.DataSource = frmListingTask.dsTask
    TabOrder = 2
    Height = 24
    Width = 127
  end
  object edtDateToDoTask: TcxDBDateEdit
    Left = 330
    Top = 200
    AutoSize = False
    DataBinding.DataField = 'DATE_TO_DO'
    DataBinding.DataSource = frmListingTask.dsTask
    TabOrder = 3
    Height = 24
    Width = 127
  end
  object edtDescriptionTask: TDBEdit
    Left = 90
    Top = 88
    Width = 413
    Height = 24
    DataField = 'DESCRIPTION'
    DataSource = frmListingTask.dsTask
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
  end
  object edtIDTask: TDBEdit
    Left = 25
    Top = 88
    Width = 40
    Height = 24
    DataField = 'ID_TASK'
    DataSource = frmListingTask.dsTask
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object edtRemarckTask: TDBEdit
    Left = 186
    Top = 143
    Width = 799
    Height = 24
    DataField = 'REMARK'
    DataSource = frmListingTask.dsTask
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object lookContextTask: TcxDBLookupComboBox
    Left = 25
    Top = 200
    AutoSize = False
    DataBinding.DataField = 'CONTEXT'
    DataBinding.DataSource = frmListingTask.dsTask
    Properties.KeyFieldNames = 'CODE'
    Properties.ListColumns = <
      item
        HeaderAlignment = taCenter
        MinWidth = 6
        Width = 10
        FieldName = 'ID'
      end
      item
        Caption = 'Descri'#231#227'o'
        HeaderAlignment = taCenter
        FieldName = 'DESCRIPTION'
      end
      item
        Caption = 'C'#243'digo'
        HeaderAlignment = taCenter
        FieldName = 'CODE'
      end>
    Properties.ListFieldIndex = 1
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dmTaskFD.dsTaskContext
    TabOrder = 7
    Height = 24
    Width = 145
  end
  object lookPeriodTask: TcxDBLookupComboBox
    Left = 25
    Top = 144
    AutoSize = False
    DataBinding.DataField = 'PERIOD'
    DataBinding.DataSource = frmListingTask.dsTask
    Properties.KeyFieldNames = 'CODE'
    Properties.ListColumns = <
      item
        HeaderAlignment = taCenter
        MinWidth = 6
        Width = 10
        FieldName = 'ID'
      end
      item
        Caption = 'Descri'#231#227'o'
        HeaderAlignment = taCenter
        FieldName = 'DESCRIPTION'
      end
      item
        Caption = 'C'#243'digo'
        HeaderAlignment = taCenter
        FieldName = 'CODE'
      end>
    Properties.ListFieldIndex = 1
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dmTaskFD.dsTaskPeriod
    TabOrder = 8
    Height = 24
    Width = 145
  end
  object lookStateTask: TcxDBLookupComboBox
    Left = 525
    Top = 88
    AutoSize = False
    DataBinding.DataField = 'STATE'
    DataBinding.DataSource = frmListingTask.dsTask
    Properties.KeyFieldNames = 'CODE'
    Properties.ListColumns = <
      item
        HeaderAlignment = taCenter
        MinWidth = 6
        Width = 10
        FieldName = 'ID'
      end
      item
        Caption = 'Descri'#231#227'o'
        HeaderAlignment = taCenter
        FieldName = 'DESCRIPTION'
      end
      item
        Caption = 'C'#243'digo'
        HeaderAlignment = taCenter
        FieldName = 'CODE'
      end>
    Properties.ListFieldIndex = 1
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = dmTaskFD.dsTaskState
    TabOrder = 9
    Height = 24
    Width = 145
  end
end
