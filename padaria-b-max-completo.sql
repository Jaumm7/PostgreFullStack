--
-- PostgreSQL database dump
--

\restrict imXB5Zc2QXosGkdf1ozZmUUYlDFWlHMXqje2gEZiOva2n2jlsd8hezDoj1J8dGX

-- Dumped from database version 18.2
-- Dumped by pg_dump version 18.2

-- Started on 2026-11-17 16:23:26

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 16421)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id_cliente bigint NOT NULL,
    nome character varying(255) NOT NULL,
    sobrenome character varying(255) NOT NULL,
    email character varying(255),
    telefone character varying(20),
    criado_em timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16431)
-- Name: clientes_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_id_cliente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clientes_id_cliente_seq OWNER TO postgres;

--
-- TOC entry 5056 (class 0 OID 0)
-- Dependencies: 220
-- Name: clientes_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_id_cliente_seq OWNED BY public.clientes.id_cliente;


--
-- TOC entry 221 (class 1259 OID 16432)
-- Name: itens_pedido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.itens_pedido (
    id_pedido bigint NOT NULL,
    id_produto bigint NOT NULL,
    quantidade integer NOT NULL,
    preco_unit numeric(10,2) NOT NULL,
    CONSTRAINT itens_pedido_preco_unit_check CHECK ((preco_unit >= (0)::numeric)),
    CONSTRAINT itens_pedido_quantidade_check CHECK ((quantidade > 0))
);


ALTER TABLE public.itens_pedido OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16441)
-- Name: pedidos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos (
    id_pedido bigint NOT NULL,
    id_cliente bigint NOT NULL,
    status character varying(20) DEFAULT 'aberto'::character varying NOT NULL,
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT pedidos_status_check CHECK (((status)::text = ANY (ARRAY[('aberto'::character varying)::text, ('pago'::character varying)::text, ('enviado'::character varying)::text, ('cancelado'::character varying)::text])))
);


ALTER TABLE public.pedidos OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16451)
-- Name: pedidos_id_pedido_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pedidos_id_pedido_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pedidos_id_pedido_seq OWNER TO postgres;

--
-- TOC entry 5057 (class 0 OID 0)
-- Dependencies: 223
-- Name: pedidos_id_pedido_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedidos_id_pedido_seq OWNED BY public.pedidos.id_pedido;


--
-- TOC entry 224 (class 1259 OID 16452)
-- Name: produtos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produtos (
    id_produto bigint NOT NULL,
    nome character varying(255) NOT NULL,
    preco numeric(10,2) NOT NULL,
    estoque integer DEFAULT 0 NOT NULL,
    ativo boolean DEFAULT true NOT NULL,
    criado_em timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT produtos_estoque_check CHECK ((estoque >= 0)),
    CONSTRAINT produtos_preco_check CHECK ((preco >= (0)::numeric))
);


ALTER TABLE public.produtos OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16466)
-- Name: produtos_id_produto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produtos_id_produto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.produtos_id_produto_seq OWNER TO postgres;

--
-- TOC entry 5058 (class 0 OID 0)
-- Dependencies: 225
-- Name: produtos_id_produto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produtos_id_produto_seq OWNED BY public.produtos.id_produto;


--
-- TOC entry 4870 (class 2604 OID 16467)
-- Name: clientes id_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id_cliente SET DEFAULT nextval('public.clientes_id_cliente_seq'::regclass);


--
-- TOC entry 4872 (class 2604 OID 16468)
-- Name: pedidos id_pedido; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos ALTER COLUMN id_pedido SET DEFAULT nextval('public.pedidos_id_pedido_seq'::regclass);


--
-- TOC entry 4875 (class 2604 OID 16469)
-- Name: produtos id_produto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos ALTER COLUMN id_produto SET DEFAULT nextval('public.produtos_id_produto_seq'::regclass);


