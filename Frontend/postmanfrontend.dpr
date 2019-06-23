program postmanfrontend;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMain in 'fMain.pas' {Form1},
  dmGetRequest in 'dmGetRequest.pas' {GetRequestDataModule: TDataModule},
  dmPostRequest in 'dmPostRequest.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
