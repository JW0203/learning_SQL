USE classicmodels;
-- order 테이블의 모든 컬럼에 대한 모든 데이터 조
SELECT * FROM orders;

-- 특정 컬럼만 조회하기
SELECT orderNumber, orderDate From orders;

-- 특정 컬럼 조회할 때 별칭 붙이기
SELECT orderNumber "order_number", orderDate "order_date" 
From orders;

-- 특정 조건을 만족하 데이터 조회하기
SELECT * FROM employees e  WHERE e.officeCode = 1;

-- 2개의 조건을 만족하는 데이터 조회하기 1
SELECT * FROM employees e WHERE e.officeCode =1 AND jobTitle = 'Sales Rep' ;

-- 2개의 조건을 만족하는 데이터 조회하기 2
SELECT * FROM employees e WHERE e.officeCode >=1 OR jobTitle = 'Sales Rep';

-- 원하는 데이터들만 골라서 뽑아내기
SELECT * FROM customers c WHERE c.customerNumber IN ('103', '114', '119', '124');

-- 특정 데이터들만 제외하고 뽑아내기 
SELECT * FROM customers c WHERE c.customerNumber IN NOT ('103', '114', '119', '124');
