USE db_procedures;

DELIMITER $$
CREATE PROCEDURE tabuada_do (IN numero INTEGER UNSIGNED)
	BEGIN
		DECLARE contador INTEGER UNSIGNED;
		SET contador := 1;

		CREATE TEMPORARY TABLE db_procedures.tabuada (
			id TINYINT UNSIGNED AUTO_INCREMENT,
            formula VARCHAR(7) NOT NULL,
            resultado TINYINT UNSIGNED NOT NULL,
            PRIMARY KEY(id)
		);

		WHILE contador < 11 DO
			INSERT INTO db_procedures.tabuada (formula, resultado)
				VALUES (CONCAT(numero, ' X ', contador), numero * contador);
			SET contador := contador + 1;
        END WHILE;
        
        SELECT * FROM db_procedures.tabuada;
		DROP TABLE db_procedures.tabuada;
    END $$
DELIMITER ;

CALL tabuada_do(5);