--
-- TOC entry 5044 (class 0 OID 16421)
-- Dependencies: 219
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id_cliente, nome, sobrenome, email, telefone, criado_em) FROM stdin;
1	Ana	Silva 01	cliente01@loja.com	11990000001	2026-09-20 20:08:20.250683-03
2	Bruno	Lima 02	cliente02@loja.com	11990000002	2026-09-21 20:08:20.250683-03
3	Carla	Souza 03	cliente03@loja.com	11990000003	2026-09-22 20:08:20.250683-03
4	Diego	Santos 04	cliente04@loja.com	11990000004	2026-09-23 20:08:20.250683-03
5	Elisa	Oliveira 05	cliente05@loja.com	11990000005	2026-09-24 20:08:20.250683-03
6	Felipe	Costa 06	cliente06@loja.com	11990000006	2026-09-25 20:08:20.250683-03
7	Gabriela	Rocha 07	cliente07@loja.com	11990000007	2026-09-26 20:08:20.250683-03
8	Henrique	Martins 08	cliente08@loja.com	11990000008	2026-09-27 20:08:20.250683-03
9	Isabela	Ferreira 09	cliente09@loja.com	11990000009	2026-09-28 20:08:20.250683-03
10	Joao	Almeida 10	cliente10@loja.com	11990000010	2026-09-29 20:08:20.250683-03
11	Ana	Silva 11	cliente11@loja.com	11990000011	2026-09-30 20:08:20.250683-03
12	Bruno	Lima 12	cliente12@loja.com	11990000012	2026-10-01 20:08:20.250683-03
13	Carla	Souza 13	cliente13@loja.com	11990000013	2026-10-02 20:08:20.250683-03
14	Diego	Santos 14	cliente14@loja.com	11990000014	2026-10-03 20:08:20.250683-03
15	Elisa	Oliveira 15	cliente15@loja.com	11990000015	2026-10-04 20:08:20.250683-03
16	Felipe	Costa 16	cliente16@loja.com	11990000016	2026-10-05 20:08:20.250683-03
17	Gabriela	Rocha 17	cliente17@loja.com	11990000017	2026-10-06 20:08:20.250683-03
18	Henrique	Martins 18	cliente18@loja.com	11990000018	2026-10-07 20:08:20.250683-03
19	Isabela	Ferreira 19	cliente19@loja.com	11990000019	2026-10-08 20:08:20.250683-03
20	Joao	Almeida 20	cliente20@loja.com	11990000020	2026-10-09 20:08:20.250683-03
21	Ana	Silva 21	cliente21@loja.com	11990000021	2026-10-10 20:08:20.250683-03
22	Bruno	Lima 22	cliente22@loja.com	11990000022	2026-10-11 20:08:20.250683-03
23	Carla	Souza 23	cliente23@loja.com	11990000023	2026-10-12 20:08:20.250683-03
24	Diego	Santos 24	cliente24@loja.com	11990000024	2026-10-13 20:08:20.250683-03
25	Elisa	Oliveira 25	cliente25@loja.com	11990000025	2026-10-14 20:08:20.250683-03
26	Felipe	Costa 26	cliente26@loja.com	11990000026	2026-10-15 20:08:20.250683-03
27	Gabriela	Rocha 27	cliente27@loja.com	11990000027	2026-10-16 20:08:20.250683-03
28	Henrique	Martins 28	cliente28@loja.com	11990000028	2026-10-17 20:08:20.250683-03
29	Isabela	Ferreira 29	cliente29@loja.com	11990000029	2026-10-18 20:08:20.250683-03
30	Joao	Almeida 30	cliente30@loja.com	11990000030	2026-10-19 20:08:20.250683-03
\.


