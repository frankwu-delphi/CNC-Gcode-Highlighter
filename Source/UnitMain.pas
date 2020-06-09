unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  SynEdit, SynEditHighlighter, SynHighlighterAsm, SynHighlighterJSON,
  Vcl.StdCtrls, SynMemo;

type
  TForm1 = class(TForm)
    SynEdit1: TSynEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateTheme(const AThemeName: string);
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

uses
  Vcl.Themes,

  SynHighlighterCNC;

procedure TForm1.FormCreate(Sender: TObject);
var
  CNC: TSynCNCSyn;
begin
  TStyleManager.Engine.RegisterStyleHook(TCustomSynEdit, TMemoStyleHook);
  CNC := TSynCNCSyn.Create(Self);
  SynEdit1.Highlighter := CNC;

  UpdateTheme('');

  SynEdit1.Text := CNC.SampleSource;
end;

procedure TForm1.UpdateTheme(const AThemeName: string);
begin
  // TStyleManager.SetStyle(AThemeName);
//   SynEdit1.Color := $00402200;
  SynEdit1.Color := StyleServices.GetSystemColor(clwindow);
  SynEdit1.Gutter.Color := StyleServices.GetSystemColor(clscrollbar);
  SynEdit1.Gutter.BorderColor := StyleServices.GetSystemColor(clActiveBorder);
  SynEdit1.Gutter.Font.Color := StyleServices.GetSystemColor(clInfoText);
  SynEdit1.SelectedColor.Background := StyleServices.GetSystemColor(clhighlight);
end;

end.
