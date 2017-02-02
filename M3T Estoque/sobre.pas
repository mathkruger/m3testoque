unit sobre;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TFormSobre }

  TFormSobre = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Memo1: TMemo;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FormSobre: TFormSobre;

implementation

{$R *.lfm}

end.

