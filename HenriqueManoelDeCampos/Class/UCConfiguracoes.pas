unit UCConfiguracoes;

interface

uses Data.Win.ADODB, UnDTMGeral, System.Classes, Data.DB, Vcl.Grids, System.SysUtils, Vcl.ComCtrls, Vcl.Graphics, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
 Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type

  TConfiguracoes = class
  private
    { private declarations }
  protected
    { protected declarations }
    p_sSQL: String;
    procedure CarregarComandoSQL(); virtual; abstract;
  public
    { public declarations }
    procedure pExecutarProcedure(v_sNomeProcedure, v_sParametros: String);
    function Split(v_sTexto: String; v_sDelimitador: Char): TStringList;
    function RetornarRegistros(): TDataSource;
  published
    { published declarations }

end;

implementation
{ TConfiguracoes }

procedure TConfiguracoes.pExecutarProcedure(v_sNomeProcedure: String;
                                            v_sParametros: String);
var
  spManterDados: TADOStoredProc;
  iContador: Integer;
  slParametros: TStringList ;
begin
  try
    slParametros:= Split(v_sParametros , '|')  ;
    spManterDados:= TADOStoredProc.Create(spManterDados);
    spManterDados.Connection:= DTMGERAL.ADOGeral;
    spManterDados.ProcedureName:= v_sNomeProcedure;
    spManterDados.Parameters.Refresh;
    for iContador := 0 to spManterDados.Parameters.Count - 1 do
    begin
      if iContador <= slParametros.count -1 then
        spManterDados.Parameters[iContador].Value:= slParametros[iContador];
      spManterDados.Parameters[iContador].Value:= spManterDados.Parameters[iContador].Value;
    end;
    spManterDados.ExecProc;
  finally
    FreeAndNil(spManterDados)
  end;

end;

function TConfiguracoes.Split(v_sTexto: String; v_sDelimitador: Char): TStringList;
var
  SLLista: TStringList;
begin
  Result:= nil;
  SLLista:= TStringList.Create();
  SLLista.StrictDelimiter:=True; //Tira espaço em branco como delimitador
  SLLista.Delimiter:= v_sDelimitador;
  SLLista.DelimitedText:= v_sTexto;
  Result:= SLLista;
end;

function TConfiguracoes.RetornarRegistros(): TDataSource;
var
  QryConsulta: TAdoQuery;
  dsConsulta: TDataSource;
begin
  CarregarComandoSQL();
  QryConsulta:= TADOQuery.Create(Nil);
  dsConsulta:= TDataSource.Create(nil);
  QryConsulta.Connection:= DTMGERAL.ADOGeral;
  QryConsulta.Close;
  QryConsulta.SQL.Add(p_sSQL);
  QryConsulta.Open;
  dsConsulta.DataSet:= QryConsulta;
  Result:= dsConsulta;
end;


end.
