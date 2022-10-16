inherited dmFinancialAccountFD: TdmFinancialAccountFD
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 334
  Width = 465
  object dsFinancialAccountType: TDataSource
    DataSet = tableFinancialAccountType
    Left = 120
    Top = 88
  end
  object tableFinancialAccountType: TFDMemTable
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 120
    Top = 24
    object tableFinancialAccountTypeID: TIntegerField
      FieldName = 'ID'
    end
    object tableFinancialAccountTypeCODE: TStringField
      FieldName = 'CODE'
      Size = 1
    end
    object tableFinancialAccountTypeDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 10
    end
  end
end
