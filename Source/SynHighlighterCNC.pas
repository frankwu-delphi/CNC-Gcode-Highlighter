{****************************************************************}
{************** CNC G-Code Highlighter For SynEdit **************}
{*********************Create Date: 2020.06.01********************}
{****************************************************************}
//Author: Frank.Wu
//Version: 1.5
//E-mail: 6503597@qq.com
//GitHub: https://github.com/frankwu-delphi/CNC-Gcode-Highlighter
//SynEdit: https://github.com/SynEdit/SynEdit

unit SynHighlighterCNC;

{$I SynEdit.inc}

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,

  //SynEdit Units
  SynEditTypes,
  SynEditHighlighter,
  SynUnicode
  ;

type
  TtkTokenKind = (
  tkComment, //comment with( )
  tkString,  //string text
  tkReserved,//Reserved text
  tkNull,    //null text
  tkNumber,  //number text
  tkSpace,   //space
  tkSymbol,  //symbol

  tkAcode,   //A axis of machine
  tkBcode,   //B axis of machine
  tkCcode,   //C axis of machine
  tkDcode,   //Tool radius compensation number
  tkFcode,   //Feed rate
  tkGcode,   //General function
  tkHcode,   //Tool length offset index
  tkIcode,   //X offset for arcs and G87 canned cycles
  tkJcode,   //Y offset for arcs and G87 canned cycles
  tkKcode,   //Z offset for arcs and G87 canned cycles.
             //Spindle-Motion Ratio for G33 synchronized movements.
  tkLcode,   //generic parameter word for G10, M66 and others
  tkMcode,   //Miscellaneous function
  tkNcode,   //Line number
  tkOcode,   //provide for flow control in NC programs
  tkPcode,   //Dwell time in canned cycles and with G4.
             //Key used with G10.
  tkQcode,   //Feed increment in G73, G83 canned cycles
  tkRcode,   //Arc radius or canned cycle plane
  tkScode,   //Spindle speed
  tkTcode,   //Tool selection
  tkUcode,   //U axis of machine
  tkVcode,   //V axis of machine
  tkWcode,   //W axis of machine
  tkXcode,   //X axis of machine
  tkYcode,   //Y axis of machine
  tkZcode,   //Z axis of machine

  tkNormal   //Normal text
  );

  TRangeState = (rsNormal, rsComment);

