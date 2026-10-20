
CREATE TABLE teste (
	id_teste BIGSERIAL PRIMARY KEY,
	nome VARCHAR(255) Not Null,
	sobrenome VARCHAR(255) Not Null,
	email VARCHAR(255) Unique,
	telefone VARCHAR(255),
	criado_em TIMESTAMPTZ NOT NULL DEFAULT now()
);

INSERT INTO teste (
    nome,
	sobrenome,
	email,
	telefone
) VALUES
('Ana', 'Silva', 'ana.silva.01@email.com', '(11) 91111-0001'),
('Bruno', 'Souza', 'bruno.souza.02@email.com', '(11) 91111-0002');

SELECT * FROM teste

SELECT nome FROM teste WHERE id_teste = 2;

TRUNCATE TABLE teste;

TRUNCATE TABLE teste RESTART IDENTITY;


