CREATE OR REPLACE FUNCTION pmanterproduto( POperacao           INT
     									 , PIdProduto          INTEGER
										 , PDescricao          VARCHAR(100)
										 , PFabricante         VARCHAR(50)
										 , PQuantidade         INTEGER
										 , PPrecoUnitario      NUMERIC(14,2)
										 , PPrecoUnitarioVenda NUMERIC(14,2)
										 , PDataValidade       DATE
										 , PPUnidadeMedida     INTEGER
										 , PMinimoEstoque      INTEGER
										 , PMaximoEstoque      INTEGER
                                         )
                                             
RETURNS void AS $$
BEGIN
	IF POperacao = 1 THEN
    	INSERT INTO Produto( Descricao          
						   , Fabricante          
						   , Quantidade
						   , PrecoUnitario
						   , PrecoUnitarioVenda
						   , DataValidade
						   , UnidadeMedida
						   , MinimoEstoque
						   , MaximoEstoque						   
						   )
          VALUES( PDescricao         
		        , PFabricante        
		        , PQuantidade        
		        , PPrecoUnitario    
		        , PPrecoUnitarioVenda
		        , PDataValidade      
		        , PPUnidadeMedida    
		        , PMinimoEstoque     
		        , PMaximoEstoque     
		        ); 	
    END IF;
    IF POperacao = 2 THEN
   		UPDATE Produto SET Descricao          = PDescricao
					     , Fabricante         = PFabricante 
					     , Quantidade         = PQuantidade
					     , PrecoUnitario      = PPrecoUnitario
					     , PrecoUnitarioVenda = PPrecoUnitarioVenda
					     , DataValidade       = PDataValidade
					     , UnidadeMedida      = PPUnidadeMedida
					     , MinimoEstoque      = PMinimoEstoque
					     , MaximoEstoque      =	PMaximoEstoque    
          WHERE IdProduto = PIdProduto;
    END IF;
	
	IF POperacao = 3 THEN
   		DELETE FROM Produto 
          WHERE IdProduto = PIdProduto;
    END IF;	
END;
$$ LANGUAGE plpgsql;
