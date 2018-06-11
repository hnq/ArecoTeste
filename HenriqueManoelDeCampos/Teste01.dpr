program Teste01;

uses
  Vcl.Forms,
  unPrincipal in 'unPrincipal.pas' {frmPrincipal},
  unFrmConsultaProdutos in 'View\unFrmConsultaProdutos.pas' {frmProdutosConsulta},
  unFrmCadastroProdutos in 'View\unFrmCadastroProdutos.pas' {frmProdutosCadastro},
  unCProdutos in 'Class\unCProdutos.pas',
  unDtmGeral in 'unDtmGeral.pas' {DTMGERAL: TDataModule},
  UCConfiguracoes in 'Class\UCConfiguracoes.pas',
  unConst in 'Class\unConst.pas',
  unFrmRelProduto in 'View\unFrmRelProduto.pas' {frmRelProdutos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDTMGERAL, DTMGERAL);
  Application.CreateForm(TfrmRelProdutos, frmRelProdutos);
  Application.Run;
end.