--
-- TOC entry 5046 (class 0 OID 16432)
-- Dependencies: 221
-- Data for Name: itens_pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.itens_pedido (id_pedido, id_produto, quantidade, preco_unit) FROM stdin;
1	1	1	79.90
2	2	2	189.90
3	3	3	899.00
4	4	4	3499.90
5	5	5	219.90
6	6	1	249.90
7	7	2	69.90
8	8	3	329.90
9	9	4	1299.90
10	10	5	749.90
11	11	1	299.90
12	12	2	159.90
13	13	3	39.90
14	14	4	89.90
15	15	5	319.90
16	16	1	59.90
17	17	2	449.90
18	18	3	129.90
19	19	4	119.90
20	20	5	99.90
21	21	1	279.90
22	22	2	239.90
23	23	3	1899.90
24	24	4	69.90
25	25	5	199.90
26	26	1	149.90
27	27	2	49.90
28	28	3	29.90
29	29	4	24.90
30	30	5	179.90
\.


--
-- TOC entry 5047 (class 0 OID 16441)
-- Dependencies: 222
-- Data for Name: pedidos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedidos (id_pedido, id_cliente, status, criado_em) FROM stdin;
1	1	aberto	2026-09-20 20:08:20.250683-03
2	2	pago	2026-09-21 20:08:20.250683-03
3	3	enviado	2026-09-22 20:08:20.250683-03
4	4	cancelado	2026-09-23 20:08:20.250683-03
5	5	aberto	2026-09-24 20:08:20.250683-03
6	6	pago	2026-09-25 20:08:20.250683-03
7	7	enviado	2026-09-26 20:08:20.250683-03
8	8	cancelado	2026-09-27 20:08:20.250683-03
9	9	aberto	2026-09-28 20:08:20.250683-03
10	10	pago	2026-09-29 20:08:20.250683-03
11	11	enviado	2026-09-30 20:08:20.250683-03
12	12	cancelado	2026-10-01 20:08:20.250683-03
13	13	aberto	2026-10-02 20:08:20.250683-03
14	14	pago	2026-10-03 20:08:20.250683-03
15	15	enviado	2026-10-04 20:08:20.250683-03
16	16	cancelado	2026-10-05 20:08:20.250683-03
17	17	aberto	2026-10-06 20:08:20.250683-03
18	18	pago	2026-10-07 20:08:20.250683-03
19	19	enviado	2026-10-08 20:08:20.250683-03
20	20	cancelado	2026-10-09 20:08:20.250683-03
21	21	aberto	2026-10-10 20:08:20.250683-03
22	22	pago	2026-10-11 20:08:20.250683-03
23	23	enviado	2026-10-12 20:08:20.250683-03
24	24	cancelado	2026-10-13 20:08:20.250683-03
25	25	aberto	2026-10-14 20:08:20.250683-03
26	26	pago	2026-10-15 20:08:20.250683-03
27	27	enviado	2026-10-16 20:08:20.250683-03
28	28	cancelado	2026-10-17 20:08:20.250683-03
29	29	aberto	2026-10-18 20:08:20.250683-03
30	30	pago	2026-10-19 20:08:20.250683-03
\.


