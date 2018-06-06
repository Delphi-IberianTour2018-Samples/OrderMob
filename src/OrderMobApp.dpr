program OrderMobApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  OrderMob.MainForm in 'OrderMob.MainForm.pas' {MainForm},
  OrderMob.Tools in 'OrderMob.Tools.pas',
  OrderMob.AppData in 'OrderMob.AppData.pas' {AppData: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Logger.Debug('Starting Application');
  Application.CreateForm(TAppData, AppData);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
