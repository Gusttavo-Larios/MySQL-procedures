use db_procedures;

DELIMITER $$
CREATE PROCEDURE calculaUsoDeTinta (IN area_em_metros_quadrados DECIMAL)
BEGIN
	DECLARE preco_do_galao DECIMAL;
    DECLARE preco_da_lata DECIMAL;
    
	DECLARE qtd_de_galoes INTEGER;
	DECLARE qtd_de_latas INTEGER;
    
    DECLARE qtd_de_galoes_com_latas INTEGER;
    DECLARE qtd_de_latas_com_galoes INTEGER;
    
	DECLARE combertura_de_1l_de_tinta DECIMAL;
    DECLARE area_pintada DECIMAL;

    SET area_em_metros_quadrados = floor(area_em_metros_quadrados);
    
    SET preco_do_galao = 80.00;
    SET preco_da_lata = 25.00;

    SET qtd_de_galoes = 0;
    SET qtd_de_latas = 0;

    SET qtd_de_galoes_com_latas = 0;
    SET qtd_de_latas_com_galoes = 0;

    SET combertura_de_1l_de_tinta = 6.00;

    SET area_pintada = 0;
    
-- ADICIONA GALOES DE TINTA ATÉ COBRIR A AREA RESTANTE
    WHILE area_pintada < area_em_metros_quadrados DO
		SET area_pintada = 18 * combertura_de_1l_de_tinta + area_pintada;
        SET qtd_de_galoes = qtd_de_galoes + 1;
    END WHILE;

     SET area_pintada = 0;

-- ADICIONA LATAS DE TINTA ATÉ COBRIR A AREA RESTANTE
    WHILE area_pintada < area_em_metros_quadrados DO
		SET area_pintada = 3.6 * combertura_de_1l_de_tinta + area_pintada;
        SET qtd_de_latas = qtd_de_latas + 1;
    END WHILE;


-- MISTO DE LATAS E GALÕES
	SET area_pintada = 0;
 
-- ADICIONA GALOES DE TINTA ENQUATO A AREA QUE DEVE SER PINTADA É MAIOR OU IGUAL A AREA DE COBERTURA DE UMA UM GALÃO DE TINTA
    WHILE area_em_metros_quadrados - area_pintada >= 18 * combertura_de_1l_de_tinta DO
		SET area_pintada = 18 * combertura_de_1l_de_tinta + area_pintada;
        SET qtd_de_galoes_com_latas = qtd_de_galoes_com_latas + 1;
    END WHILE;

-- CALCULA A QUANTIDADE LATAS NECESSÁRIAS PARA COBRIR O RESTANTE
	SET qtd_de_latas_com_galoes = floor((area_em_metros_quadrados - area_pintada) / 3.6);
    
    SELECT
		area_em_metros_quadrados AS "ÁREAS",
        qtd_de_galoes AS "QTD LATAS DE 18L",
        preco_do_galao * qtd_de_galoes AS "PREÇO LATAS 18L",
        qtd_de_latas AS "TD LATAS DE 3,6L",
        preco_da_lata * qtd_de_latas AS "PREÇO LATAS 3,6L",
        qtd_de_galoes_com_latas + qtd_de_latas_com_galoes AS "QTD LATAS E GALOES",
        (preco_do_galao * qtd_de_galoes_com_latas) + (preco_da_lata * qtd_de_latas_com_galoes) AS "PREÇO GALOES + LATAS"
    ;
END $$

DELIMITER ;

CALL calculaUsoDeTinta(480)  ;