USE classicmodels;

-- 특정 컬럼이 NULL인 데이터만 조회하기
SELECT * FROM orders WHERE comments IS NULL;

-- 특정 컬럼이 NULL인 아닌 데이터만 조회하기
SELECT * FROM orders WHERE comments IS NOT NULL;

-- 데이터 정렬해서 조회하기 내림차순(Desending)
SELECT * FROM payments p WHERE amount >=70000 ORDER BY amount DESC;

-- 데이터 정렬해서 조회하기 오름차순(Ascending) & 내림차순(Desending)
SELECT * FROM employees e ORDER BY officeCode ASC , reportsTo DESC ;

-- 테이블 합치기 1 -payments 데이터가 존재하는 것만 조회 
SELECT c.customerNumber, c.customerName, p.paymentDate, p.amount 
FROM customers c 
	INNER JOIN payments p 
	ON c.customerNumber = p.customerNumber 
WHERE c.customerNumber IN ('223', '227', '237', '321') ;

-- 테이블 합치기 2 - payments 데이터가 존재지 않아도 조회 
SELECT c.customerNumber, c.customerName, p.paymentDate, p.amount
FROM customers c 
	LEFT OUTER JOIN payments p 
	ON c.customerNumber = p.customerNumber
WHERE c.customerNumber IN ('223', '227', '237', '321') ;
