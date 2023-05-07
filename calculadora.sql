USE db_procedures;

DELIMITER $$
CREATE PROCEDURE calculadora (IN operacao VARCHAR(1),IN n1 INT, N2 INT)
BEGIN
	CASE
		WHEN operacao = "+" THEN 
			SELECT (n1 + n2) AS "SOMA";
		WHEN operacao = "-" THEN
			SELECT (n1 - n2) AS "SUBTRACAO";
		WHEN operacao = "*" THEN
			SELECT (n1 * n2) "Multiplicacao";
		WHEN operacao = "/" THEN
			SELECT (n1 / n2) "DIVISAO";
		ELSE 
			SELECT 'Operacao não encontrada' AS "ERRO";
    END CASE;
END $$
DELIMITER ;

CALL calculadora("+",18,3);