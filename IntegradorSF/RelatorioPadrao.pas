unit RelatorioPadrao;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, DBGrids;

type
  TqrRelatorioPadrao = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel4: TQRLabel;
    QRSysData3: TQRSysData;
  private

  public
    Class procedure PrintDBGrid(ADBGRid :TDBGrid ; Nome_Relatorio:string ; periodo : String; filtro1 : String =''; filtro2 : String =''; filtro3 : String =''; filtro4 : String ='');
  end;

var
  qrRelatorioPadrao: TqrRelatorioPadrao;

implementation          
  
{$R *.DFM}

{ TQuickReport1 }

class procedure TqrRelatorioPadrao.PrintDBGrid(ADBGRid: TDBGrid; Nome_Relatorio,
  periodo, filtro1, filtro2, filtro3, filtro4: String);
var
  i, posi: Integer;
  col: TQRLabel;
  fld: TQRDBText;
begin
  posi := 0;
  qrRelatorioPadrao := TqrRelatorioPadrao.Create(nil);
  qrRelatorioPadrao.QRLabel2.Caption := Nome_Relatorio;
  with qrRelatorioPadrao do
  begin
  DataSet := ADBGrid.DataSource.DataSet;
  for i := 0 to Pred(ADBGrid.columns.Count) do
  begin
    // Cabeçalho das Colunas
    col := TQRLabel.Create(qrRelatorioPadrao);
    col.Parent := qrRelatorioPadrao.QRBand2;
    col.Caption := ADBGrid.Columns[i].Title.Caption;
    col.Top := 4;
    col.Left := posi;
    // Linhas de detalhes
    fld := TQRDBText.Create(qrRelatorioPadrao);
    fld.Parent := qrRelatorioPadrao.QRBand3;
    fld.DataSet := DataSet;
    fld.DataField := ADBGrid.Columns[i].Field.FieldName;
    fld.Top := 4;
    fld.Left := posi;
    posi := posi + ADBGrid.Columns[i].Width + 25;
  end;
  Preview;
end;

end;

end.
