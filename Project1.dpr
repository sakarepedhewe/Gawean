program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {MAIN_FRM};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMAIN_FRM, MAIN_FRM);
  Application.Run;
end.
