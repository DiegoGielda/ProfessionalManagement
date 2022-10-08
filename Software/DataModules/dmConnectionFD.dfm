object dtmConnectionFD: TdtmConnectionFD
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 93
  Width = 365
  object fdConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\diego.gielda\Documents\ArquivosGIT\Professiona' +
        'lManagement\Database\ProfessionalManagement.FDB'
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
    VendorLib = 
      'C:\Users\diego.gielda\Documents\ArquivosGIT\ProfessionalManageme' +
      'nt\Database\fbclient.dll'
    Left = 192
    Top = 16
  end
  object fdErroDialog: TFDGUIxErrorDialog
    Provider = 'Forms'
    Left = 272
    Top = 16
  end
end
