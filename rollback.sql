BEGIN;

TRUNCATE TABLE
	itens_pedido,
	pedidos,
	produtos,
	clientes
RESTART IDENTITY CASCADE

ROLLBACK;