unit filtro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Data.DB, Datasnap.DBClient,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Phys.ODBCBase,
  FireDAC.Comp.DataSet, Data.SqlExpr, ACBrBase, ACBrEnterTab, strUtils;

type
  TfrmFiltro = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnFiltrar: TBitBtn;
    btnCancelar: TBitBtn;
    gridFiltro: TDBGrid;
    cdsFiltro: TClientDataSet;
    cdsFiltroLABEL: TStringField;
    cdsFiltroCAMPO: TStringField;
    cdsFiltroVALOR: TStringField;
    dsFiltro: TDataSource;
    ACBrEnterTab1: TACBrEnterTab;
    procedure listaCampos;
    function filtroSQL : string;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure gridFiltroKeyPress(Sender: TObject; var Key: Char);
    procedure gridFiltroColEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ResultadoFiltro : string;
  end;

var
  frmFiltro: TfrmFiltro;

implementation

uses dm, globais, rotinas;

{$R *.dfm}

{ TForm1 }

procedure TfrmFiltro.btnCancelarClick(Sender: TObject);
begin
  modalResult:=mrCancel;
end;

procedure TfrmFiltro.btnFiltrarClick(Sender: TObject);
begin
  resultadoFiltro := filtroSQL;
  modalResult:=mrOK;
end;

function TfrmFiltro.filtroSQL: string;
var
  xfiltro : string;
  bNumerico, bData : boolean;

  function dataInicial(xdata : string) : string;
  begin
    result:= ''+formatDateTime('yyyy-mm-dd',strToDate(xdata))+'';
  end;

  function dataFinal(xdata : string) : string;
  begin
    result:= ''+formatDateTime('yyyy-mm-dd',strToDate(xdata)+1)+'';
  end;

begin
  xfiltro:='';
  try
    cdsFiltro.DisableControls;
    cdsFiltro.First;
    while not cdsFiltro.Eof do begin
      if trim(cdsFiltroVALOR.AsString)<>'' then begin
        bNumerico:= TFDQuery(a.FindComponent(Modulo.Tabela)).FieldByName(cdsFiltroCAMPO.AsString).DataType in [ftFloat, ftInteger, ftSmallint];
        bData    := TFDQuery(a.FindComponent(Modulo.Tabela)).FieldByName(cdsFiltroCAMPO.AsString).DataType in [ftDate, ftDateTime, ftTimeStamp];

        if bData then begin
        //  Cast(CampoDataHora as Date) = '2011-11-14'
        //CONVERT(CHAR(10), CURRENT_TIMESTAMP, 103)
          xfiltro:=xfiltro+ifthen(trim(xfiltro)<>'', ' and ','')+cdsFiltroCampo.AsString+' between '+dataInicial(cdsFiltroVALOR.AsString)+' and '+dataFinal(cdsFiltroVALOR.AsString);
         // TFDQuery(a.FindComponent(Modulo.Tabela)).params.ParamByName('datai').Value := cdsFiltroVALOR.AsDateTime;
         // TFDQuery(a.FindComponent(Modulo.Tabela)).params.ParamByName('dataf').Value := cdsFiltroVALOR.AsDateTime + StrToDAteTime(' 23:59:00');
        end else
          xfiltro:=xfiltro+ifthen(trim(xfiltro)<>'', ' and ','')+cdsFiltroCAMPO.AsString+'='+ifthen(bNumerico, somenteNumeros(cdsFiltroVALOR.AsString),''''+cdsFiltroVALOR.AsString+'''');
      end;

      cdsFiltro.Next;
    end;
  finally
    cdsFiltro.EnableControls;
    result:=xfiltro;
  end;
end;

procedure TfrmFiltro.FormShow(Sender: TObject);
begin
  listaCampos;
  gridFiltro.SelectedIndex := 1;
  gridFiltro.SetFocus;
end;

procedure TfrmFiltro.gridFiltroColEnter(Sender: TObject);
begin
 cdsFiltroVALOR.EditMask     := TFDQuery(a.FindComponent(Modulo.Tabela)).FieldByName(cdsFiltroCAMPO.AsString).EditMask;
 if TFDQuery(a.FindComponent(Modulo.Tabela)).FieldByName(cdsFiltroCAMPO.AsString).DataType in [ftDate, ftDateTime, ftTimeStamp] then
   cdsFiltroVALOR.EditMask:='99/99/9999;1;_';
end;

procedure TfrmFiltro.gridFiltroKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    gridFiltro.Perform(WM_KEYDOWN, VK_TAB, 0);

end;

procedure TfrmFiltro.listaCampos;
var
  i: Integer;
begin
  cdsFiltro.CreateDataSet;
  for i := 0 to TFDQuery(a.FindComponent(Modulo.Tabela)).FieldCount-1 do begin
    if TFDQuery(a.FindComponent(Modulo.Tabela)).Fields[i].Visible then begin
      cdsFiltro.Append;
      cdsFiltroLABEL.AsAnsiString := TFDQuery(a.FindComponent(Modulo.Tabela)).Fields[i].DisplayName;
      cdsFiltroCAMPO.AsAnsiString := TFDQuery(a.FindComponent(Modulo.Tabela)).Fields[i].FieldName;
      cdsFiltroVALOR.EditMask     := TFDQuery(a.FindComponent(Modulo.Tabela)).Fields[i].EditMask;
      if TFDQuery(a.FindComponent(Modulo.Tabela)).Fields[i].DataType in [ftDate, ftDateTime, ftTimeStamp] then
        cdsFiltroVALOR.EditMask:='99/99/9999;1;_';


      cdsFiltro.Post;
    end;
  end;
  cdsFiltro.First;
end;

end.
