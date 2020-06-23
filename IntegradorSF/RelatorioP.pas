unit RelatorioP;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls,  DBGrids, rotinas;

type
  TqrRelatorioP = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRLabel1: TQRLabel;
    qrLblTitulo: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRBand4: TQRBand;
    QRLabel4: TQRLabel;
    QRSysData3: TQRSysData;
    qreTotal: TQRExpr;
    lblTotal: TQRLabel;
    qrMemoFiltros: TQRMemo;
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public
    Class procedure PrintDBGrid(ADBGRid :TDBGrid ; Nome_Relatorio:string = ''; periodo : String = '';
    filtro1 : String =''; filtro2 : String =''; filtro3 : String =''; filtro4 : String ='';
    filtro5 : String =''; filtro6 : String =''; filtro7 : String =''; calculaTotal : Boolean = False);
  end;

var
  qrRelatorioP: TqrRelatorioP;
  xcalculaTotal : Boolean;

implementation


{$R *.DFM}

{ TQuickReport1 }

class procedure TqrRelatorioP.PrintDBGrid(ADBGRid: TDBGrid; Nome_Relatorio,
  periodo, filtro1, filtro2, filtro3, filtro4, filtro5, filtro6, filtro7: String; calculaTotal: Boolean);
var
  i, posi: Integer;
  col: TQRLabel;
  fld: TQRDBText;
begin
  posi := 2;
  qrRelatorioP := TqrRelatorioP.Create(nil);
  qrRelatorioP.qrLblTitulo.Caption := Nome_Relatorio;

  if trim(periodo)<>'' then qrRelatorioP.qrMemoFiltros.lines.add(periodo);
  if trim(filtro1)<>'' then qrRelatorioP.qrMemoFiltros.lines.add(filtro1);
  if trim(filtro2)<>'' then qrRelatorioP.qrMemoFiltros.lines.add(filtro2);
  if trim(filtro3)<>'' then qrRelatorioP.qrMemoFiltros.lines.add(filtro3);
  if trim(filtro4)<>'' then qrRelatorioP.qrMemoFiltros.lines.add(filtro4);
  if trim(filtro5)<>'' then qrRelatorioP.qrMemoFiltros.lines.add(filtro5);
  if trim(filtro6)<>'' then qrRelatorioP.qrMemoFiltros.lines.add(filtro6);
  if trim(filtro7)<>'' then qrRelatorioP.qrMemoFiltros.lines.add(filtro7);


  with qrRelatorioP do begin
    DataSet := ADBGrid.DataSource.DataSet;
    for i := 0 to Pred(ADBGrid.columns.Count) do begin
      if ADBGrid.Columns[i].Visible then begin
        // Cabeçalho das Colunas
        col := TQRLabel.Create(qrRelatorioP);
        col.Parent := qrRelatorioP.QRBand2;
        col.Caption := ADBGrid.Columns[i].Title.Caption;
        col.Top := 4;
        col.Left := posi;
        // Linhas de detalhes
        fld := TQRDBText.Create(qrRelatorioP);
        fld.Parent := qrRelatorioP.QRBand3;
        fld.DataSet := DataSet;
        fld.DataField := ADBGrid.Columns[i].Field.FieldName;
        fld.Top := 4;
        fld.Left := posi;

        if pos('VALOR',upperCase(ADBGrid.Columns[i].Field.name))>0 then
          fld.Alignment:=taRightJustify
        else
          fld.Alignment:=taLeftJustify;


        if (pos('DESP',upperCase(ADBGrid.Columns[i].Field.name))>0) or (pos('NOME',upperCase(ADBGrid.Columns[i].Field.name))>0) then
          posi := posi + ADBGrid.Columns[i].Field.DisplayWidth+120
        else if pos('DATA',upperCase(ADBGrid.Columns[i].Field.name))>0 then
  //        posi:=posi+length(ADBGrid.Columns[i].Title.Caption)+100
          posi := posi + ADBGrid.Columns[i].Field.DisplayWidth+90
        else
  //        posi:=posi+length(ADBGrid.Columns[i].Title.Caption)+75;
          posi := posi + ADBGrid.Columns[i].Field.DisplayWidth+65;




  //      posi := posi + ADBGrid.Columns[i].Width+10; // 25

      {  if varType(ADBGrid.Columns[i].Field.Value)=vardate then
          posi := posi + ADBGrid.Columns[i].Field.DisplayWidth+90
        else
          posi := posi + ADBGrid.Columns[i].Field.DisplayWidth+65;
  }


      end;
    end;

  xcalculaTotal:=calculaTotal;

  Preview;
end;

end;

procedure TqrRelatorioP.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if xcalculaTotal then begin
    lblTotal.Caption:='Valor Total:';
    qreTotal.Expression:='sum(valor)';
  end else begin
    lblTotal.Caption:='';
    qreTotal.Expression:='';
  end;
end;

end.
