unit relats;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxDesgn, frxClass, frxExportPDF, frxPreview, fs_idialogsrtti,
  fs_iextctrlsrtti, fs_iformsrtti, frxRich, frxGZip, frxOLE, frxChart,
  frxExportImage, frxExportText,  frxDMPExport, frxChBox, frxDBSet,
  frxExportRTF, frxBarcode, ComCtrls, ExtCtrls, frxCross;

type
  TfrmRelats = class(TForm)
    Panel1: TPanel;
    frxPreview1: TfrxPreview;
    HotKey1: THotKey;
    frxBarCodeObject1: TfrxBarCodeObject;
    frxPDFExport1: TfrxPDFExport;
    frxRTFExport1: TfrxRTFExport;
    tabela1_0: TfrxDBDataset;
    frxCheckBoxObject1: TfrxCheckBoxObject;
    frxReport1: TfrxReport;
    tabela1_1: TfrxDBDataset;
    frxDotMatrixExport1: TfrxDotMatrixExport;
    tabela1_2: TfrxDBDataset;
    tabela1_3: TfrxDBDataset;
    tabela1_4: TfrxDBDataset;
    tabela2_0: TfrxDBDataset;
    tabela2_1: TfrxDBDataset;
    tabela2_2: TfrxDBDataset;
    tabela2_3: TfrxDBDataset;
    tabela2_4: TfrxDBDataset;
    tabela1_5: TfrxDBDataset;
    tabela2_5: TfrxDBDataset;
    tabela1_6: TfrxDBDataset;
    tabela2_6: TfrxDBDataset;
    tabela1_7: TfrxDBDataset;
    tabela1_8: TfrxDBDataset;
    tabela2_7: TfrxDBDataset;
    tabela2_8: TfrxDBDataset;
    tabela1_9: TfrxDBDataset;
    tabela2_9: TfrxDBDataset;
    tabela2_10: TfrxDBDataset;
    tabela1_10: TfrxDBDataset;
    frxSimpleTextExport1: TfrxSimpleTextExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxOLEObject1: TfrxOLEObject;
    frxGZipCompressor1: TfrxGZipCompressor;
    frxCheckBoxObject2: TfrxCheckBoxObject;
    frxRichObject1: TfrxRichObject;
    frxChartObject1: TfrxChartObject;
    procedure imprimir;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelats: TfrmRelats;

implementation
uses dm, globais, rotinas;

{$R *.dfm}

{ TfrmRelats }

procedure TfrmRelats.imprimir;
begin
  if editar then begin
    frxReport1.DesignReport;
  end else begin
  {  frxReport1.PrintOptions.ShowDialog:=false;
    if frxReport1.PrepareReport then
      frxReport1.Print;}
    frxReport1.ShowReport;
  end;
  frxReport1.clear;
end;

end.
