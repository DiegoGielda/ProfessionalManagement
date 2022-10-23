inherited frmRegJob: TfrmRegJob
  Caption = 'Cadastro de Cargo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlRegistration: TPanel
    object lblCompany: TLabel [0]
      Left = 362
      Top = 69
      Width = 52
      Height = 16
      Caption = 'Empresa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object lblDescriptionJob: TLabel [1]
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
    object lblIDJob: TLabel [2]
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
    object edtDescriptionJob: TDBEdit
      Left = 90
      Top = 88
      Width = 248
      Height = 24
      DataField = 'JOB'
      DataSource = frmListingJob.dsJob
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edtIDJob: TDBEdit
      Left = 25
      Top = 88
      Width = 40
      Height = 24
      DataField = 'ID_JOB'
      DataSource = frmListingJob.dsJob
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object lookStateTask: TcxDBLookupComboBox
      Left = 362
      Top = 88
      AutoSize = False
      DataBinding.DataField = 'CD_COMPANY'
      DataBinding.DataSource = frmListingJob.dsJob
      Properties.KeyFieldNames = 'ID_COMPANY'
      Properties.ListColumns = <
        item
          Caption = 'ID'
          HeaderAlignment = taCenter
          FieldName = 'ID_COMPANY'
        end
        item
          Caption = 'Empresa'
          HeaderAlignment = taCenter
          FieldName = 'COMPANY'
        end>
      Properties.ListFieldIndex = 1
      Properties.ListOptions.ShowHeader = False
      Properties.ListSource = frmListingJob.dsJobCompany
      TabOrder = 3
      Height = 24
      Width = 255
    end
  end
end
