/*
 * Tarefa: Jun��es e Relacionamentos
 * Autor: Issufo Gulamo
 * Data: 2025-09-06
 *
 * Objetivo: Praticar INNER JOIN, LEFT JOIN e RIGHT JOIN,
 * explorando como unir dados de m�ltiplas tabelas.
 */

-- Pergunta 1: Obter nome, sobrenome, e-mail e c�digo do escrit�rio de todos os funcion�rios.
-- Use um INNER JOIN para combinar a tabela de funcion�rios com a tabela de escrit�rios.

/*
 * Explica��o:
 * O INNER JOIN retorna apenas as linhas onde h� uma correspond�ncia de valores
 * na coluna 'officeCode' em ambas as tabelas (employees e offices).
 * Isso garante que a consulta retorne apenas funcion�rios que t�m um
 * escrit�rio associado, e escrit�rios que t�m um funcion�rio associado.
 */
SELECT
  E.firstName,
  E.lastName,
  E.email,
  O.officeCode
FROM employees AS E
INNER JOIN offices AS O
  ON E.officeCode = O.officeCode;


-- Pergunta 2: Obter productName, productVendor e productLine da tabela products.
-- Use um LEFT JOIN para combinar a tabela products com a tabela productlines.

/*
 * Explica��o:
 * O LEFT JOIN retorna todas as linhas da tabela da esquerda (products) e as
 * linhas correspondentes da tabela da direita (productlines). Se um produto
 * n�o tiver uma linha de produto correspondente, os valores da coluna
 * productLine ser�o NULL.
 */
SELECT
  P.productName,
  P.productVendor,
  PL.productLine
FROM products AS P
LEFT JOIN productlines AS PL
  ON P.productLine = PL.productLine;


-- Pergunta 3: Recuperar orderDate, shipmentDate, status e customerNumber dos primeiros 10 pedidos.
-- Use um RIGHT JOIN para combinar a tabela customers com a tabela orders.

/*
 * Explica��o:
 * O RIGHT JOIN retorna todas as linhas da tabela da direita (orders) e as
 * linhas correspondentes da tabela da esquerda (customers). Ele � �til para
 * garantir que todos os pedidos sejam inclu�dos no resultado, mesmo que
 * n�o haja um cliente correspondente na tabela customers.
 * O LIMIT 10 restringe o resultado aos 10 primeiros registros.
 */
SELECT
  O.orderDate,
  O.shippedDate,
  O.status,
  C.customerNumber
FROM customers AS C
RIGHT JOIN orders AS O
  ON C.customerNumber = O.customerNumber
LIMIT 10;