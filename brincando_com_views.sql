SELECT numero, nome, ativo
FROM banco;

CREATE OR REPLACE VIEW vw_bancos AS (
	SELECT numero, nome, ativo
	FROM banco
);

SELECT numero, nome, ativo
FROM vw_bancos;

CREATE OR REPLACE VIEW vw_bancos_2 (banco_numero, banco_nome, banco_ativo) AS (
	SELECT numero, nome, ativo
	FROM banco
);

SELECT banco_numero, banco_nome, banco_ativo
FROM vw_bancos_2;

INSERT INTO vw_bancos_2 (banco_numero, banco_nome, banco_ativo)
VALUES (51, 'Boa ideia', TRUE);

SELECT banco_numero, banco_nome, banco_ativo FROM vw_bancos_2 WHERE banco_numero = 51;

UPDATE vw_bancos_2 SET banco_ativo = FALSE WHERE banco_numero = 51;

SELECT numero, nome, ativo FROM banco WHERE numero = 51;

DELETE FROM vw_bancos_2 WHERE banco_numero = 51;

CREATE OR REPLACE TEMPORARY VIEW vw_agencia AS (
	SELECT nome FROM agencia
);

SELECT nome FROM vw_agencia;

CREATE OR REPLACE VIEW vw_bancos_ativos AS(
	SELECT numero, nome, ativo
	FROM banco
	WHERE ativo IS TRUE
) WITH LOCAL CHECK OPTION;

INSERT INTO vw_bancos_ativos(numero, nome, ativo) VALUES(51, 'Boa ideia Bank', FALSE);

CREATE OR REPLACE VIEW vw_bancos_com_a AS (
	SELECT numero, nome, ativo
	FROM vw_bancos_ativos
	WHERE nome ILIKE 'a%'
) WITH CASCADED CHECK OPTION;

SELECT numero, nome, ativo FROM vw_bancos_com_a;

INSERT INTO vw_bancos_com_a (numero, nome, ativo) VALUES (48, 'Agora sim bicho Bank', TRUE );
INSERT INTO vw_bancos_com_a (numero, nome, ativo) VALUES (48, 'Agora nao bicho Bank', FALSE );