type
  TSynCNCSyn = class(TSynCustomHighlighter)
  private
    FRange: TRangeState;
    FTokenID: TtkTokenKind;

    FCommentAttri: TSynHighlighterAttributes;
    FStringAttri: TSynHighlighterAttributes;
    FReservedAttri: TSynHighlighterAttributes;
    FNormalAttri: TSynHighlighterAttributes;
    FNumberAttri: TSynHighlighterAttributes;
    FSpaceAttri: TSynHighlighterAttributes;
    FSymbolAttri: TSynHighlighterAttributes;

    FAcodeAttri: TSynHighlighterAttributes;
    FBcodeAttri: TSynHighlighterAttributes;
    FCcodeAttri: TSynHighlighterAttributes;
    FDcodeAttri: TSynHighlighterAttributes;
    FFcodeAttri: TSynHighlighterAttributes;
    FGcodeAttri: TSynHighlighterAttributes;
    FHcodeAttri: TSynHighlighterAttributes;
    FIcodeAttri: TSynHighlighterAttributes;
    FJcodeAttri: TSynHighlighterAttributes;
    FKcodeAttri: TSynHighlighterAttributes;
    FLcodeAttri: TSynHighlighterAttributes;
    FMcodeAttri: TSynHighlighterAttributes;
    FNcodeAttri: TSynHighlighterAttributes;
    FOcodeAttri: TSynHighlighterAttributes;
    FPcodeAttri: TSynHighlighterAttributes;
    FQcodeAttri: TSynHighlighterAttributes;
    FRcodeAttri: TSynHighlighterAttributes;
    FScodeAttri: TSynHighlighterAttributes;
    FTcodeAttri: TSynHighlighterAttributes;
    FUcodeAttri: TSynHighlighterAttributes;
    FVcodeAttri: TSynHighlighterAttributes;
    FWcodeAttri: TSynHighlighterAttributes;
    FXcodeAttri: TSynHighlighterAttributes;
    FYcodeAttri: TSynHighlighterAttributes;
    FZcodeAttri: TSynHighlighterAttributes;

    procedure NormalProc;
    procedure NullProc;
    procedure SpaceProc;
    procedure CRProc;
    procedure LFProc;
    procedure CommentOpenProc;
    procedure CommentProc;
    procedure ReservedWordProc;
    procedure NumberProc;

    procedure ACodeProc;
    procedure BCodeProc;
    procedure CCodeProc;
    procedure DCodeProc;
    procedure FCodeProc;
    procedure GCodeProc;
    procedure HCodeProc;
    procedure ICodeProc;
    procedure JCodeProc;
    procedure KCodeProc;
    procedure LCodeProc;
    procedure MCodeProc;
    procedure NCodeProc;
    procedure OCodeProc;
    procedure PCodeProc;
    procedure QCodeProc;
    procedure RCodeProc;
    procedure SCodeProc;
    procedure TCodeProc;
    procedure UCodeProc;
    procedure VCodeProc;
    procedure WCodeProc;
    procedure XCodeProc;
    procedure YCodeProc;
    procedure ZCodeProc;
  protected
    function GetSampleSource: UnicodeString; override;
    function IsFilterStored: Boolean; override;
  public
    constructor Create(AOwner: TComponent); override;
    class function GetFriendlyLanguageName: UnicodeString; override;
    class function GetLanguageName: string; override;
    function GetRange: Pointer; override;
    procedure ResetRange; override;
    procedure SetRange(Value: Pointer); override;
    function GetDefaultAttribute(Index: Integer): TSynHighlighterAttributes; override;
    function GetEol: Boolean; override;
    function GetTokenID: TtkTokenKind;
    function GetTokenAttribute: TSynHighlighterAttributes; override;
    function GetTokenKind: Integer; override;
    function IsIdentChar(AChar: WideChar): Boolean; override;
    procedure Next; override;
  published
   property CommentAttri: TSynHighlighterAttributes read FCommentAttri write FCommentAttri;
   property StringAttri: TSynHighlighterAttributes read FStringAttri write FStringAttri;
   property ReservedAttri: TSynHighlighterAttributes read FReservedAttri write FReservedAttri;
   property NormalAttri: TSynHighlighterAttributes read FNormalAttri write FNormalAttri;
   property NumberAttri: TSynHighlighterAttributes read FNumberAttri write FNumberAttri;
   property SpaceAttri: TSynHighlighterAttributes read FSpaceAttri write FSpaceAttri;
   property SymbolAttri: TSynHighlighterAttributes read FSymbolAttri write FSymbolAttri;

   property AcodeAttri: TSynHighlighterAttributes read FAcodeAttri write FAcodeAttri;
   property BcodeAttri: TSynHighlighterAttributes read FBcodeAttri write FBcodeAttri;
   property CcodeAttri: TSynHighlighterAttributes read FCcodeAttri write FCcodeAttri;
   property DcodeAttri: TSynHighlighterAttributes read FDcodeAttri write FDcodeAttri;
   property FcodeAttri: TSynHighlighterAttributes read FFcodeAttri write FFcodeAttri;
   property GcodeAttri: TSynHighlighterAttributes read FGcodeAttri write FGcodeAttri;
   property HcodeAttri: TSynHighlighterAttributes read FHcodeAttri write FHcodeAttri;
   property IcodeAttri: TSynHighlighterAttributes read FIcodeAttri write FIcodeAttri;
   property JcodeAttri: TSynHighlighterAttributes read FJcodeAttri write FJcodeAttri;
   property KcodeAttri: TSynHighlighterAttributes read FKcodeAttri write FKcodeAttri;
   property LcodeAttri: TSynHighlighterAttributes read FLcodeAttri write FLcodeAttri;
   property McodeAttri: TSynHighlighterAttributes read FMcodeAttri write FMcodeAttri;
   property NcodeAttri: TSynHighlighterAttributes read FNcodeAttri write FNcodeAttri;
   property OcodeAttri: TSynHighlighterAttributes read FOcodeAttri write FOcodeAttri;
   property PcodeAttri: TSynHighlighterAttributes read FPcodeAttri write FPcodeAttri;
   property QcodeAttri: TSynHighlighterAttributes read FQcodeAttri write FQcodeAttri;
   property RcodeAttri: TSynHighlighterAttributes read FRcodeAttri write FRcodeAttri;
   property ScodeAttri: TSynHighlighterAttributes read FScodeAttri write FScodeAttri;
   property TcodeAttri: TSynHighlighterAttributes read FTcodeAttri write FTcodeAttri;
   property UcodeAttri: TSynHighlighterAttributes read FUcodeAttri write FUcodeAttri;
   property VcodeAttri: TSynHighlighterAttributes read FVcodeAttri write FVcodeAttri;
   property WcodeAttri: TSynHighlighterAttributes read FWcodeAttri write FWcodeAttri;
   property XcodeAttri: TSynHighlighterAttributes read FXcodeAttri write FXcodeAttri;
   property YcodeAttri: TSynHighlighterAttributes read FYcodeAttri write FYcodeAttri;
   property ZcodeAttri: TSynHighlighterAttributes read FZcodeAttri write FZcodeAttri;

  end;

