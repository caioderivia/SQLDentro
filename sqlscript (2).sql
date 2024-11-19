REM   Script: SQLDentroAtividade09
REM   Atividade de SQL PBD - Campus Vila Prudente

CREATE TABLE PRODUTOS ( 
    ID_PRODUTO NUMBER PRIMARY KEY,     
    DESCRICAO VARCHAR2(255),           
    VALOR_VENDA NUMBER(14, 2)           
);

INSERT INTO PRODUTOS (ID_PRODUTO, DESCRICAO, VALOR_VENDA) VALUES (1, 'Teclado', 49.90);

INSERT INTO PRODUTOS (ID_PRODUTO, DESCRICAO, VALOR_VENDA) VALUES (2, 'Monitor', 89.90);

INSERT INTO PRODUTOS (ID_PRODUTO, DESCRICAO, VALOR_VENDA) VALUES (3, 'Mouse Gamer', 159.90);

INSERT INTO PRODUTOS (ID_PRODUTO, DESCRICAO, VALOR_VENDA) VALUES (4, 'CPU', 199.90);

INSERT INTO PRODUTOS (ID_PRODUTO, DESCRICAO, VALOR_VENDA) VALUES (5, 'Fone de Ouvido', 29.90);

DECLARE 
    v_id_produto PRODUTOS.ID_PRODUTO%TYPE; 
    v_descricao  PRODUTOS.DESCRICAO%TYPE; 
    v_valor_venda PRODUTOS.VALOR_VENDA%TYPE; 
    v_total NUMBER(14,2) := 0;  
BEGIN 
   
    FOR rec IN (SELECT ID_PRODUTO, DESCRICAO, VALOR_VENDA FROM PRODUTOS) LOOP 
        v_id_produto := rec.ID_PRODUTO; 
        v_descricao := rec.DESCRICAO; 
        v_valor_venda := rec.VALOR_VENDA; 
         
        
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_id_produto || ', Descrição: ' || v_descricao || ', Valor: ' || v_valor_venda); 
        
        v_total := v_total + v_valor_venda; 
    END LOOP; 
 
    DBMS_OUTPUT.PUT_LINE('Valor total dos produtos: ' || v_total); 
     
EXCEPTION 
    WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('Ocorreu um erro: ' || SQLERRM); 
END; 
/

