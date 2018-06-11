CREATE TABLE PRODUTO( IdProduto          SERIAL PRIMARY KEY
                    , Descricao          VARCHAR(100)
					, Fabricante         VARCHAR(50)
					, Quantidade         INTEGER
					, PrecoUnitario      NUMERIC(14,2)
					, PrecoUnitarioVenda NUMERIC(14,2)
					, DataValidade       DATE
					, UnidadeMedida      INTEGER
					, MinimoEstoque      INTEGER
					, MaximoEstoque      INTEGER
                    );