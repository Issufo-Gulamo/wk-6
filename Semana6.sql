/*
 * Tarefa: Junções e Relacionamentos
 * Autor: Issufo Gulamo
 * Data: 2025-09-06
 *
 * Objetivo: Praticar INNER JOIN, LEFT JOIN e RIGHT JOIN,
 * explorando como unir dados de múltiplas tabelas.
 */

-- Pergunta 1: Obter nome, sobrenome, e-mail e código do escritório de todos os funcionários.
-- Use um INNER JOIN para combinar a tabela de funcionários com a tabela de escritórios.

/*
 * Explicação:
 * O INNER JOIN retorna apenas as linhas onde há uma correspondência de valores
 * na coluna 'officeCode' em ambas as tabelas (employees e offices).
 * Isso garante que a consulta retorne apenas funcionários que têm um
 * escritório associado, e escritórios que têm um funcionário associado.
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
 * Explicação:
 * O LEFT JOIN retorna todas as linhas da tabela da esquerda (products) e as
 * linhas correspondentes da tabela da direita (productlines). Se um produto
 * não tiver uma linha de produto correspondente, os valores da coluna
 * productLine serão NULL.
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
 * Explicação:
 * O RIGHT JOIN retorna todas as linhas da tabela da direita (orders) e as
 * linhas correspondentes da tabela da esquerda (customers). Ele é útil para
 * garantir que todos os pedidos sejam incluídos no resultado, mesmo que
 * não haja um cliente correspondente na tabela customers.
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