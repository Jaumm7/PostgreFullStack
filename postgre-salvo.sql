CREATE TABLE client (
	id_cliente BIGSERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	sobrenome VARCHAR(255) NOT NULL,
	email VARCHAR(255) UNIQUE,
	telefone VARCHAR(20),
	criado_em TIMESTAMPTZ NOT NULL DEFAULT now()
);

INSERT INTO client (
    nome,
    sobrenome,
    email,
    telefone
)
VALUES
    ('Ana', 'Silva', 'ana.silva@email.com', '21999990001'),
    ('Bruno', 'Santos', 'bruno.santos@email.com', '21999990002'),
    ('Carlos', 'Oliveira', 'carlos.oliveira@email.com', '21999990003'),
    ('Daniela', 'Souza', 'daniela.souza@email.com', '21999990004'),
    ('Eduardo', 'Pereira', 'eduardo.pereira@email.com', '21999990005'),
    ('Fernanda', 'Costa', 'fernanda.costa@email.com', '21999990006'),
    ('Gabriel', 'Rodrigues', 'gabriel.rodrigues@email.com', '21999990007'),
    ('Helena', 'Almeida', 'helena.almeida@email.com', '21999990008'),
    ('Igor', 'Nascimento', 'igor.nascimento@email.com', '21999990009'),
    ('Juliana', 'Lima', 'juliana.lima@email.com', '21999990010'),
    ('Lucas', 'Araujo', 'lucas.araujo@email.com', '21999990011'),
    ('Mariana', 'Fernandes', 'mariana.fernandes@email.com', '21999990012'),
    ('Nicolas', 'Carvalho', 'nicolas.carvalho@email.com', '21999990013'),
    ('Patricia', 'Gomes', 'patricia.gomes@email.com', '21999990014'),
    ('Rafael', 'Martins', 'rafael.martins@email.com', '21999990015'),
    ('Sabrina', 'Ribeiro', 'sabrina.ribeiro@email.com', '21999990016'),
    ('Thiago', 'Barbosa', 'thiago.barbosa@email.com', '21999990017'),
    ('Vanessa', 'Rocha', 'vanessa.rocha@email.com', '21999990018'),
    ('William', 'Dias', 'william.dias@email.com', '21999990019'),
    ('Aline', 'Teixeira', 'aline.teixeira@email.com', '21999990020'),
    ('Anderson', 'Moura', 'anderson.moura@email.com', '21999990021'),
    ('Beatriz', 'Freitas', 'beatriz.freitas@email.com', '21999990022'),
    ('Caio', 'Mendes', 'caio.mendes@email.com', '21999990023'),
    ('Camila', 'Cardoso', 'camila.cardoso@email.com', '21999990024'),
    ('Diego', 'Ramos', 'diego.ramos@email.com', '21999990025'),
    ('Elaine', 'Moreira', 'elaine.moreira@email.com', '21999990026'),
    ('Felipe', 'Vieira', 'felipe.vieira@email.com', '21999990027'),
    ('Giovana', 'Monteiro', 'giovana.monteiro@email.com', '21999990028'),
    ('Henrique', 'Medeiros', 'henrique.medeiros@email.com', '21999990029'),
    ('Isabela', 'Cavalcanti', 'isabela.cavalcanti@email.com', '21999990030'),
    ('Joao', 'Correia', 'joao.correia@email.com', '21999990031'),
    ('Karen', 'Macedo', 'karen.macedo@email.com', '21999990032'),
    ('Leonardo', 'Tavares', 'leonardo.tavares@email.com', '21999990033'),
    ('Leticia', 'Pinto', 'leticia.pinto@email.com', '21999990034'),
    ('Marcelo', 'Farias', 'marcelo.farias@email.com', '21999990035'),
    ('Natalia', 'Borges', 'natalia.borges@email.com', '21999990036'),
    ('Otavio', 'Siqueira', 'otavio.siqueira@email.com', '21999990037'),
    ('Paula', 'Coelho', 'paula.coelho@email.com', '21999990038'),
    ('Renato', 'Guimaraes', 'renato.guimaraes@email.com', '21999990039'),
    ('Sara', 'Batista', 'sara.batista@email.com', '21999990040'),
    ('Andre', 'Duarte', 'andre.duarte@email.com', '21999990041'),
    ('Bianca', 'Nogueira', 'bianca.nogueira@email.com', '21999990042'),
    ('Cristiano', 'Leite', 'cristiano.leite@email.com', '21999990043'),
    ('Debora', 'Vasconcelos', 'debora.vasconcelos@email.com', '21999990044'),
    ('Enzo', 'Rezende', 'enzo.rezende@email.com', '21999990045'),
    ('Flavia', 'Pires', 'flavia.pires@email.com', '21999990046'),
    ('Gustavo', 'Cunha', 'gustavo.cunha@email.com', '21999990047'),
    ('Larissa', 'Queiroz', 'larissa.queiroz@email.com', '21999990048'),
    ('Matheus', 'Campos', 'matheus.campos@email.com', '21999990049'),
    ('Roberta', 'Andrade', 'roberta.andrade@email.com', '21999990050');

SELECT * FROM client; 



