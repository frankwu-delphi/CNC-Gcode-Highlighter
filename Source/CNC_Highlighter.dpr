program CNC_Highlighter;

uses
  Vcl.Forms,
  UnitMain in 'UnitMain.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Calypso');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
