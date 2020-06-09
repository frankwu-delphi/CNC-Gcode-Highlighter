object Form1: TForm1
  Left = 268
  Top = 107
  Caption = 'CNC(G-Code) Highlighter demo'
  ClientHeight = 402
  ClientWidth = 693
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SynEdit1: TSynEdit
    Left = 0
    Top = 0
    Width = 693
    Height = 402
    Align = alClient
    Color = clHighlightText
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    TabOrder = 0
    CodeFolding.GutterShapeSize = 11
    CodeFolding.CollapsedLineColor = clGrayText
    CodeFolding.FolderBarLinesColor = clGrayText
    CodeFolding.IndentGuidesColor = clGray
    CodeFolding.IndentGuides = True
    CodeFolding.ShowCollapsedLine = False
    CodeFolding.ShowHintMark = True
    UseCodeFolding = False
    ExtraLineSpacing = 1
    Gutter.AutoSize = True
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -13
    Gutter.Font.Name = 'Tahoma'
    Gutter.Font.Style = []
    Options = [eoAltSetsColumnMode, eoAutoIndent, eoDragDropEditing, eoEnhanceEndKey, eoGroupUndo, eoScrollPastEol, eoShowScrollHint, eoSmartTabDelete, eoSmartTabs, eoTabsToSpaces]
    FontSmoothing = fsmClearType
    RemovedKeystrokes = <
      item
        Command = ecCut
        ShortCut = 8238
      end
      item
        Command = ecPaste
        ShortCut = 8237
      end
      item
        Command = ecDeleteChar
        ShortCut = 46
      end
      item
        Command = ecContextHelp
        ShortCut = 112
      end
      item
        Command = ecPaste
        ShortCut = 16470
      end
      item
        Command = ecCut
        ShortCut = 16472
      end
      item
        Command = ecBlockIndent
        ShortCut = 24649
      end
      item
        Command = ecBlockUnindent
        ShortCut = 24661
      end
      item
        Command = ecLineBreak
        ShortCut = 16461
      end
      item
        Command = ecInsertLine
        ShortCut = 16462
      end
      item
        Command = ecDeleteWord
        ShortCut = 16468
      end>
    AddedKeystrokes = <
      item
        Command = ecPaste
        ShortCut = 8238
      end
      item
        Command = ecDeleteChar
        ShortCut = 8237
      end
      item
        Command = ecCut
        ShortCut = 46
      end
      item
        Command = ecContextHelp
        ShortCut = 16496
      end
      item
        Command = ecBlockIndent
        ShortCut = 16470
      end
      item
        Command = ecLineBreak
        ShortCut = 16472
      end
      item
        Command = ecInsertLine
        ShortCut = 24649
      end
      item
        Command = ecDeleteWord
        ShortCut = 24661
      end
      item
        Command = ecBlockUnindent
        ShortCut = 16461
      end
      item
        Command = ecPaste
        ShortCut = 16462
      end
      item
        Command = ecCut
        ShortCut = 16468
      end>
  end
end
