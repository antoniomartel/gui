inherited vList: TvList
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 320
    Height = 25
    Align = alTop
    TabOrder = 0
  end
  object grList: TDBGrid
    Left = 0
    Top = 25
    Width = 320
    Height = 215
    Align = alClient
    DataSource = DataSource
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DataSource: TDataSource
    DataSet = Table
    Left = 72
    Top = 16
  end
  object Table: TTable
    Left = 40
    Top = 16
  end
end
