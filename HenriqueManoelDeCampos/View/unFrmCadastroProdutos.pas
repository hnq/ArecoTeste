unit unFrmCadastroProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, unCProdutos,
  unConst, REST.Utils;

type
  TfrmProdutosCadastro = class(TForm)
    edtId: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    edtFabricante: TLabeledEdit;
    edtQuantidade: TLabeledEdit;
    edtPrecoUnitario: TLabeledEdit;
    edtPrecoUnitarioVenda: TLabeledEdit;
    edtDataValidade: TLabeledEdit;
    edtMinimoEstoque: TLabeledEdit;
    edtMaximoEstoque: TLabeledEdit;
    cboUnidadeMedida: TComboBox;
    Label1: TLabel;
    btnGravar: TSpeedButton;
    btnFechar: TSpeedButton;
    procedure btnGravarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtPrecoUnitarioExit(Sender: TObject);
    procedure edtPrecoUnitarioVendaExit(Sender: TObject);
  private
    { Private declarations }
    p_objProdutos: TProdutos;
    p_iComando: Integer;
    p_iCodigo: Integer;
    p_sNomeProcedure: String;
    p_sParametros: String;
    function ExecutarComando: Boolean;
    procedure FecharForm();
  public
    { Public declarations }
    property Comando: Integer write p_iComando;
    property Codigo: Integer write p_iCodigo;
  end;

var
  frmProdutosCadastro: TfrmProdutosCadastro;

implementation

{$R *.dfm}

procedure TfrmProdutosCadastro.btnFecharClick(Sender: TObject);
begin
  FecharForm();
end;

procedure TfrmProdutosCadastro.btnGravarClick(Sender: TObject);
begin
  p_sNomeProcedure:= 'pmanterproduto';
  p_sParametros:= IntToStr(p_iComando) + '|' +
                  IntToStr(p_iCodigo) + '|' +
                  edtDescricao.Text + '|' +
                  edtFabricante.Text + '|' +
                  edtQuantidade.Text + '|' +
                  edtPrecoUnitario.Text + '|' +
                  edtPrecoUnitarioVenda.Text + '|' +
                  iif(length(Trim(edtDataValidade.Text)) = 0, '30/12/1899', edtDataValidade.Text) + '|' +
                  IntToStr(cboUnidadeMedida.ItemIndex + 1) + '|' +
                  edtMinimoEstoque.Text + '|' +
                  edtMaximoEstoque.Text + '|';

  if ExecutarComando() = False then
    Exit;

  FecharForm();
end;

procedure TfrmProdutosCadastro.edtPrecoUnitarioExit(Sender: TObject);
begin
  edtPrecoUnitario.Text:= FormatFloat('#####0.00',StrToFloat(edtPrecoUnitario.Text));
end;

procedure TfrmProdutosCadastro.edtPrecoUnitarioVendaExit(Sender: TObject);
begin
  edtPrecoUnitarioVenda.Text:= FormatFloat('#####0.00',StrToFloat(edtPrecoUnitarioVenda.Text));
end;

function TfrmProdutosCadastro.ExecutarComando():Boolean;
begin
  Result:= False;
  try
    p_objProdutos.pExecutarProcedure(p_sNomeProcedure, p_sParametros);
  except
    Abort;
  end;
  Result:= True;
end;

procedure TfrmProdutosCadastro.FecharForm;
begin
  Close;
end;

procedure TfrmProdutosCadastro.FormCreate(Sender: TObject);
begin
  p_iComando:= g_iSEM_PREENCHIMENTO;
end;

procedure TfrmProdutosCadastro.FormShow(Sender: TObject);
begin
  if p_iComando = g_iSEM_PREENCHIMENTO then
    p_iComando:= g_iINSERT;
  if p_iComando = g_iVISUALIZAR then
  begin
    btnGravar.Visible:= False;
    btnFechar.Visible:= True;
  end;
end;

end.
