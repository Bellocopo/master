unit Rotinas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, DBCtrls, StdCtrls, jpeg, gifimg, db, ExtCtrls, SHELLAPI, IniFiles,
  Clipbrd, System.JSON, DateUtils;

Procedure TrataControles(Formulario : TForm);
function Confirma(msg: String): boolean;
Function somenteNumeros(cTexto: String): String;
Function VersaoSistema: String;
function NomeComputador: string;
procedure ListaArquivos(diretorio: string; extensao: string;
  Lista: TStringList);
function scShellRenameFile(FormHandle: THandle; StrFrom, StrTo: string;
  BlnSilent: boolean = False): boolean;
function DiaSemana(Data: TDateTime): String;
function RemoveAcento(const pText: string): string;
function RemoveSeparadores(pText: string): String;
function AjustaTexto(ATexto: String): String;
function ValorIni(AArquivo, ASecao, AIdentificador, AValorPadrao: String)
  : String;
function GravaIni(AArquivo, ASecao, AIdentificador, AValor: String): boolean;
procedure log(ATexto: String);
procedure CopyText(AText: String);
function FormatJSON(AJSON: String): String;
procedure SalvaLog(ALog : String);
function UserAndMacID(Entrada: String): String;
procedure GravaLog(AModulo:String; AChave:String; AOperacao:String);
function OpenForm(formClass: TFormClass): TModalResult;
function PeridoPrevisto(AVencimento: TDateTime):String;
function ObterDataPag : real;
function ObterDataPrevPag(AVencimento: TDateTime):Real;
function TrataValorStr(AValor:String):String;

implementation

uses Globais, dmAPI{$IFNDEF BOT}, dm{$ENDIF};

Procedure TrataControles(Formulario : TForm);
var
  i:integer;
  controle : TControl;
begin
  with Formulario do begin
    for i := 0 to ComponentCount-1 do begin
      controle := TControl (Components[i]);
         if Controle.Visible then begin
            if controle is TDBEdit then begin
              if (Modulo.Operacao=toSemOperacao) or (Modulo.Operacao=toPesquisa) then begin
                controle.Enabled := false;
                (controle as TDBEdit).Color:=$F0FBFF;
                (controle as TDBEdit).Font.Style:=(controle as TDBEdit).Font.Style+[FsBold];
              end else begin
                controle.Enabled := True;
                (controle as TDBEdit).Color:=clWhite;
                (controle as TDBEdit).Font.Style:=(controle as TDBEdit).Font.Style-[FsBold];
              end;
            end else if controle is TDBLookupComboBox then begin
              if (Modulo.Operacao=toSemOperacao) or (Modulo.Operacao=toPesquisa) then begin
                controle.Enabled := false;
                (controle as TDBLookupComboBox).Color:=$F0FBFF;
                (controle as TDBLookupComboBox).Font.Style:=(controle as TDBLookupComboBox).Font.Style+[FsBold];
              end else begin
                 controle.Enabled := true;
                (controle as TDBLookupComboBox).Color:=clWhite;
                (controle as TDBLookupComboBox).Font.Style:=(controle as TDBLookupComboBox).Font.Style-[FsBold];
              end;
            end else if controle is TComboBox then begin
              if (Modulo.Operacao=toSemOperacao) or (Modulo.Operacao=toPesquisa) then begin
                controle.Enabled := false;
                (controle as TComboBox).Color:=$F0FBFF;
                (controle as TComboBox).Font.Style:=(controle as TComboBox).Font.Style+[FsBold];
              end else begin
                 controle.Enabled := true;
                (controle as TComboBox).Color:=clWhite;
                (controle as TComboBox).Font.Style:=(controle as TComboBox).Font.Style-[FsBold];
              end;
            end;
        end;
    end;
  end;
end;


Function somenteNumeros(cTexto: String): String;
var
  Ind: Integer;
  TmpRet: String;

  function IsDigit(Texto: string): boolean;
  begin
    Result := (Texto >= '0') And (Texto <= '9');
  end;

begin
  TmpRet := '';
  for Ind := 1 to Length(cTexto) do
    if IsDigit(Copy(cTexto, Ind, 1)) then
      TmpRet := TmpRet + Copy(cTexto, Ind, 1);
  Result := TmpRet;
end;

function Confirma(msg: String): boolean;
begin
  Result := application.MessageBox(Pchar(msg), 'Atenção',
    MB_ICONQUESTION + MB_YESNO) = IDyes;
end;

Function VersaoSistema: String;
type
  PFFI = ^vs_FixedFileInfo;
var
  F: PFFI;
  Handle: Dword;
  Len: Longint;
  Data: Pchar;
  Buffer: Pointer;
  tamanho: Dword;
  Parquivo: Pchar;
  Arquivo: String;
