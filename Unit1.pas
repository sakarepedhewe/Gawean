{
=============================================>>>>>>
https://yadishare.wordpress.com/2016/09/18/menyembunyikan-form-di-system-tray-dengan-delphi-xe/comment-page-1/#comment-653
=============================================>>>>>>
 }
unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ImgList, Vcl.ExtCtrls;

type
  TMAIN_FRM = class(TForm)
    TrayIcon1: TTrayIcon;
    Timer1: TTimer;
    ImageList1: TImageList;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TrayIcon1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MAIN_FRM: TMAIN_FRM;
  FRMStatus: Integer;

implementation

{$R *.dfm}

procedure TMAIN_FRM.Button1Click(Sender: TObject);
begin
  self.WindowState:=wsminimized;
end;

procedure TMAIN_FRM.Button2Click(Sender: TObject);
begin
  Application.terminate;
end;

procedure TMAIN_FRM.FormCreate(Sender: TObject);
var
MyIcon : TIcon;

begin
//Application.OnMinimize:=OnMinimize;
TrayIcon1.Icons := TImageList.Create(Self);
MyIcon := TIcon.Create;
MyIcon.LoadFromFile('mail.ico');
TrayIcon1.Icon.Assign(MyIcon);
TrayIcon1.Icons.AddIcon(MyIcon);
FRMStatus:=1;
end;

procedure TMAIN_FRM.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then application.Terminate;
end;

procedure TMAIN_FRM.FormResize(Sender: TObject);
begin
  if MAIN_FRM.windowstate = wsMinimized then
begin
  MAIN_FRM.Hide();
  TrayIcon1.Visible := True;
  TrayIcon1.BalloonHint := 'Your apps - Now hidding in system tray !';
  TrayIcon1.BalloonFlags := bfInfo;
  TrayIcon1.ShowBalloonHint;
  FRMStatus:=2;
end;
end;

procedure TMAIN_FRM.FormShow(Sender: TObject);
begin
  if FRMStatus = 1 then
    begin
      Timer1.Enabled:=True;
    end;
end;

procedure TMAIN_FRM.Timer1Timer(Sender: TObject);
begin
  MAIN_FRM.WindowState:=wsMinimized;
  Timer1.Enabled:=False;
end;

procedure TMAIN_FRM.TrayIcon1Click(Sender: TObject);
begin
  TrayIcon1.Visible := False;
  Show();
  WindowState := wsNormal;
  Application.BringToFront();
  FRMStatus:=1;
end;

end.
