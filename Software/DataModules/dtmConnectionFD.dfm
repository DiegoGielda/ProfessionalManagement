object dmConnectionFD: TdmConnectionFD
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 93
  Width = 365
  object fdConnection: TFDConnection
    Params.Strings = (
      'Database=C:\ProfessionalManagement\Database\Development.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 32
    Top = 16
  end
  object fdCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 112
    Top = 16
  end
  object fdDriver: TFDPhysFBDriverLink
    VendorLib = 'C:\ProfessionalManagement\Database\fbclient.dll'
    Left = 192
    Top = 16
  end
  object fdErroDialog: TFDGUIxErrorDialog
    Provider = 'Forms'
    Left = 272
    Top = 16
  end
end