--
-- TOC entry 5049 (class 0 OID 16452)
-- Dependencies: 224
-- Data for Name: produtos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produtos (id_produto, nome, preco, estoque, ativo, criado_em) FROM stdin;
1	Mouse sem fio	79.90	90	t	2026-09-20 20:08:20.250683-03
2	Teclado mecanico	189.90	45	t	2026-09-21 20:08:20.250683-03
3	Monitor 24 polegadas	899.00	25	t	2026-09-22 20:08:20.250683-03
4	Notebook 15 polegadas	3499.90	12	t	2026-09-23 20:08:20.250683-03
5	Webcam Full HD	219.90	38	t	2026-09-24 20:08:20.250683-03
6	Headset USB	249.90	42	t	2026-09-25 20:08:20.250683-03
7	Pen drive 64 GB	69.90	120	t	2026-09-26 20:08:20.250683-03
8	SSD 480 GB	329.90	55	t	2026-09-27 20:08:20.250683-03
9	Cadeira gamer	1299.90	18	t	2026-09-28 20:08:20.250683-03
10	Impressora tanque	749.90	20	t	2026-09-29 20:08:20.250683-03
11	Roteador Wi-Fi	299.90	36	t	2026-09-30 20:08:20.250683-03
12	Caixa de som	159.90	64	t	2026-10-01 20:08:20.250683-03
13	Cabo HDMI 2 m	39.90	140	t	2026-10-02 20:08:20.250683-03
14	Adaptador USB-C	89.90	75	t	2026-10-03 20:08:20.250683-03
15	Microfone USB	319.90	30	t	2026-10-04 20:08:20.250683-03
16	Mousepad grande	59.90	110	t	2026-10-05 20:08:20.250683-03
17	HD externo 1 TB	449.90	32	t	2026-10-06 20:08:20.250683-03
18	Suporte para notebook	129.90	50	t	2026-10-07 20:08:20.250683-03
19	Hub USB 4 portas	119.90	67	t	2026-10-08 20:08:20.250683-03
20	Luminaria LED	99.90	80	t	2026-10-09 20:08:20.250683-03
21	Fonte notebook	279.90	22	t	2026-10-10 20:08:20.250683-03
22	Memoria RAM 8 GB	239.90	48	t	2026-10-11 20:08:20.250683-03
23	Placa de video	1899.90	10	t	2026-10-12 20:08:20.250683-03
24	Filtro de linha	69.90	100	t	2026-10-13 20:08:20.250683-03
25	Mochila para notebook	199.90	40	t	2026-10-14 20:08:20.250683-03
26	Base refrigerada	149.90	33	t	2026-10-15 20:08:20.250683-03
27	Leitor de cartao	49.90	86	t	2026-10-16 20:08:20.250683-03
28	Cabo de rede 5 m	29.90	150	t	2026-10-17 20:08:20.250683-03
29	Organizador de cabos	24.90	200	f	2026-10-18 20:08:20.250683-03
30	Suporte para monitor	179.90	27	t	2026-10-19 20:08:20.250683-03
\.


--
-- TOC entry 5059 (class 0 OID 0)
-- Dependencies: 220
-- Name: clientes_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_cliente_seq', 30, true);


--
-- TOC entry 5060 (class 0 OID 0)
-- Dependencies: 223
-- Name: pedidos_id_pedido_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedidos_id_pedido_seq', 30, true);


--
-- TOC entry 5061 (class 0 OID 0)
-- Dependencies: 225
-- Name: produtos_id_produto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produtos_id_produto_seq', 30, true);


--
-- TOC entry 4885 (class 2606 OID 16471)
-- Name: clientes clientes_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key UNIQUE (email);


--
-- TOC entry 4887 (class 2606 OID 16473)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id_cliente);


--
-- TOC entry 4889 (class 2606 OID 16475)
-- Name: itens_pedido itens_pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itens_pedido
    ADD CONSTRAINT itens_pedido_pkey PRIMARY KEY (id_pedido, id_produto);


--
-- TOC entry 4891 (class 2606 OID 16477)
-- Name: pedidos pedidos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_pkey PRIMARY KEY (id_pedido);


--
-- TOC entry 4893 (class 2606 OID 16479)
-- Name: produtos produtos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (id_produto);


--
-- TOC entry 4894 (class 2606 OID 16480)
-- Name: itens_pedido itens_pedido_id_pedido_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itens_pedido
    ADD CONSTRAINT itens_pedido_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES public.pedidos(id_pedido) ON DELETE CASCADE;


--
-- TOC entry 4895 (class 2606 OID 16485)
-- Name: itens_pedido itens_pedido_id_produto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itens_pedido
    ADD CONSTRAINT itens_pedido_id_produto_fkey FOREIGN KEY (id_produto) REFERENCES public.produtos(id_produto);


--
-- TOC entry 4896 (class 2606 OID 16490)
-- Name: pedidos pedidos_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente);


-- Completed on 2026-11-17 16:23:26

--
-- PostgreSQL database dump complete
--

\unrestrict imXB5Zc2QXosGkdf1ozZmUUYlDFWlHMXqje2gEZiOva2n2jlsd8hezDoj1J8dGX



