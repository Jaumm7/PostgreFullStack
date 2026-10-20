SELECT 
	p.id_pedido,
	c.nome
FROM pedidos p
LEFT JOIN clientes c
	ON c.id_cliente = p.id_cliente;

COMMIT;

	