implementation

uses
  SynEditStrConst;

resourcestring
  SYNS_FilterCNC = 'CNC Files (*.nc)|*.nc';
  SYNS_LangCNC = 'CNC';
  SYNS_FriendlyLangCNC = 'CNC G-Code';



procedure TSynCNCSyn.SpaceProc;
begin
  inc(Run);
  FTokenID := tkSpace;
  while (FLine[Run] <= #32) and not IsLineEnd(Run) do
    inc(Run);
end;

procedure TSynCNCSyn.NullProc;
begin
  FTokenID := tkNull;
  inc(Run);
end;

procedure TSynCNCSyn.CRProc;
begin
  FTokenID := tkSpace;
  inc(Run);
  if FLine[Run] = #10 then
    inc(Run);
end;

procedure TSynCNCSyn.LFProc;
begin
  FTokenID := tkSpace;
  inc(Run);
end;

procedure TSynCNCSyn.CommentOpenProc;
begin
  inc(Run);
  FRange := rsComment;
  FTokenID := tkComment;
end;

procedure TSynCNCSyn.CommentProc;
begin
  case FLine[Run] of
    #0: NullProc;
    #10: LFProc;
    #13: CRProc;
  else
    begin
      FTokenID := tkComment;
      repeat
        if (FLine[Run] = ')') then
        begin
          inc(Run, 1);
          FRange := rsNormal;
          Break;
        end;
        if not IsLineEnd(Run) then
          inc(Run);
      until IsLineEnd(Run);
    end;
  end;
end;

procedure TSynCNCSyn.ReservedWordProc;
begin
  FTokenID := tkNormal;
  case FLine[Run] of
    '%':
      begin
        FTokenID := tkReserved;
        inc(Run, 1);
      end
  else
    SpaceProc;
  end;
end;

procedure TSynCNCSyn.NumberProc;

  function ExpectDigit: Boolean;
  begin
    Result := CharInSet(FLine[Run], ['0' .. '9']);
    while CharInSet(FLine[Run], ['0' .. '9']) do
      inc(Run);
  end;

begin
  FTokenID := tkNumber;

  if FLine[Run] = '-' then
    inc(Run);

  // at least any digit must appear here
  if not ExpectDigit then
  begin
    FTokenID := tkNormal;
    while (FLine[Run] <> #32) and not IsLineEnd(Run) do
      inc(Run);
    Exit;
  end;

  // check for dot
  if FLine[Run] = '.' then
  begin
    // advance
    inc(Run);

    // at least any digit must appear after a dot!
    if not ExpectDigit then
    begin
      FTokenID := tkNormal;
      while (FLine[Run] <> #32) and not IsLineEnd(Run) do
        inc(Run);
      Exit;
    end;
  end;

  // check for an exponent
  if CharInSet(FLine[Run], ['e', 'E']) then
  begin
    inc(Run);

    // allow +/- here
    if CharInSet(FLine[Run], ['+', '-']) then
      inc(Run);

    // at least any digit must appear here
    if not ExpectDigit then
    begin
      FTokenID := tkNormal;
      while (FLine[Run] <> #32) and not IsLineEnd(Run) do
        inc(Run);
      Exit;
    end;
  end;
end;

constructor TSynCNCSyn.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FCaseSensitive := False;

  // comment
  FCommentAttri := TSynHighlighterAttributes.Create(SYNS_AttrComment,
    SYNS_FriendlyAttrComment);
  FCommentAttri.Style := [fsItalic];
  FCommentAttri.Foreground := $00FF8800;
  AddAttribute(FCommentAttri);

  // string
  FStringAttri := TSynHighlighterAttributes.Create(SYNS_AttrString,
    SYNS_FriendlyAttrString);
  FStringAttri.Foreground := clRed;
  AddAttribute(FStringAttri);

  // Normal
  FNormalAttri := TSynHighlighterAttributes.Create(SYNS_AttrAttribute,
    SYNS_FriendlyAttrAttribute);
  FNormalAttri.Foreground := $00CCCCCC;
  AddAttribute(FNormalAttri);

  // reserved words ("%")
  FReservedAttri := TSynHighlighterAttributes.Create(SYNS_AttrReservedWord,
    SYNS_FriendlyAttrReservedWord);
  FReservedAttri.Style := [fsBold];
  FReservedAttri.Foreground := $004A9AFF;
  AddAttribute(FReservedAttri);

  // numbers
  FNumberAttri := TSynHighlighterAttributes.Create(SYNS_AttrNumber,
    SYNS_FriendlyAttrNumber);
  FNumberAttri.Foreground := $008C62FF;
  AddAttribute(FNumberAttri);

  // spaces
  FSpaceAttri := TSynHighlighterAttributes.Create(SYNS_AttrSpace,
    SYNS_FriendlyAttrSpace);
  AddAttribute(FSpaceAttri);

  // symbols
  FSymbolAttri := TSynHighlighterAttributes.Create(SYNS_AttrSymbol,
    SYNS_FriendlyAttrSymbol);
  FSymbolAttri.Foreground := clGreen;
  AddAttribute(FSymbolAttri);

  // A-Code
  FAcodeAttri := TSynHighlighterAttributes.Create('CNC A', 'CNC A-Code');
  FAcodeAttri.Foreground := $002D902C;
  AddAttribute(FAcodeAttri);

  // B-Code
  FBcodeAttri := TSynHighlighterAttributes.Create('CNC B', 'CNC B-Code');
  FBcodeAttri.Foreground := $002D902C;
  AddAttribute(FBcodeAttri);

  // C-Code
  FCcodeAttri := TSynHighlighterAttributes.Create('CNC C', 'CNC C-Code');
  FCcodeAttri.Foreground := $002D902C;
  AddAttribute(FCcodeAttri);

  // D-Code
  FDcodeAttri := TSynHighlighterAttributes.Create('CNC D', 'CNC D-Code');
  FDcodeAttri.Foreground := $002D902C;
  AddAttribute(FDcodeAttri);

  // F-Code
  FFcodeAttri := TSynHighlighterAttributes.Create('CNC F', 'CNC F-Code');
  FFcodeAttri.Foreground := $00CC9852;
  AddAttribute(FFcodeAttri);

  // G-Code
  FGcodeAttri := TSynHighlighterAttributes.Create('CNC G', 'CNC G-Code');
  FGcodeAttri.Foreground := $00BBFF80;
  AddAttribute(FGcodeAttri);

  // H-Code
  FHcodeAttri := TSynHighlighterAttributes.Create('CNC H', 'CNC H-Code');
  FHcodeAttri.Foreground := $003ACFAE;
  AddAttribute(FHcodeAttri);

  // I-Code
  FIcodeAttri := TSynHighlighterAttributes.Create('CNC I', 'CNC I-Code');
  FIcodeAttri.Foreground := $0093E7FF;
  AddAttribute(FIcodeAttri);

  // J-Code
  FJcodeAttri := TSynHighlighterAttributes.Create('CNC J', 'CNC J-Code');
  FJcodeAttri.Foreground := $0093E7FF;
  AddAttribute(FJcodeAttri);

  // K-Code
  FKcodeAttri := TSynHighlighterAttributes.Create('CNC K', 'CNC K-Code');
  FKcodeAttri.Foreground := $0093E7FF;
  AddAttribute(FKcodeAttri);

  // L-Code
  FLcodeAttri := TSynHighlighterAttributes.Create('CNC L', 'CNC L-Code');
  FLcodeAttri.Foreground := $00C7A78A;
  AddAttribute(FLcodeAttri);

  // M-Code
  FMcodeAttri := TSynHighlighterAttributes.Create('CNC M', 'CNC M-Code');
  FMcodeAttri.Foreground := $006070EB;
  AddAttribute(FMcodeAttri);

  // N-Code
  FNcodeAttri := TSynHighlighterAttributes.Create('CNC N', 'CNC N-Code');
  FNcodeAttri.Foreground := $009F907F;
  FNcodeAttri.Style := [fsItalic];
  AddAttribute(FNcodeAttri);

  // O-Code
  FOcodeAttri := TSynHighlighterAttributes.Create('CNC O', 'CNC O-Code');
  FOcodeAttri.Foreground := $0000AFFF;
  AddAttribute(FOcodeAttri);

  // P-Code
  FPcodeAttri := TSynHighlighterAttributes.Create('CNC P', 'CNC P-Code');
  FPcodeAttri.Foreground := $00CCCCCC;
  AddAttribute(FPcodeAttri);

  // Q-Code
  FQcodeAttri := TSynHighlighterAttributes.Create('CNC Q', 'CNC Q-Code');
  FQcodeAttri.Foreground := $00CCCCCC;
  AddAttribute(FQcodeAttri);

  // R-Code
  FRcodeAttri := TSynHighlighterAttributes.Create('CNC R', 'CNC R-Code');
  FRcodeAttri.Foreground := $00FFFFFF;
  AddAttribute(FRcodeAttri);

  // S-Code
  FScodeAttri := TSynHighlighterAttributes.Create('CNC S', 'CNC S-Code');
  FScodeAttri.Foreground := $00CCCCCC;
  AddAttribute(FScodeAttri);

  // T-Code
  FTcodeAttri := TSynHighlighterAttributes.Create('CNC T', 'CNC T-Code');
  FTcodeAttri.Foreground := $00FFFFFF;
  AddAttribute(FTcodeAttri);

  // U-Code
  FUcodeAttri := TSynHighlighterAttributes.Create('CNC U', 'CNC U-Code');
  FUcodeAttri.Foreground := $00FFAFC1;
  FUcodeAttri.Style := [fsBold];
  AddAttribute(FUcodeAttri);

  // V-Code
  FVcodeAttri := TSynHighlighterAttributes.Create('CNC V', 'CNC V-Code');
  FVcodeAttri.Foreground := $00FFAFC1;
  FVcodeAttri.Style := [fsBold];
  AddAttribute(FVcodeAttri);

  // W-Code
  FWcodeAttri := TSynHighlighterAttributes.Create('CNC W', 'CNC W-Code');
  FWcodeAttri.Foreground := $00FFAFC1;
  FWcodeAttri.Style := [fsBold];
  AddAttribute(FWcodeAttri);

  // X-Code
  FXcodeAttri := TSynHighlighterAttributes.Create('CNC X', 'CNC X-Code');
  FXcodeAttri.Foreground := $00FFAFC1;
  FXcodeAttri.Style := [fsBold];
  AddAttribute(FXcodeAttri);

  // Y-Code
  FYcodeAttri := TSynHighlighterAttributes.Create('CNC Y', 'CNC Y-Code');
  FYcodeAttri.Foreground := $00FFAFC1;
  FYcodeAttri.Style := [fsBold];
  AddAttribute(FYcodeAttri);

  // Z-Code
  FZcodeAttri := TSynHighlighterAttributes.Create('CNC Z', 'CNC Z-Code');
  FZcodeAttri.Foreground := $00FFAFC1;
  FZcodeAttri.Style := [fsBold];
  AddAttribute(FZcodeAttri);

  SetAttributesOnChange(DefHighlightChange);

  FDefaultFilter := SYNS_FilterCNC;
  FRange := rsNormal;
end;

procedure TSynCNCSyn.NormalProc;
begin
  inc(Run);
  FTokenID := tkNormal;
end;

procedure TSynCNCSyn.ACodeProc;
begin
  FTokenID := tkNormal;
  case FLine[Run] of
    'a':
      begin
        FTokenID := tkAcode;
        inc(Run, 1);
      end
  else
    SpaceProc;
  end;
end;

procedure TSynCNCSyn.BCodeProc;
begin
  FTokenID := tkNormal;
  case FLine[Run] of
    'b':
      begin
        FTokenID := tkBcode;
        inc(Run, 1);
      end
  else
    SpaceProc;
  end;
end;

procedure TSynCNCSyn.CCodeProc;
begin
  FTokenID := tkNormal;
  case FLine[Run] of
    'c':
      begin
        FTokenID := tkCcode;
        inc(Run, 1);
      end
  else
    SpaceProc;
  end;
end;

procedure TSynCNCSyn.DCodeProc;
begin
  FTokenID := tkNormal;
  case FLine[Run] of
    'd':
      begin
        FTokenID := tkDcode;
        inc(Run, 1);
      end
  else
    SpaceProc;
  end;
end;

procedure TSynCNCSyn.FCodeProc;
begin
  FTokenID := tkNormal;
  case FLine[Run] of
    'f':
      begin
        while (FLine[Run + 1] in ['0'..'9','.']) and not IsLineEnd(Run) do
        inc(Run);

        FTokenID := tkFcode;
        inc(Run, 1);
      end
  else
    SpaceProc;
  end;
end;

procedure TSynCNCSyn.GCodeProc;
var
  i: Integer;
begin
  FTokenID := tkNormal;
  case FLine[Run] of
    'g':
      begin
        while (FLine[Run + 1] in ['0'..'9']) and not IsLineEnd(Run) do
        inc(Run);

        FTokenID := tkGcode;
        inc(Run, 1);
      end
  else
    SpaceProc;
  end;
end;

procedure TSynCNCSyn.HCodeProc;
begin
  FTokenID := tkNormal;
  case FLine[Run] of
    'h':
      begin
        FTokenID := tkHcode;
        inc(Run, 1);
      end
  else
    SpaceProc;
  end;
end;

procedure TSynCNCSyn.ICodeProc;
begin
  FTokenID := tkNormal;
  case FLine[Run] of
    'i':
      begin
        FTokenID := tkIcode;
        inc(Run, 1);
      end
  else
    SpaceProc;
  end;
end;

procedure TSynCNCSyn.JCodeProc;
begin
  FTokenID := tkNormal;
  case FLine[Run] of
    'j':
      begin
        FTokenID := tkJcode;
        inc(Run, 1);
      end
  else
    SpaceProc;
  end;
end;

procedure TSynCNCSyn.KCodeProc;
begin
  FTokenID := tkNormal;
  case FLine[Run] of
    'k':
      begin
        FTokenID := tkKcode;
        inc(Run, 1);
      end
  else
    SpaceProc;
  end;
end;

procedure TSynCNCSyn.LCodeProc;
begin
  FTokenID := tkNormal;
  case FLine[Run] of
    'l':
      begin
        FTokenID := tkLcode;
        inc(Run, 1);
      end
  else
    SpaceProc;
  end;
end;

procedure TSynCNCSyn.MCodeProc;
begin
  FTokenID := tkNormal;
  case FLine[Run] of
    'm':
      begin
        while (FLine[Run + 1] in ['0'..'9']) and not IsLineEnd(Run) do
        inc(Run);

        FTokenID := tkMcode;
        inc(Run, 1);
      end
  else
    SpaceProc;
  end;
end;

procedure TSynCNCSyn.NCodeProc;
begin
  FTokenID := tkNormal;
  case FLine[Run] of
    'n':
      begin
        while (FLine[Run + 1] in ['0'..'9']) and not IsLineEnd(Run) do
        inc(Run);

        FTokenID := tkNcode;
        inc(Run, 1);
      end
  else
    SpaceProc;
  end;
end;

procedure TSynCNCSyn.OCodeProc;
begin
  FTokenID := tkNormal;
  case FLine[Run] of
    'o':
      begin
        while (FLine[Run + 1] in ['0'..'9']) and not IsLineEnd(Run) do
        inc(Run);

        FTokenID := tkOcode;
        inc(Run, 1);
      end
  else
    SpaceProc;
  end;
end;


procedure TSynCNCSyn.PCodeProc;
begin
  FTokenID := tkNormal;
  case FLine[Run] of
    'p':
      begin
        FTokenID := tkPcode;
        inc(Run, 1);
      end
  else
    SpaceProc;
  end;
end;

procedure TSynCNCSyn.QCodeProc;
begin
  FTokenID := tkNormal;
  case FLine[Run] of
    'q':
      begin
        FTokenID := tkQcode;
        inc(Run, 1);
      end
  else
    SpaceProc;
  end;
end;

procedure TSynCNCSyn.RCodeProc;
begin
  FTokenID := tkNormal;
  case FLine[Run] of
    'r':
      begin
        while (FLine[Run + 1] in ['0'..'9','.']) and not IsLineEnd(Run) do
        inc(Run);

        FTokenID := tkRcode;
        inc(Run, 1);
      end
  else
    SpaceProc;
  end;
end;

procedure TSynCNCSyn.SCodeProc;
begin
  FTokenID := tkNormal;
  case FLine[Run] of
    's':
      begin
        while (FLine[Run + 1] in ['0'..'9']) and not IsLineEnd(Run) do
        inc(Run);

        FTokenID := tkScode;
        inc(Run, 1);
      end
  else
    SpaceProc;
  end;
end;

procedure TSynCNCSyn.TCodeProc;
begin
  FTokenID := tkNormal;
  case FLine[Run] of
    't':
      begin
        while (FLine[Run + 1] in ['0'..'9']) and not IsLineEnd(Run) do
        inc(Run);

        FTokenID := tkTcode;
        inc(Run, 1);
      end
  else
    SpaceProc;
  end;
end;

procedure TSynCNCSyn.UCodeProc;
begin
  FTokenID := tkNormal;
  case FLine[Run] of
    'u':
      begin
        FTokenID := tkUcode;
        inc(Run, 1);
      end
  else
    SpaceProc;
  end;
end;

procedure TSynCNCSyn.VCodeProc;
begin
  FTokenID := tkNormal;
  case FLine[Run] of
    'v':
      begin
        FTokenID := tkVcode;
        inc(Run, 1);
      end
  else
    SpaceProc;
  end;
end;

procedure TSynCNCSyn.WCodeProc;
begin
  FTokenID := tkNormal;
  case FLine[Run] of
    'w':
      begin
        FTokenID := tkWcode;
        inc(Run, 1);
      end
  else
    SpaceProc;
  end;
end;

procedure TSynCNCSyn.XCodeProc;
begin
  FTokenID := tkNormal;
  case FLine[Run] of
    'x':
      begin
        FTokenID := tkXcode;
        inc(Run, 1);
      end
  else
    SpaceProc;
  end;
end;

procedure TSynCNCSyn.YCodeProc;
begin
  FTokenID := tkNormal;
  case FLine[Run] of
    'y':
      begin
        FTokenID := tkYcode;
        inc(Run, 1);
      end
  else
    SpaceProc;
  end;
end;

procedure TSynCNCSyn.ZCodeProc;
begin
  FTokenID := tkNormal;
  case FLine[Run] of
    'z':
      begin
        FTokenID := tkZcode;
        inc(Run, 1);
      end
  else
    SpaceProc;
  end;
end;

procedure TSynCNCSyn.Next;
begin
  fTokenPos := Run;
  case FRange of
    rsComment: CommentProc;
  else
    case FLine[Run] of
      #0: NullProc;
      #10: LFProc;
      #13: CRProc;
      '(': CommentOpenProc;
      #1 .. #9, #11, #12, #14 .. #32: SpaceProc;
      '0' .. '9': NumberProc;
      '%': ReservedWordProc;

      'a': ACodeProc;
      'b': BCodeProc;
      'c': CCodeProc;
      'd': DCodeProc;
      'f': FCodeProc;
      'g': GCodeProc;
      'h': HCodeProc;
      'i': ICodeProc;
      'j': JCodeProc;
      'k': KCodeProc;
      'l': LCodeProc;
      'm': MCodeProc;
      'n': NCodeProc;
      'o': OCodeProc;
      'p': PCodeProc;
      'q': QCodeProc;
      'r': RCodeProc;
      's': SCodeProc;
      't': TCodeProc;
      'u': UCodeProc;
      'v': VCodeProc;
      'w': WCodeProc;
      'x': XCodeProc;
      'y': YCodeProc;
      'z': ZCodeProc;
    else
      NormalProc;
    end;
  end;
  inherited;
end;

function TSynCNCSyn.GetDefaultAttribute(Index: Integer)
  : TSynHighlighterAttributes;
begin
  case Index of
    SYN_ATTR_COMMENT: Result := FCommentAttri;
    SYN_ATTR_STRING: Result := FStringAttri;
    SYN_ATTR_WHITESPACE: Result := FSpaceAttri;
  else
    Result := nil;
  end;
end;

function TSynCNCSyn.GetEol: Boolean;
begin
  Result := Run = FLineLen + 1;
end;

function TSynCNCSyn.GetTokenID: TtkTokenKind;
begin
  Result := FTokenID;
end;

function TSynCNCSyn.GetTokenAttribute: TSynHighlighterAttributes;
begin
  case GetTokenID of
    tkComment: Result := FCommentAttri;
    tkString: Result := FStringAttri;
    tkNormal: Result := FNormalAttri;
    tkReserved: Result := FReservedAttri;
    tkNumber: Result := FNumberAttri;
    tkSpace: Result := FSpaceAttri;
    tkSymbol: Result := FSymbolAttri;

    tkAcode: Result := FAcodeAttri;
    tkBcode: Result := FBcodeAttri;
    tkCcode: Result := FCcodeAttri;
    tkDcode: Result := FDcodeAttri;
    tkFcode: Result := FFcodeAttri;
    tkGcode: Result := FGcodeAttri;
    tkHcode: Result := FHcodeAttri;
    tkIcode: Result := FIcodeAttri;
    tkJcode: Result := FJcodeAttri;
    tkKcode: Result := FKcodeAttri;
    tkLcode: Result := FLcodeAttri;
    tkMcode: Result := FMcodeAttri;
    tkNcode: Result := FNcodeAttri;
    tkOcode: Result := FOcodeAttri;
    tkPcode: Result := FPcodeAttri;
    tkQcode: Result := FQcodeAttri;
    tkRcode: Result := FRcodeAttri;
    tkScode: Result := FScodeAttri;
    tkTcode: Result := FTcodeAttri;
    tkUcode: Result := FUcodeAttri;
    tkVcode: Result := FVcodeAttri;
    tkWcode: Result := FWcodeAttri;
    tkXcode: Result := FXcodeAttri;
    tkYcode: Result := FYcodeAttri;
    tkZcode: Result := FZcodeAttri;
  else
    Result := nil;
  end;
end;

function TSynCNCSyn.GetTokenKind: Integer;
begin
  Result := Ord(FTokenID);
end;

function TSynCNCSyn.IsIdentChar(AChar: WideChar): Boolean;
begin
  case AChar of
    '-', '.', '+', '0' .. '9', 'a' .. 'z', 'A' .. 'Z':
      Result := True;
  else
    Result := False;
  end;
end;

function TSynCNCSyn.GetSampleSource: UnicodeString;
begin
  Result := '%                                           '+#13+
            '(0001 part1)                                '+#13+
            'N100 (FRANK.WU. CNC G-Code Test)            '+#13+
            'N102 (REV-0.70)                             '+#13+
            'N104 (JUN- 8-2020-11:30:12AM)               '+#13+
            '                                            '+#13+
            'N106 (TOOL 1 - DIA 2.)                      '+#13+
            '                                            '+#13+
            'N1 G90 G17 G40 G80 G00                      '+#13+
            'N108 M06 T1 ()                              '+#13+
            'N110 (2DE-轮廓)                             '+#13+
            'N112 G00 G54 G90 X-30.9498 Y9.2005 S3500 M03'+#13+
            'N114 G43 H1 Z50.                            '+#13+
            'N116 S4000                                  '+#13+
            'N118 Z25.                                   '+#13+
            'N120 Z2.                                    '+#13+
            'N122 G01 Z-1.5 F120.                        '+#13+
            'N124 X25.3927 Y-13.2166 F200.               '+#13+
            'N126 G00 Z25.                               '+#13+
            'N128 X-30.9498 Y9.2005                      '+#13+
            'N130 Z2.                                    '+#13+
            'N132 G01 Z-1.5 F120.                        '+#13+
            'N134 X25.3927 Y-13.2166 F200.               '+#13+
            'N136 G00 Z25.                               '+#13+
            'N138 M05                                    '+#13+
            'N140 G00 G28 G91 Z0                         '+#13+
            'N142 G00 G28 G91 X-15.0 Y0.                 '+#13+
            'N144 G90                                    '+#13+
            'N146 M06 T1                                 '+#13+
            'N148 M30                                    '+#13+
            '%'
;
end;

function TSynCNCSyn.IsFilterStored: Boolean;
begin
  Result := fDefaultFilter <> SYNS_FilterCNC;
end;

class function TSynCNCSyn.GetFriendlyLanguageName: UnicodeString;
begin
  Result := SYNS_FriendlyLangCNC;
end;

class function TSynCNCSyn.GetLanguageName: string;
begin
  Result := SYNS_LangCNC;
end;

procedure TSynCNCSyn.ResetRange;
begin
  FRange := rsNormal;
end;

procedure TSynCNCSyn.SetRange(Value: Pointer);
begin
  FRange := TRangeState(Value);
end;

function TSynCNCSyn.GetRange: Pointer;
begin
  Result := Pointer(FRange);
end;

initialization

{$IFNDEF SYN_CPPB_1}
  RegisterPlaceableHighlighter(TSynCNCSyn);
{$ENDIF}

end.
