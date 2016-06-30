inherited frmPMModify: TfrmPMModify
  Left = 103
  Top = 142
  Caption = 'frmPMModify'
  ClientWidth = 913
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTop: TPanel
    Width = 913
    inherited pnlTitle: TPanel
      Width = 870
    end
  end
  inherited pnlDataControl: TPanel
    Width = 913
    Height = 400
    Align = alClient
    object PageControl1: TPageControl
      Left = 2
      Top = 2
      Width = 909
      Height = 396
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #24037#20196#20462#25913
        object DBGrid1: TDBGrid
          Left = 0
          Top = 241
          Width = 901
          Height = 127
          Align = alClient
          DataSource = DataSource1
          ImeName = #20013#25991' (?'#20307') - '#26497'?'#20116'?'
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGrid1CellClick
          Columns = <
            item
              Expanded = False
              FieldName = 'MO_NUMBER'
              Title.Caption = #24037#20196#32232#34399'(1)'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MODEL_NAME'
              Title.Caption = #40251#28023#26009#34399'(2)'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 97
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'START_SN'
              Title.Caption = #36215#22987#26781#30908'(3)'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 142
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'END_SN'
              Title.Caption = #32080#26463#26781#30908'(4)'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clNavy
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MODEL_ID'
              Title.Caption = #27231#31278#34399'(5)'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ROUTE_CODE'
              Title.Caption = #36335#30001#30908'(6)'
              Width = 41
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TARGET_QTY'
              Title.Caption = #30446#27161#25976#37327'(7)'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clGreen
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 48
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INPUT_QTY'
              Title.Caption = #25237#20837#25976#37327'(8)'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clGreen
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OUTPUT_QTY'
              Title.Caption = #29986#20986#25976#37327'(9)'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clGreen
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REV'
              Title.Caption = #40251#28023#29256#27425'(10)'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SHOP_NO'
              Title.Caption = 'SHOP_NO(11)'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'START_GROUP'
              Title.Caption = 'START_GROUP(12_'
              Width = 88
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'END_GROUP'
              Title.Caption = 'END_GROUP(13)'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLOSE_FLAG'
              Title.Caption = 'CLOSE_FLAG(14)'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEFAULT_LINE'
              Title.Caption = 'DEFAULT_LINE(15)'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MO_CREATE_DATE'
              Title.Caption = 'MO_CREATE_DATE(16)'
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MO_SCHEDULE_DATE'
              Title.Caption = 'MO_SCHEDULE_DATE(17)'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MO_TARGET_DATE'
              Title.Caption = 'MO_TARGET_DATE(18)'
              Width = 73
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MO_START_DATE'
              Title.Caption = 'MO_START_DATE(19)'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MO_CLOSE_DATE'
              Title.Caption = 'MO_CLOSE_DATE(20)'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MO_OPTION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MO_TYPE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUST_NO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OUTPUT_GROUP'
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STOCK_IN_QTY'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STOCK_OUT_QTY'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SHIPPING_QTY'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REWORK_QTY'
              Width = 91
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SCRAP_QTY'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REWORK_TYPE'
              Visible = True
            end>
        end
        object GroupBox1: TGroupBox
          Left = 0
          Top = 41
          Width = 901
          Height = 200
          Align = alTop
          Caption = #24037#20196#20449#24687
          TabOrder = 1
          object Label2: TLabel
            Left = 24
            Top = 25
            Width = 53
            Height = 13
            AutoSize = False
            Caption = #40251#28023#26009#34399
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label3: TLabel
            Left = 24
            Top = 55
            Width = 55
            Height = 13
            AutoSize = False
            Caption = #40251#28023#29256#27425
          end
          object Label6: TLabel
            Left = 24
            Top = 86
            Width = 55
            Height = 13
            AutoSize = False
            Caption = #36335'       '#30001
          end
          object Label7: TLabel
            Left = 24
            Top = 115
            Width = 55
            Height = 13
            AutoSize = False
            Caption = #24037#20196#29376#24907
          end
          object Label8: TLabel
            Left = 24
            Top = 145
            Width = 55
            Height = 13
            AutoSize = False
            Caption = #30446#27161#25976#37327
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label10: TLabel
            Left = 308
            Top = 169
            Width = 85
            Height = 13
            AutoSize = False
            Caption = #24037#20196#24314#31435#26178#38291
          end
          object Label11: TLabel
            Left = 22
            Top = 173
            Width = 55
            Height = 13
            AutoSize = False
            Caption = #35336#21123#26178#38291
          end
          object Label13: TLabel
            Left = 331
            Top = 139
            Width = 60
            Height = 13
            AutoSize = False
            Caption = #32080#26463#26781#30908
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label14: TLabel
            Left = 332
            Top = 110
            Width = 58
            Height = 13
            AutoSize = False
            Caption = #36215#22987#26781#30908
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label15: TLabel
            Left = 332
            Top = 81
            Width = 55
            Height = 13
            AutoSize = False
            Caption = #32080#26463#24037#31449
          end
          object Label16: TLabel
            Left = 332
            Top = 52
            Width = 55
            Height = 13
            AutoSize = False
            Caption = #36215#22987#24037#31449
          end
          object Label17: TLabel
            Left = 332
            Top = 24
            Width = 55
            Height = 13
            AutoSize = False
            Caption = #25237#20837#25976#37327
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label5: TLabel
            Left = 760
            Top = 12
            Width = 81
            Height = 17
            AutoSize = False
            Caption = #20170#26085#24037#20196
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -16
            Font.Name = #26032#32048#26126#39636
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel
            Left = 640
            Top = 12
            Width = 81
            Height = 17
            AutoSize = False
            Caption = #26126#26085#24037#20196
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -16
            Font.Name = #26032#32048#26126#39636
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Edit2: TEdit
            Left = 88
            Top = 23
            Width = 202
            Height = 21
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ImeName = #20013#25991' (?'#20307') - '#26497'?'#20116'?'
            ParentFont = False
            TabOrder = 0
          end
          object Edit3: TEdit
            Left = 88
            Top = 51
            Width = 202
            Height = 21
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ImeName = #20013#25991' (?'#20307') - '#26497'?'#20116'?'
            ParentFont = False
            TabOrder = 1
          end
          object Edit7: TEdit
            Left = 88
            Top = 110
            Width = 202
            Height = 21
            Enabled = False
            ImeName = #20013#25991' (?'#20307') - '#26497'?'#20116'?'
            TabOrder = 2
          end
          object Edit8: TEdit
            Left = 88
            Top = 139
            Width = 202
            Height = 21
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ImeName = #20013#25991' (?'#20307') - '#26497'?'#20116'?'
            ParentFont = False
            TabOrder = 3
          end
          object Edit10: TEdit
            Left = 396
            Top = 164
            Width = 193
            Height = 21
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ImeName = #20013#25991' (?'#20307') - '#26497'?'#20116'?'
            ParentFont = False
            TabOrder = 4
          end
          object Edit11: TEdit
            Left = 88
            Top = 167
            Width = 202
            Height = 21
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ImeName = #20013#25991' (?'#20307') - '#26497'?'#20116'?'
            ParentFont = False
            TabOrder = 5
          end
          object Edit13: TEdit
            Left = 396
            Top = 134
            Width = 193
            Height = 21
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ImeName = #20013#25991' (?'#20307') - '#26497'?'#20116'?'
            ParentFont = False
            TabOrder = 6
          end
          object Edit14: TEdit
            Left = 396
            Top = 105
            Width = 193
            Height = 21
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ImeName = #20013#25991' (?'#20307') - '#26497'?'#20116'?'
            ParentFont = False
            TabOrder = 7
          end
          object Edit17: TEdit
            Left = 396
            Top = 19
            Width = 193
            Height = 21
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ImeName = #20013#25991' (?'#20307') - '#26497'?'#20116'?'
            ParentFont = False
            TabOrder = 8
          end
          object ListBox1: TListBox
            Left = 736
            Top = 32
            Width = 113
            Height = 153
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' (?'#20307') - '#26497'?'#20116'?'
            ItemHeight = 16
            ParentFont = False
            TabOrder = 9
            OnClick = ListBox1Click
          end
          object ListBox2: TListBox
            Left = 616
            Top = 32
            Width = 113
            Height = 153
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ImeName = #20013#25991' (?'#20307') - '#26497'?'#20116'?'
            ItemHeight = 16
            ParentFont = False
            TabOrder = 10
            OnClick = ListBox2Click
          end
          object SpinEdit1: TSpinEdit
            Left = 89
            Top = 80
            Width = 200
            Height = 22
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxValue = 0
            MinValue = 0
            ParentFont = False
            TabOrder = 11
            Value = 0
            OnChange = SpinEdit1Change
            OnKeyPress = SpinEdit1KeyPress
          end
          object ComboBox1: TComboBox
            Left = 396
            Top = 48
            Width = 195
            Height = 21
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ItemHeight = 13
            ParentFont = False
            TabOrder = 12
          end
          object ComboBox2: TComboBox
            Left = 396
            Top = 77
            Width = 196
            Height = 21
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ItemHeight = 13
            ParentFont = False
            TabOrder = 13
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 901
          Height = 41
          Align = alTop
          TabOrder = 2
          object Label1: TLabel
            Left = 8
            Top = 15
            Width = 65
            Height = 13
            AutoSize = False
            Caption = #24037#20196#32232#34399
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Edit1: TEdit
            Left = 80
            Top = 10
            Width = 121
            Height = 21
            TabOrder = 0
            OnChange = Edit1Change
          end
          object BitBtn1: TBitBtn
            Left = 216
            Top = 8
            Width = 75
            Height = 25
            Caption = #25628#32034#24037#20196
            Enabled = False
            TabOrder = 1
            OnClick = BitBtn1Click
          end
          object Button1: TButton
            Left = 304
            Top = 8
            Width = 75
            Height = 25
            Caption = #21034#38500#24037#20196
            Enabled = False
            TabOrder = 2
            OnClick = Button1Click
          end
          object Button3: TButton
            Left = 391
            Top = 8
            Width = 79
            Height = 25
            Hint = #21482#33021#20462#25913#40251#28023#26009#34399#65292#29256#27425#65292#36335#30001#65292#36215#22987#24037#31449#21644#32080#26463#24037#31449
            Caption = #20462#25913#24037#20196
            TabOrder = 3
            OnClick = Button3Click
          end
          object Button4: TButton
            Left = 480
            Top = 8
            Width = 89
            Height = 25
            Caption = #20445#23384
            TabOrder = 4
            OnClick = Button4Click
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'MAXID'
        ImageIndex = 1
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 901
          Height = 41
          Align = alTop
          TabOrder = 0
          object Label18: TLabel
            Left = 16
            Top = 8
            Width = 57
            Height = 13
            AutoSize = False
            Caption = #26781#30908#21069#32180
          end
          object Label12: TLabel
            Left = 384
            Top = 8
            Width = 73
            Height = 13
            AutoSize = False
            Caption = #30070#21069#26368#22823#20540
          end
          object Edit18: TEdit
            Left = 80
            Top = 5
            Width = 121
            Height = 21
            ImeName = #20013#25991' (?'#20307') - '#26497'?'#20116'?'
            TabOrder = 0
          end
          object Button2: TButton
            Left = 216
            Top = 2
            Width = 75
            Height = 25
            Caption = #26597#35426
            TabOrder = 1
            OnClick = Button2Click
          end
          object BitBtn2: TBitBtn
            Left = 296
            Top = 2
            Width = 75
            Height = 25
            Caption = #33258#23450#32681
            TabOrder = 2
            OnClick = BitBtn2Click
          end
          object Edit12: TEdit
            Left = 454
            Top = 3
            Width = 51
            Height = 21
            Enabled = False
            ImeName = #20013#25991' (?'#20307') - '#26497'?'#20116'?'
            TabOrder = 3
          end
          object BitBtn3: TBitBtn
            Left = 512
            Top = 3
            Width = 65
            Height = 24
            Caption = #20462#25913
            TabOrder = 4
            OnClick = BitBtn3Click
          end
        end
        object GroupBox2: TGroupBox
          Left = 0
          Top = 41
          Width = 901
          Height = 327
          Align = alClient
          Caption = 'MAXID'#26126#32048
          TabOrder = 1
          object DBGrid2: TDBGrid
            Left = 2
            Top = 15
            Width = 897
            Height = 310
            Align = alClient
            DataSource = DataSource2
            ImeName = #20013#25991' (?'#20307') - '#26497'?'#20116'?'
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = DBGrid2CellClick
            Columns = <
              item
                Expanded = False
                FieldName = 'SN_HEAD'
                Title.Caption = #26781#30908#21069#32180
                Width = 138
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CURRENT_MAXID'
                Title.Caption = #30070#21069#26368#22823#30908
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RULE_ID'
                Title.Caption = #26781#30908'ID'
                Width = 82
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SN_TYPE'
                Title.Caption = #26781#30908#39006#21029
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LOCKED'
                Visible = True
              end>
          end
        end
      end
    end
  end
  inherited pnlMsg: TPanel
    Width = 913
  end
  inherited pnlOhter: TPanel
    Width = 913
    Visible = False
  end
  inherited pnlDataShow: TPanel
    Top = 441
    Width = 913
    Height = 6
    Align = alBottom
    Visible = False
  end
  inherited AdoQryTemp: TADOQuery
    Left = 616
    Top = 41
  end
  inherited AdoQryData: TADOQuery
    Left = 648
    Top = 41
  end
  inherited AdoCmmdTemp: TADOCommand
    Left = 680
    Top = 41
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 600
    Top = 8
  end
  object ADOQuery2: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM R_SN_MAXID_T')
    Left = 568
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 536
    Top = 8
  end
  object ADOQuery1: TADOQuery
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from R_MO_BASE_T')
    Left = 504
    Top = 8
  end
  object NORMALFONT: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 472
    Top = 8
  end
  object JGFont: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Left = 440
    Top = 8
  end
end