-- ============================================================
-- COMPLEMENTO DO PROJETO: CATEGORIAS, FORNECEDORES E CONSULTAS
-- Este bloco completa a estrutura e os dados do banco existente.
-- ============================================================

-- 1. CATEGORIAS (5 registros)
CREATE TABLE public.categorias (
    id_categoria BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    descricao TEXT
);

INSERT INTO public.categorias (nome, descricao) VALUES
('Perifericos', 'Mouses, teclados, webcams, headsets e acessorios'),
('Armazenamento', 'SSDs, HDs, pen drives e cartoes'),
('Monitores e suportes', 'Monitores, suportes e acessorios de tela'),
('Computadores e componentes', 'Notebooks, memoria, placas e fontes'),
('Acessorios e conectividade', 'Cabos, adaptadores, rede, audio e energia');

ALTER TABLE public.produtos
    ADD COLUMN id_categoria BIGINT;

UPDATE public.produtos
SET id_categoria = CASE
    WHEN id_produto IN (1, 2, 5, 6, 15, 16) THEN 1
    WHEN id_produto IN (7, 8, 17, 27) THEN 2
    WHEN id_produto IN (3, 9, 30) THEN 3
    WHEN id_produto IN (4, 21, 22, 23, 26) THEN 4
    ELSE 5
END;

ALTER TABLE public.produtos
    ALTER COLUMN id_categoria SET NOT NULL;

ALTER TABLE public.produtos
    ADD CONSTRAINT produtos_categoria_fkey
    FOREIGN KEY (id_categoria)
    REFERENCES public.categorias(id_categoria);

-- 2. FORNECEDORES (5 registros)
CREATE TABLE public.fornecedores (
    id_fornecedor BIGINT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    nome VARCHAR(150) NOT NULL UNIQUE,
    email VARCHAR(255),
    telefone VARCHAR(20)
);

INSERT INTO public.fornecedores (nome, email, telefone) VALUES
('Tech Distribuidora', 'contato@techdistribuidora.com', '1130001001'),
('Mundo Digital', 'vendas@mundodigital.com', '1130001002'),
('Eletronicos Brasil', 'comercial@eletronicosbrasil.com', '1130001003'),
('Conecta Informatica', 'atendimento@conectainformatica.com', '1130001004'),
('Prime Componentes', 'vendas@primecomponentes.com', '1130001005');

-- 3. RELACIONAMENTO N:N ENTRE PRODUTOS E FORNECEDORES
-- O preco_compra representa o preco cobrado pelo fornecedor.
CREATE TABLE public.produtos_fornecedores (
    id_produto BIGINT NOT NULL,
    id_fornecedor BIGINT NOT NULL,
    preco_compra NUMERIC(10,2) NOT NULL CHECK (preco_compra >= 0),
    PRIMARY KEY (id_produto, id_fornecedor),
    CONSTRAINT produtos_fornecedores_produto_fkey
        FOREIGN KEY (id_produto) REFERENCES public.produtos(id_produto)
        ON DELETE CASCADE,
    CONSTRAINT produtos_fornecedores_fornecedor_fkey
        FOREIGN KEY (id_fornecedor) REFERENCES public.fornecedores(id_fornecedor)
        ON DELETE CASCADE
);

-- Cada produto recebe ao menos um fornecedor.
-- O produto 1 (Mouse sem fio) possui tres fornecedores.
INSERT INTO public.produtos_fornecedores
    (id_produto, id_fornecedor, preco_compra)
SELECT
    p.id_produto,
    ((p.id_produto - 1) % 5) + 1,
    ROUND(p.preco * 0.70, 2)
FROM public.produtos p;

INSERT INTO public.produtos_fornecedores
    (id_produto, id_fornecedor, preco_compra)
VALUES
(1, 2, 49.90),
(1, 3, 52.50);

