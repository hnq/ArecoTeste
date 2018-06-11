object DTMGERAL: TDTMGERAL
  OldCreateOrder = False
  Height = 242
  Width = 418
  object ADOQuery1: TADOQuery
    Parameters = <>
    Left = 288
    Top = 48
  end
  object ADOTable1: TADOTable
    Left = 176
    Top = 112
  end
  object ADOGERAL: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=Postg' +
      'reSQL32Unicode;Initial Catalog=Teste01'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 104
    Top = 40
  end
end
