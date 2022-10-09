inherited dmTaskFD: TdmTaskFD
  OnCreate = DataModuleCreate
  Height = 432
  Width = 476
  inherited dsMain: TDataSource
    Top = 75
  end
  object tableTaskState: TFDMemTable
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
    Left = 96
    Top = 24
    object tableTaskStateID: TIntegerField
      FieldName = 'ID'
    end
    object tableTaskStateCODE: TStringField
      FieldName = 'CODE'
      Size = 1
    end
    object tableTaskStateDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 10
    end
  end
  object dsTaskState: TDataSource
    DataSet = tableTaskState
    Left = 96
    Top = 75
  end
  object tableTaskPeriod: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 176
    Top = 24
    object tableTaskPeriodID: TIntegerField
      FieldName = 'ID'
    end
    object tableTaskPeriodCODE: TStringField
      FieldName = 'CODE'
      Size = 1
    end
    object tableTaskPeriodDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 10
    end
  end
  object dsTaskPeriod: TDataSource
    DataSet = tableTaskPeriod
    Left = 176
    Top = 75
  end
  object dsTaskContext: TDataSource
    DataSet = tableTaskContext
    Left = 272
    Top = 75
  end
  object tableTaskContext: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 272
    Top = 24
    object tableTaskContextID: TIntegerField
      FieldName = 'ID'
    end
    object tableTaskContextCODE: TStringField
      FieldName = 'CODE'
      Size = 1
    end
    object tableTaskContextDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 10
    end
  end
end
