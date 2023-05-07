use db_procedures;

DELIMITER $$
CREATE PROCEDURE calculaHolerit (IN salario_por_hora DECIMAL,  IN horas_trabalhadas INTEGER)
BEGIN
	DECLARE salario_bruto DECIMAL;
    DECLARE inss DECIMAL;
    DECLARE ir DECIMAL;
    DECLARE sindicato DECIMAL;
    DECLARE salario_liquido DECIMAL;

	SET salario_bruto = salario_por_hora * horas_trabalhadas;
        
    SET inss = salario_bruto * 0.08;

	SET ir = salario_bruto * 0.11;
    
	SET sindicato = salario_bruto * 0.05;

    SET salario_liquido = salario_bruto - inss - ir - sindicato;
    
    SELECT 
		salario_bruto AS "Salário Bruto",
        ir AS "Imposto de Renda",
        inss AS "INSS",
        sindicato AS "Sindicato",
        salario_liquido AS "Salário Liquído"
	;
END $$

DELIMITER ;

CALL calculaHolerit(40, 160);

