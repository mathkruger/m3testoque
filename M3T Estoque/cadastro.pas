unit cadastro;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, odbcconn, sqldb, dbf, SdfData, db, BufDataset, FileUtil,
  Forms, Controls, Graphics, Dialogs, PopupNotifier, StdCtrls, ExtCtrls, Spin,
  DbCtrls, DBGrids;

type

  { TFormCadastro }

  TFormCadastro = class(TForm)
    btnSair: TButton;
    btnSalvar: TButton;
    btnApagar: TButton;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    pnTop: TPanel;
    pnBotoes: TPanel;
    pnMeio: TPanel;
    pnFooter: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Panel2: TPanel;
    Query: TSQLQuery;
    QueryCOD: TAutoIncField;
    QueryDESCRICAO: TStringField;
    QueryEST_MINIMO: TLongintField;
    QueryEST_QTD: TLongintField;
    procedure btnSairClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FormCadastro: TFormCadastro;


implementation
{$R *.lfm}

{ TFormCadastro }
  uses menu;

procedure TFormCadastro.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFormCadastro.btnSalvarClick(Sender: TObject);
var
  qrySalvar: TSQLQuery;
  TransacaoSalvar: TSQLTransaction;
begin
  qrySalvar:=TSQLQuery.Create(self);
  TransacaoSalvar:=TSQLTransaction.Create(self);

  qrySalvar.DataBase:=FormMenu.Conexao;
  TransacaoSalvar.DataBase:=FormMenu.Conexao;
  TransacaoSalvar.StartTransaction;

  if Query.State in[dsInsert] then
     qrySalvar.SQL.Add('INSERT INTO TB_Material (DESCRICAO, EST_MINIMO, EST_QTD) VALUES ' +
     '('''+ QueryDESCRICAO.AsString +''','''+ QueryEST_MINIMO.AsString +''','''+ QueryEST_QTD.AsString +''');')
  else if Query.State in[dsEdit] then
     qrySalvar.SQL.Add('UPDATE TB_Material SET DESCRICAO = ''' + QueryDESCRICAO.AsString + ''', EST_MINIMO = ' + QueryEST_MINIMO.AsString + ', EST_QTD = ' + QueryEST_QTD.AsString + ' WHERE COD = ' + QueryCOD.AsString + ';');


  qrySalvar.ExecSQL;
  TransacaoSalvar.Commit;

  ShowMessage('Meterial salvo com sucesso!');

  Query.Post;
end;

procedure TFormCadastro.btnApagarClick(Sender: TObject);
var
  qryDeletar: TSQLQuery;
  TransacaoDeletar: TSQLTransaction;
begin
  qryDeletar:=TSQLQuery.Create(self);
  TransacaoDeletar:=TSQLTransaction.Create(self);

  qryDeletar.DataBase:=FormMenu.Conexao;
  TransacaoDeletar.DataBase:=FormMenu.Conexao;
  TransacaoDeletar.StartTransaction;

  if MessageDlg('Confirma a exclusão ?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
  begin
    qryDeletar.SQL.Add('DELETE FROM TB_Material WHERE COD = ' + QueryCOD.AsString);
    qryDeletar.ExecSQL;
    TransacaoDeletar.Commit;

    Query.Delete;
    ShowMessage('Meterial apagado com sucesso!');
  end;

end;

procedure TFormCadastro.Image1Click(Sender: TObject);
begin

end;

procedure TFormCadastro.Panel2Click(Sender: TObject);
begin

end;


end.

