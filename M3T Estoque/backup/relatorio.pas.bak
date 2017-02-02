unit relatorio;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, FileUtil, PrintersDlgs, LR_View, LR_Class,
  LR_DBSet, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls, DBGrids,
  LR_DSet, LR_PGrid, LR_E_HTM;

type

  { TFormRelatorio }

  TFormRelatorio = class(TForm)
    btnMostrar: TButton;
    btnSair: TButton;
    btnSalvar: TButton;
    btnPrint: TButton;
    Button1: TButton;
    dsResult: TDataSource;
    frDBDataSet1: TfrDBDataSet;
    frPreview1: TfrPreview;
    frReport1: TfrReport;
    Image1: TImage;
    Label1: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    PrintDialog1: TPrintDialog;
    qryResult: TSQLQuery;
    qryResultCOD: TAutoIncField;
    qryResultDESCRICAO: TStringField;
    qryResultEST_MINIMO: TLongintField;
    qryResultEST_QTD: TLongintField;
    procedure btnMostrarClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FormRelatorio: TFormRelatorio;

implementation

{$R *.lfm}

{ TFormRelatorio }


procedure TFormRelatorio.btnMostrarClick(Sender: TObject);
begin
  frReport1.LoadFromFile('relatorio.lrf');
  frReport1.ShowReport;
end;

procedure TFormRelatorio.btnPrintClick(Sender: TObject);
var
  FromPage, ToPage, NumberCopies: Integer;
  ind: Integer;
  Collap: Boolean;
begin
  // Load report definition from application directory
  //AppDirectory:=ExtractFilePath(ParamStr(0));
  frReport1.LoadFromFile('relatorio.lrf');
  // Prepare the report and just stop if we hit an error as continuing makes no sense
  if not frReport1.PrepareReport then Exit;
  // Set up dialog with some sensible defaults which user can change
  with PrintDialog1 do
  begin
    Options:=[poPageNums ]; // allows selecting pages/page numbers
    Copies:=1;
    Collate:=true; // ordened copies
    FromPage:=1; // start page
    ToPage:=frReport1.EMFPages.Count; // last page
    MaxPage:=frReport1.EMFPages.Count; // maximum allowed number of pages
    if Execute then // show dialog; if succesful, process user feedback
    begin
      if PrintDialog1.PrintRange = prPageNums then // user made page range selection
      begin
        FromPage:=PrintDialog1.FromPage; // first page
        ToPage:=PrintDialog1.ToPage;  // last page
      end;
      NumberCopies:=PrintDialog1.Copies; // number of copies
      // Print the report using the supplied pages & copies
      frReport1.PrintPreparedReport(inttostr(FromPage)+'-'+inttostr(ToPage), NumberCopies);
    end;
  end;
end;

procedure TFormRelatorio.btnSairClick(Sender: TObject);
begin
  close;
end;

procedure TFormRelatorio.btnSalvarClick(Sender: TObject);
begin

end;

end.

