program m3testoque;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, dbflaz, sdflaz, printer4lazarus, menu, cadastro, relatorio, sobre
  { you can add units after this };

{$R *.res}

begin
  Application.Title:='M3T - Estoque';
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TFormMenu, FormMenu);
  Application.CreateForm(TFormRelatorio, FormRelatorio);
  Application.CreateForm(TFormSobre, FormSobre);
  Application.Run;
end.

