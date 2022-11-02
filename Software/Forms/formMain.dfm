object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 437
  ClientWidth = 1007
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 1007
    Height = 437
    Align = alClient
    TabOrder = 0
  end
  object MainMenu: TMainMenu
    Left = 16
    Top = 8
    object mnRegistration: TMenuItem
      AutoHotkeys = maAutomatic
      Caption = 'Cadastros'
      object mnCompany: TMenuItem
        Caption = 'Empresa'
        OnClick = mnCompanyClick
      end
      object mnJob: TMenuItem
        Caption = 'Cargo'
        OnClick = mnJobClick
      end
      object mnPerson: TMenuItem
        Caption = 'Pessoa'
        OnClick = mnPersonClick
      end
    end
    object mnTask: TMenuItem
      Caption = 'Tarefas'
      object mnRegistrationTask: TMenuItem
        Caption = 'Cadastro de Tarefa'
        OnClick = mnRegistrationTaskClick
      end
    end
    object mnFinancial: TMenuItem
      Caption = 'Financeiro'
      object mnRegistrationAccount: TMenuItem
        Caption = 'Conta'
        OnClick = mnRegistrationAccountClick
      end
    end
    object mmRecordSheet: TMenuItem
      Caption = 'Folha Registro'
      object mnRegistrationRecordSheet: TMenuItem
        Caption = 'Registro'
        OnClick = mnRegistrationRecordSheetClick
      end
    end
  end
end