-- Alguns produtos possuem mais de uma opcao de fornecedor.
INSERT INTO public.produtos_fornecedores
    (id_produto, id_fornecedor, preco_compra)
SELECT
    p.id_produto,
    ((p.id_produto + 1) % 5) + 1,
    ROUND(p.preco * 0.74, 2)
FROM public.produtos p
WHERE p.id_produto IN (2, 3, 4, 5, 8, 10, 15, 20);

-- 4. AJUSTES PARA DEMONSTRAR AS CONSULTAS
-- Os pedidos 29 e 30 ficam com clientes que ja possuem pedidos,
-- deixando os clientes 29 e 30 sem pedidos para a consulta correspondente.
UPDATE public.pedidos SET id_cliente = 1 WHERE id_pedido = 29;
UPDATE public.pedidos SET id_cliente = 2 WHERE id_pedido = 30;

-- Os produtos 29 e 30 ficam sem vendas, para a consulta correspondente.
-- Remapeia os itens originais desses dois pedidos para produtos ja existentes.
UPDATE public.itens_pedido
SET id_produto = 1
WHERE id_pedido = 29 AND id_produto = 29;

UPDATE public.itens_pedido
SET id_produto = 2
WHERE id_pedido = 30 AND id_produto = 30;

-- Garante pelo menos tres produtos diferentes em cada pedido.
-- Os dois itens adicionais sao gerados usando produtos de 1 a 28.
INSERT INTO public.itens_pedido (id_pedido, id_produto, quantidade, preco_unit)
SELECT
    p.id_pedido,
    ((p.id_pedido - 1 + v.deslocamento) % 28) + 1,
    (p.id_pedido % 3) + 1,
    pr.preco
FROM public.pedidos p
CROSS JOIN (VALUES (7), (14)) AS v(deslocamento)
JOIN public.produtos pr
  ON pr.id_produto = ((p.id_pedido - 1 + v.deslocamento) % 28) + 1
WHERE NOT EXISTS (
    SELECT 1
    FROM public.itens_pedido ip
    WHERE ip.id_pedido = p.id_pedido
      AND ip.id_produto = ((p.id_pedido - 1 + v.deslocamento) % 28) + 1
);

-- 5. CONSULTAS SOLICITADAS

-- 5.1 Clientes que ainda nao fizeram pedidos
SELECT c.id_cliente, c.nome, c.sobrenome
FROM public.clientes c
LEFT JOIN public.pedidos p ON p.id_cliente = c.id_cliente
WHERE p.id_pedido IS NULL
ORDER BY c.id_cliente;

-- 5.2 Produtos que nunca foram vendidos
SELECT pr.id_produto, pr.nome, pr.preco
FROM public.produtos pr
LEFT JOIN public.itens_pedido ip ON ip.id_produto = pr.id_produto
WHERE ip.id_produto IS NULL
ORDER BY pr.id_produto;

-- 5.3 Total gasto por cliente (considerando pedidos pagos ou enviados)
SELECT
    c.id_cliente,
    c.nome,
    c.sobrenome,
    COALESCE(SUM(ip.quantidade * ip.preco_unit), 0) AS total_gasto
FROM public.clientes c
LEFT JOIN public.pedidos p
       ON p.id_cliente = c.id_cliente
      AND p.status IN ('pago', 'enviado')
LEFT JOIN public.itens_pedido ip ON ip.id_pedido = p.id_pedido
GROUP BY c.id_cliente, c.nome, c.sobrenome
ORDER BY total_gasto DESC;

-- 5.4 Ticket medio dos pedidos pagos ou enviados
SELECT
    ROUND(AVG(total_pedido), 2) AS ticket_medio
FROM (
    SELECT
        p.id_pedido,
        SUM(ip.quantidade * ip.preco_unit) AS total_pedido
    FROM public.pedidos p
    JOIN public.itens_pedido ip ON ip.id_pedido = p.id_pedido
    WHERE p.status IN ('pago', 'enviado')
    GROUP BY p.id_pedido
) AS totais;

