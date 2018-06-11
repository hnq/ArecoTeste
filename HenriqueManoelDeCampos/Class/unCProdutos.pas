unit unCProdutos;

interface

Uses
  UCConfiguracoes, System.SysUtils;


type
  TProdutos = Class(TConfiguracoes)
    private
      p_iIdProduto: Integer;
      p_sDescricao: String;
      p_sFabricante: String;
      p_iQuantidade: Integer;
      p_dPrecoUnitario: Double;
      p_dPrecoUnitarioVenda: Double;
      p_dtDataValidade: TDate;
      p_iUnidadeMedida: Integer;
      p_iMinimoEstoque: Integer;
      p_iMaximoEstoque: Integer;
      procedure CarregarComandoSQL(); override;
    public
      property IdProduto         : Integer read p_iIdProduto          write p_iIdProduto;
      property Descricao         : String  read p_sDescricao          write p_sDescricao;
      property Fabricante        : String  read p_sFabricante         write p_sFabricante;
      property Quantidade        : Integer read p_iQuantidade         write p_iQuantidade;
      property PrecoUnitario     : Double  read p_dPrecoUnitario      write p_dPrecoUnitario;
      property PrecoUnitarioVenda: Double  read p_dPrecoUnitarioVenda write p_dPrecoUnitarioVenda;
      property DataValidade      : TDate   read p_dtDataValidade      write p_dtDataValidade;
      property UnidadeMedida     : Integer read p_iUnidadeMedida      write p_iUnidadeMedida;
      property MinimoEstoque     : Integer read p_iMinimoEstoque      write p_iMinimoEstoque;
      property MaximoEstoque     : Integer read p_iMaximoEstoque      write p_iMaximoEstoque;
  End;


implementation

{ TProdutos }

procedure TProdutos.CarregarComandoSQL;
begin
  p_sSQL:= ' SELECT IdProduto ' + sLineBreak +
           '      , Descricao ' + sLineBreak +
           '      , Fabricante ' + sLineBreak +
           '      , Quantidade ' + sLineBreak +
           '      , PrecoUnitario PrecoUnitarioSemFormatacao' + sLineBreak +
           '      , PrecoUnitarioVenda PrecoUnitarioVendaSemFormatacao' + sLineBreak +
           '      , TO_CHAR(PrecoUnitario, ' + QuotedStr('"R$ " 999G999G990D99') + ') PrecoUnitario' + sLineBreak +
           '      , TO_CHAR(PrecoUnitarioVenda, ' + QuotedStr('"R$ " 999G999G990D99') + ') PrecoUnitarioVenda' + sLineBreak +
           '      , (CASE WHEN DataValidade = ' + QuotedStr('1899-12-30') + ' THEN NULL' + sLineBreak +
           '              ELSE DataValidade ' + sLineBreak +
           '         END) DataValidade ' + sLineBreak +
           '      , UnidadeMedida IdUnidadeMedida ' + sLineBreak +
           '      , (CASE WHEN UnidadeMedida = 1 THEN ' + QuotedStr('1 - Caixa') + sLineBreak +
           '              WHEN UnidadeMedida = 2 THEN ' + QuotedStr('2 - Kilo') + sLineBreak +
           '              WHEN UnidadeMedida = 3 THEN ' + QuotedStr('3 - Pacote') + sLineBreak +
           '              WHEN UnidadeMedida = 4 THEN ' + QuotedStr('4 - Unidade') + sLineBreak +
           '         END) UnidadeMedida' + sLineBreak +
           '      , MinimoEstoque ' + sLineBreak +
           '      , MaximoEstoque ' + sLineBreak +
           '  FROM PRODUTO';
end;

end.
