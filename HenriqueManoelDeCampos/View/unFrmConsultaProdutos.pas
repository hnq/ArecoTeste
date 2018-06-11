unit unFrmConsultaProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, unCProdutos, unFrmCadastroProdutos, unConst, unFrmRelProduto;

type
  TfrmProdutosConsulta = class(TForm)
    dbgProdutos: TDBGrid;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    btnConsultar: TSpeedButton;
    btnVisualizar: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnIncluir: TSpeedButton;
    btnFechar: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
  private
    { Private declarations }
    p_objCProdutos: TProdutos;
    procedure CarregarForm();
    function CarregarTelaAlteracaoVisualizacao(v_iComando: Integer): Boolean;
  public
    { Public declarations }
  end;

var
  frmProdutosConsulta: TfrmProdutosConsulta;

implementation

{$R *.dfm}

{ TfrmProdutosConsulta }

procedure TfrmProdutosConsulta.FormCreate(Sender: TObject);
begin
  p_objCProdutos:= TProdutos.Create;
end;

procedure TfrmProdutosConsulta.FormDestroy(Sender: TObject);
begin
  FreeAndNil(p_objCProdutos);
end;

procedure TfrmProdutosConsulta.FormShow(Sender: TObject);
begin
  CarregarForm();
end;

procedure TfrmProdutosConsulta.btnAlterarClick(Sender: TObject);
begin
  CarregarTelaAlteracaoVisualizacao(g_iUPDATE);
end;

procedure TfrmProdutosConsulta.btnConsultarClick(Sender: TObject);
var
  ofrmRelProduto: TfrmRelProdutos;
begin
  try
    Application.CreateForm(TfrmRelProdutos, ofrmRelProduto);
    ofrmRelProduto.qryProdutos.DataSource:= dbgProdutos.DataSource;
    ofrmRelProduto.QuickRep1.Preview;
  Finally
    FreeAndNil(ofrmRelProduto);
  end;
end;

procedure TfrmProdutosConsulta.btnFecharClick(Sender: TObject);
var
  sCodigoSelecionado: string;
begin
  if dbgProdutos.DataSource.DataSet.RecordCount = 0 then
    Exit;

  if Application.MessageBox('Deseja realmente excluir esse registro?', 'Atenção', MB_ICONQUESTION + MB_YESNO) =  mrNo Then
    Exit;

  sCodigoSelecionado:= dbgProdutos.DataSource.DataSet.FieldByName('IdProduto').AsString;

  p_objCProdutos.pExecutarProcedure('pmanterproduto', g_sDELETE + '|' + sCodigoSelecionado);
  CarregarForm();
end;

procedure TfrmProdutosConsulta.btnIncluirClick(Sender: TObject);
begin
  Try
    Application.CreateForm(TfrmProdutosCadastro, frmProdutosCadastro);
    frmProdutosCadastro.ShowModal;
  Finally
    FreeAndNil(frmProdutosCadastro);
  End;
  CarregarForm();
end;

procedure TfrmProdutosConsulta.btnVisualizarClick(Sender: TObject);
begin
  CarregarTelaAlteracaoVisualizacao(g_iVISUALIZAR);
end;

procedure TfrmProdutosConsulta.CarregarForm;
begin
  dbgProdutos.DataSource:= p_objCProdutos.RetornarRegistros();
end;

function TfrmProdutosConsulta.CarregarTelaAlteracaoVisualizacao(v_iComando: Integer): Boolean;
begin
  if dbgProdutos.DataSource.DataSet.RecordCount = 0 then
    Exit;

  Try
    Application.CreateForm(TfrmProdutosCadastro, frmProdutosCadastro);
    frmProdutosCadastro.Comando:= v_iComando;
    frmProdutosCadastro.Codigo:= dbgProdutos.DataSource.DataSet.FieldByName('IdProduto').AsInteger;
    frmProdutosCadastro.edtId.Text:= dbgProdutos.DataSource.DataSet.FieldByName('IdProduto').AsString;
    frmProdutosCadastro.edtDescricao.Text:= dbgProdutos.DataSource.DataSet.FieldByName('Descricao').AsString;
    frmProdutosCadastro.edtFabricante.Text:= dbgProdutos.DataSource.DataSet.FieldByName('Fabricante').AsString;
    frmProdutosCadastro.edtQuantidade.Text:= dbgProdutos.DataSource.DataSet.FieldByName('Quantidade').AsString;
    frmProdutosCadastro.edtPrecoUnitario.Text:= dbgProdutos.DataSource.DataSet.FieldByName('PrecoUnitarioSemFormatacao').AsString;
    frmProdutosCadastro.edtPrecoUnitarioVenda.Text:= dbgProdutos.DataSource.DataSet.FieldByName('PrecoUnitarioVendaSemFormatacao').AsString;
    frmProdutosCadastro.edtDataValidade.Text:= dbgProdutos.DataSource.DataSet.FieldByName('DataValidade').AsString;
    frmProdutosCadastro.cboUnidadeMedida.ItemIndex:= dbgProdutos.DataSource.DataSet.FieldByName('IdUnidadeMedida').AsInteger -1;
    frmProdutosCadastro.edtMinimoEstoque.Text:= dbgProdutos.DataSource.DataSet.FieldByName('MinimoEstoque').AsString;
    frmProdutosCadastro.edtMaximoEstoque.Text:= dbgProdutos.DataSource.DataSet.FieldByName('MaximoEstoque').AsString;
    frmProdutosCadastro.ShowModal;
  Finally
    FreeAndNil(frmProdutosCadastro);
  End;
  CarregarForm();
end;

end.