-- 5.5 Cinco produtos mais vendidos (por quantidade)
SELECT
    pr.id_produto,
    pr.nome,
    SUM(ip.quantidade) AS quantidade_vendida
FROM public.produtos pr
JOIN public.itens_pedido ip ON ip.id_produto = pr.id_produto
JOIN public.pedidos p ON p.id_pedido = ip.id_pedido
WHERE p.status IN ('pago', 'enviado')
GROUP BY pr.id_produto, pr.nome
ORDER BY quantidade_vendida DESC, pr.nome
LIMIT 5;

-- 5.6 Vendas por categoria (pedidos pagos ou enviados)
SELECT
    c.id_categoria,
    c.nome AS categoria,
    COALESCE(SUM(ip.quantidade * ip.preco_unit), 0) AS total_vendido
FROM public.categorias c
LEFT JOIN public.produtos pr ON pr.id_categoria = c.id_categoria
LEFT JOIN public.itens_pedido ip ON ip.id_produto = pr.id_produto
LEFT JOIN public.pedidos p
       ON p.id_pedido = ip.id_pedido
      AND p.status IN ('pago', 'enviado')
GROUP BY c.id_categoria, c.nome
ORDER BY total_vendido DESC;

-- 5.7 Fornecedor com menor preco de compra por produto
SELECT DISTINCT ON (pr.id_produto)
    pr.id_produto,
    pr.nome AS produto,
    f.nome AS fornecedor,
    pf.preco_compra
FROM public.produtos pr
JOIN public.produtos_fornecedores pf ON pf.id_produto = pr.id_produto
JOIN public.fornecedores f ON f.id_fornecedor = pf.id_fornecedor
ORDER BY pr.id_produto, pf.preco_compra ASC, f.nome;

-- 6. TESTES DE TRANSACAO E INTEGRIDADE
-- Os testes abaixo usam uma transacao que termina em ROLLBACK,
-- portanto nao deixam registros de teste no banco.

BEGIN;

-- Teste de INSERT e ROLLBACK.
INSERT INTO public.pedidos (id_cliente, status)
VALUES (1, 'aberto')
RETURNING id_pedido;

-- Teste de ON DELETE CASCADE:
-- ao apagar o pedido de teste, seus itens devem ser apagados automaticamente.
-- O bloco DO localiza o pedido de teste criado nesta transacao.
DO $$
DECLARE
    v_id_pedido BIGINT;
BEGIN
    SELECT MAX(id_pedido)
      INTO v_id_pedido
      FROM public.pedidos
     WHERE id_cliente = 1
       AND status = 'aberto';

    IF v_id_pedido IS NOT NULL THEN
        INSERT INTO public.itens_pedido (id_pedido, id_produto, quantidade, preco_unit)
        VALUES (v_id_pedido, 1, 1, (SELECT preco FROM public.produtos WHERE id_produto = 1));

        DELETE FROM public.pedidos WHERE id_pedido = v_id_pedido;

        RAISE NOTICE 'Pedido de teste excluido; itens relacionados devem ter sido excluidos por CASCADE.';
    END IF;
END $$;

ROLLBACK;

-- Teste de COMMIT usando tabela temporaria, sem alterar os dados permanentes.
CREATE TEMP TABLE teste_commit (mensagem TEXT);
BEGIN;
INSERT INTO teste_commit (mensagem) VALUES ('COMMIT executado com sucesso');
COMMIT;
SELECT * FROM teste_commit;
DROP TABLE teste_commit;

-- Teste real de violacao de chave estrangeira.
-- O erro e capturado para que a execucao do arquivo continue normalmente.
DO $$
BEGIN
    INSERT INTO public.pedidos (id_cliente, status)
    VALUES (999999, 'aberto');
EXCEPTION
    WHEN foreign_key_violation THEN
        RAISE NOTICE 'Teste OK: a chave estrangeira impediu pedido com cliente inexistente.';
END $$;

-- FIM DO COMPLEMENTO
