unit menu;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, IDEWindowIntf, Forms, Controls, Graphics,
  Dialogs, Calendar, EditBtn, Spin, XMLPropStorage, ExtCtrls, StdCtrls, Menus,
  cadastro, relatorio, sobre, odbcconn, sqldb;

type

  { TFormMenu }

  TFormMenu = class(TForm)
    imgLogo: TImage;
    Label1: TLabel;
    MainMenu: TMainMenu;
    mnSobre: TMenuItem;
    mnCadastro: TMenuItem;
    mnRelatorio: TMenuItem;
    Conexao: TODBCConnection;
    Transacao: TSQLTransaction;
    procedure mnCadastroClick(Sender: TObject);
    procedure mnRelatorioClick(Sender: TObject);
    procedure mnSobreClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FormMenu: TFormMenu;
  FormCadastro: TFormCadastro;
  FormRelatorio: TFormRelatorio;
  FormSobre: TFormSobre;

implementation

{$R *.lfm}

{ TFormMenu }

procedure TFormMenu.mnCadastroClick(Sender: TObject);
begin
     FormCadastro := TFormCadastro.Create(Application);
     FormCadastro.Show;
end;

procedure TFormMenu.mnRelatorioClick(Sender: TObject);
begin
     FormRelatorio := TFormRelatorio.Create(Application);
     FormRelatorio.Show;
end;

procedure TFormMenu.mnSobreClick(Sender: TObject);
begin
     FormSobre := TFormSobre.Create(Application);
     FormSobre.Show;
end;

end.