begin
  Arquivo := application.ExeName;
  Parquivo := StrAlloc(Length(Arquivo) + 1);
  StrPcopy(Parquivo, Arquivo);
  Len := GetFileVersionInfoSize(Parquivo, Handle);
  Result := '';
  if Len > 0 then
  begin
    Data := StrAlloc(Len + 1);
    if GetFileVersionInfo(Parquivo, Handle, Len, Data) then
    begin
      VerQueryValue(Data, '\', Buffer, tamanho);
      F := PFFI(Buffer);
      Result := Format('%d.%d.%d', [HiWord(F^.dwFileVersionMs),
        LoWord(F^.dwFileVersionMs), HiWord(F^.dwFileVersionLs),
        LoWord(F^.dwFileVersionLs)]);
    end;
    StrDispose(Data);
  end;
  StrDispose(Parquivo);
end;

function NomeComputador: string;
var
  ipbuffer: string;
  nsize: Dword;
begin
  nsize := 255;
  SetLength(ipbuffer, nsize);
  if GetComputerName(Pchar(ipbuffer), nsize) then
    Result := ipbuffer;
end;

procedure ListaArquivos(diretorio: string; extensao: string;
  Lista: TStringList);
var
  SR: TSearchRec;
  FDiretorio: String;
begin
  extensao := '*.*';
  FDiretorio := ''; // diretorio;
  if FindFirst(diretorio + '\' + extensao, faAnyFile, SR) = 0 then
  begin
    repeat
      if (SR.Attr <> faDirectory) then
      begin
        if pos('#APROVADO', UpperCase(SR.Name)) > 0 then
          Lista.Add(diretorio + '\' + SR.Name);
      end
      else if (SR.Name <> '.') and (SR.Name <> '..') then
      begin
        // Lista.Add(diretorio+SR.Name);
        FDiretorio := SR.Name;
        ListaArquivos(diretorio + '\' + FDiretorio, extensao, Lista);
      end;
    until FindNext(SR) <> 0;
    FindClose(SR);
    // if lista.Count>0 then
    // ShowMessage(lista.Text);
  end;
end;

function scShellRenameFile(FormHandle: THandle; StrFrom, StrTo: string;
  BlnSilent: boolean = False): boolean;
var
  F: TShFileOpStruct;
begin
  F.Wnd := FormHandle;
  F.wFunc := FO_RENAME;
  F.pFrom := Pchar(StrFrom + #0);
  F.pTo := Pchar(StrTo + #0);
  F.fFlags := FOF_ALLOWUNDO or FOF_RENAMEONCOLLISION;
  if BlnSilent then
    F.fFlags := F.fFlags or FOF_SILENT;
  if ShFileOperation(F) <> 0 then
    Result := False
  else
    Result := True;
end;

function DiaSemana(Data: TDateTime): String;
{ Retorna dia da semana }
var
  NoDia: Integer;
  DiaDaSemana: array [1 .. 7] of String[13];
begin
  { Dias da Semana }
  DiaDaSemana[1] := 'Domingo';
  DiaDaSemana[2] := 'Segunda-feira';
  DiaDaSemana[3] := 'Terça-feira';
  DiaDaSemana[4] := 'Quarta-feira';
  DiaDaSemana[5] := 'Quinta-feira';
  DiaDaSemana[6] := 'Sexta-feira';
  DiaDaSemana[7] := 'Sábado';
  NoDia := DayOfWeek(Data);
  DiaSemana := DiaDaSemana[NoDia];
end;

function RemoveAcento(const pText: string): string;
type
  USAscii20127 = type AnsiString(20127);
begin
  Result := string(USAscii20127(pText));
end;

function RemoveSeparadores(pText: string): String;
begin
  pText := StringReplace(pText, '/', '', [rfReplaceAll]);
  pText := StringReplace(pText, '\', '', [rfReplaceAll]);
  pText := StringReplace(pText, '|', '', [rfReplaceAll]);
  pText := StringReplace(pText, '.', '', [rfReplaceAll]);
  pText := StringReplace(pText, '-', '', [rfReplaceAll]);
  pText := StringReplace(pText, ',', '', [rfReplaceAll]);
  pText := StringReplace(pText, ':', '', [rfReplaceAll]);
  pText := StringReplace(pText, ';', '', [rfReplaceAll]);
  pText := StringReplace(pText, #39, '', [rfReplaceAll]);
  pText := StringReplace(pText, #40, '', [rfReplaceAll]);
  Result := pText;
end;

function AjustaTexto(ATexto: String): String;
begin
  ATexto := RemoveAcento(ATexto);
  ATexto := RemoveSeparadores(ATexto);
  Result := Trim(UpperCase(ATexto));
end;

function ValorIni(AArquivo, ASecao, AIdentificador, AValorPadrao: String)
  : String;
Var
  ini: TIniFile;
begin
  ini := TIniFile.Create(AArquivo);
  try
    Result := ini.ReadString(ASecao, AIdentificador, AValorPadrao);
  finally
    ini.Free;
  end;
end;

function GravaIni(AArquivo, ASecao, AIdentificador, AValor: String): boolean;
Var
  ini: TIniFile;
Begin
  Result := True;
  ini := TIniFile.Create(AArquivo);
  try
    try
      ini.WriteString(ASecao, AIdentificador, AValor);
    except
      Result := False
    end;
  finally
    ini.Free;
  end;
end;

procedure log(ATexto: String);
begin
  if memo_log<>nil then
  begin
    if Length(memo_log.Text) >= 10000 then
    begin
      salvaLog(memo_log.Text);
      memo_log.Clear;
    end;
    memo_log.Lines.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss', now) + ' ' + ATexto);
  end;
end;

procedure CopyText(AText: String);
begin
  Clipboard.AsText := AText;
end;

function FormatJSON(AJSON: String): String;
var
  LJSONObject: TJSONObject;
begin

  LJSONObject := nil;
  try
    { convert String to JSON }
    LJSONObject := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(AJSON),
      0) as TJSONObject;

    { output the JSON to console as String }
    Result := LJSONObject.ToString;
  finally
    LJSONObject.Free;
  end;
end;

procedure SalvaLog(ALog : String);
var
  FFile : TextFile;
  FNomeArq : String;
  FPasta : String;
begin
  FPasta :=pastaTrabalho+'\Log\'+formatDateTime('yyyymm',date);
  ForceDirectories(FPasta);
  FNomeArq := FPasta+'\'+formatDateTime('yyyymmdd',date)+'.txt';

  try
    AssignFile(FFile,FNomeArq);
    if FileExists(FNomeArq) then
      Append(FFile)
    else
      Rewrite(FFile);
    Writeln(FFile,ALog);
  finally
    Closefile(FFile);
  end;
end;

procedure GravaLog(AModulo:String; AChave:String; AOperacao:String);
begin
  {$IFNDEF BOT}
  a.Log.SQL.Text := 'select * from log where id is null';
  a.Log.Open;
  a.Log.Append;
  a.LogDATA.AsDateTime        := now;
  a.LogID_FUNCIONARIO.AsFloat := usuario.codigo;
  a.LogUSUARIO.AsString       := usuario.nome;
  a.LogMODULO.AsString        := AModulo;
  a.Logchave.AsString         := AChave;
  a.LogOPERACAO.AsString      := AOperacao;
  a.LogCOMPUTADOR.AsString    := UserAndMacID('MacID');
  a.LogVERSAO.AsString        := VersaoSistema;
  a.Log.Post;
  {$ENDIF}
end;

function UserAndMacID(Entrada: String): String;
Var
  Buffer: String;
  BufLen: DWord;
begin
  If (Entrada = 'UserID') Then
  Begin
    BufLen := 255;
    setlength(Buffer, BufLen);
    GetUserName(PChar(Buffer), BufLen);
    setlength(Buffer, BufLen);
    UserAndMacID := Buffer;
  End;
  If (Entrada = 'MacID') Then
  Begin
    BufLen := 255;
    setlength(Buffer, BufLen);
    GetComputerName(PChar(Buffer), BufLen);
    setlength(Buffer, BufLen);
    UserAndMacID := Buffer;
  End;
end;

function OpenForm(formClass: TFormClass): TModalResult;
var
  formQualquer: TForm;
begin
  Application.CreateForm( formClass, formQualquer );
  try
    formQualquer.ShowModal;
    result := formQualquer.ModalResult;
  finally
    FreeAndNil( formQualquer );
  end;
end;

function PeridoPrevisto(AVencimento: TDateTime):String;
var
  LDia: Word;
  LAno: Word;
  LMes: Word;
  LData: TDateTime;
begin
  DecodeDate(AVencimento, LAno, LMes, LDia);
  LDia      := 1;
  LMes      := LMes+1;
  LData  := EncodeDate(LAno, LMes, LDia);
  result := formatDateTime('mm/yyyy',LData);
end;

function ObterDataPag : real;
var
  LDia: Word;
  LAno: Word;
  LMes: Word;
  LDataPag : TDateTime;
begin
  DecodeDate(Date, LAno, LMes, LDia);
  LDia      := 1;
  LDataPag  := EncodeDate(LAno, LMes, LDia);
  result := StrToFloat(formatDateTime('yyyymm',LDataPag));
end;

function ObterDataPrevPag(AVencimento : TDateTime) : real;
var
  LDia: Word;
  LAno: Word;
  LMes: Word;
begin
  DecodeDate(AVencimento, LAno, LMes, LDia);
  LDia := 1;
  LMes := LMes+1;
  AVencimento  := EncodeDate(LAno, LMes, LDia);
  result := StrToFloat(formatDateTime('yyyymm',Avencimento));
end;

function TrataValorStr(AValor:String):String;
begin
  AValor := stringreplace(AValor, '.','', [rfReplaceAll, rfIgnoreCase]);
  AValor := stringreplace(AValor, ',','.', [rfReplaceAll, rfIgnoreCase]);
  result := Trim(AValor);
end;


end.
