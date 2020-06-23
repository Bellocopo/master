unit Relatorio;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, DBGrids, rotinas;

type
  TqrRelatorio = class(Tform)
  private

  public
    Class procedure PrintDBGrid(ADBGRid :TDBGrid ; Nome_Relatorio:string = ''; periodo : String = '';
    filtro1 : String =''; filtro2 : String =''; filtro3 : String =''; filtro4 : String ='';
    filtro5 : String =''; filtro6 : String =''; filtro7 : String =''; calculaTotal : Boolean = False; widthNome : Integer = 120);
  end;

var
  qrRelatorio: TqrRelatorio;
  xcalculaTotal : Boolean;

implementation


{$R *.DFM}

{ TQuickReport1 }

class procedure TqrRelatorio.PrintDBGrid(ADBGRid: TDBGrid; Nome_Relatorio,
  periodo, filtro1, filtro2, filtro3, filtro4, filtro5, filtro6, filtro7: String; calculaTotal: Boolean; widthNome : Integer);
var
  i, posi: Integer;
begin
  posi := 2;
  qrRelatorio := TqrRelatorio.Create(nil);



end;

end.
