unit fastRep;

interface

uses
  System.SysUtils, System.Classes, frxOLE, frxClass, frxGZip, frxRich, frxChart,
  frxChBox, frxBarcode, frxExportCSV, frxDBSet, frxExportPDF, frxExportRTF,
  frxExportImage, frxDMPExport, frxExportText, frxDesgn, frxCross,
  frxExportBaseDialog, frxExportXLSX, frxExportMail;

type
  Tfr = class(TDataModule)
    frxBarCodeObject1: TfrxBarCodeObject;
    frxCheckBoxObj: TfrxCheckBoxObject;
    frxReport: TfrxReport;
    frxChartObj: TfrxChartObject;
    frxRichObj: TfrxRichObject;
    frxGZipComp: TfrxGZipCompressor;
    frxOLEObj: TfrxOLEObject;
    frxTXTExp: TfrxSimpleTextExport;
    frxDotMatrixExp: TfrxDotMatrixExport;
    frxJPEGExp: TfrxJPEGExport;
    frxRTFExp: TfrxRTFExport;
    frxPDFExp: TfrxPDFExport;
    tab1: TfrxDBDataset;
    tab2: TfrxDBDataset;
    tab3: TfrxDBDataset;
    tab4: TfrxDBDataset;
    tab5: TfrxDBDataset;
    frxCSVExp: TfrxCSVExport;
    frxDesigner: TfrxDesigner;
    frxCrossObject1: TfrxCrossObject;
    tab6: TfrxDBDataset;
    frxXLSXExport1: TfrxXLSXExport;
    frxMailExport1: TfrxMailExport;
  private
    { Private declarations }
  public
    { Public declarations }
    modoEdicao : boolean;
  end;

var
  fr: Tfr;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
