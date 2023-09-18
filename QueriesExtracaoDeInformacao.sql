#Consulta de Dados do Delivery Center

# 1- Qual o número de hubs por cidade?

#Query criada por mim

SELECT hub_city, COUNT(*) AS total_hubs
FROM hubs
GROUP BY hub_city
ORDER BY total_hubs DESC;

#Query criada pelo Curso

SELECT hub_city, COUNT(hub_name) AS contagem
FROM exec4.hubs
GROUP BY hub_city
ORDER BY contagem DESC;

# 2- Qual o número de pedidos (orders) por status?

#Query criado por min

SELECT order_status, COUNT(order_id) AS numero_pedidos
FROM orders
GROUP BY order_status;

#Query criada pelo Curso

SELECT order_status, COUNT(order_id) AS num_pedidos
FROM exec4.orders
GROUP BY order_status;


# 3- Qual o número de lojas (stores) por cidade dos hubs?

#Query criado por min

SELECT H.hub_city, COUNT(store_id) AS num_lojas
FROM hubs AS H
INNER JOIN stores AS S
USING (hub_id)
GROUP BY hub_city
ORDER BY num_lojas DESC;

#Query criada pelo Curso 

SELECT hub_city, COUNT(store_id) AS num_lojas
FROM exec4.hubs hubs, exec4.stores stores
WHERE hubs.hub_id = stores.hub_id
GROUP BY hub_city
ORDER BY num_lojas DESC;

# 4- Qual o maior e o menor valor de pagamento (payment_amount) registrado?

#Query criado por min

SELECT MAX(payment_amount) AS  maior_pagamento, MIN(payment_amount) AS menor_pagamento
FROM payments;

#Query criada pelo Curso

SELECT MAX(payment_amount) FROM exec4.payments;
SELECT MIN(payment_amount) FROM exec4.payments;

# 5- Qual tipo de driver (driver_type) fez o maior número de entregas?

#Query criado por min
#Está query mostra qual tipo de driver fez o maior número de entregas finalizadas

SELECT driver_type, COUNT(delivery_id) AS num_entregas_finalizadas
FROM deliveries d
JOIN drivers dr 
USING(driver_id)
WHERE d.delivery_status = 'DELIVERED'
GROUP BY driver_type
ORDER BY num_entregasnum_entregas_realizadas DESC;

#Está query mostra qual tipo de driver fez o maior número de entregas finalizadas

SELECT driver_type, COUNT(delivery_id) AS num_entregas_emAndatamento
FROM deliveries d
JOIN drivers dr 
USING(driver_id)
WHERE d.delivery_status = 'DELIVERING'
GROUP BY driver_type
ORDER BY num_entregas_emAndatamento DESC;

#Está query traz o número total de entregas por driver

SELECT driver_type, COUNT(delivery_id) AS num_entregas
FROM deliveries d
JOIN drivers dr 
USING(driver_id)
WHERE d.delivery_status = 'DELIVERED' or d.delivery_status = 'DELIVERING'
GROUP BY driver_type
ORDER BY num_entregas DESC;

#Query criada pelo Curso

SELECT driver_type, COUNT(delivery_id) AS num_entregas
FROM exec4.deliveries deliveries, exec4.drivers drivers
WHERE drivers.driver_id = deliveries.driver_id
GROUP BY driver_type
ORDER BY num_entregas DESC;

# 6- Qual a distância média das entregas por modo de driver (driver_modal)?

#Query criado por min

SELECT driver_modal, ROUND(AVG(delivery_distance_meters),2) AS distancia_media
FROM deliveries d
JOIN drivers dr
USING(driver_id)
GROUP BY driver_modal
ORDER BY distancia_media DESC;

#Query criada pelo Curso

SELECT driver_modal, ROUND(AVG(delivery_distance_meters),2) AS distancia_media
FROM exec4.deliveries deliveries, exec4.drivers drivers
WHERE drivers.driver_id = deliveries.driver_id
GROUP BY driver_modal;

#7- Qual a média de valor de pedido (order_amount) por loja, em ordem decrescente?

#Query criado por min

SELECT store_name, ROUND(AVG(order_amount),2) AS media_valor_pedido
FROM stores
JOIN orders 
USING(store_id)
GROUP BY store_name
ORDER BY media_valor_pedido DESC;

#Query criada pelo Curso

SELECT store_name, ROUND(AVG(order_amount),2) AS media_pedido
FROM exec4.orders orders, exec4.stores stores
WHERE stores.store_id = orders.store_id
GROUP BY store_name
ORDER BY media_pedido DESC;

