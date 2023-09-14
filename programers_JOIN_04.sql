-- 특정 기간동안 대여 가능한 자동차들의 대여비용 구하기
/*
CAR_RENTAL_COMPANY_CAR 테이블과 CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블과 CAR_RENTAL_COMPANY_DISCOUNT_PLAN 테이블에서 
자동차 종류가 '세단' 또는 'SUV' 인 자동차 중 2022년 11월 1일부터 2022년 11월 30일까지 대여 가능하고 
30일간의 대여 금액이 50만원 이상 200만원 미만인 자동차에 대해서 자동차 ID, 자동차 종류, 대여 금액(컬럼명: FEE) 리스트를 출력하는 SQL문을 작성해주세요. 
결과는 대여 금액을 기준으로 내림차순 정렬하고, 대여 금액이 같은 경우 자동차 종류를 기준으로 오름차순 정렬, 자동차 종류까지 같은 경우 자동차 ID를 기준으로 내림차순 정렬해주세요.
*/

SELECT C.CAR_ID, C.CAR_TYPE, 
    FLOOR(C.DAILY_FEE * 30 * (1 - P.DISCOUNT_RATE/100)) AS FEE
FROM CAR_RENTAL_COMPANY_CAR C
INNER JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN P 
    ON C.CAR_TYPE = P.CAR_TYPE 
    AND P.DURATION_TYPE = '30일 이상'
LEFT OUTER JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY H 
    ON C.CAR_ID = H.CAR_ID 
    AND ('2022-11-01' BETWEEN H.START_DATE AND H.END_DATE OR '2022-11-30' BETWEEN H.START_DATE AND H.END_DATE)
WHERE C.CAR_TYPE IN ('세단','SUV') 
    AND H.CAR_ID IS NULL
    AND c.DAILY_FEE*30*(1-P.DISCOUNT_RATE/100) >= 500000 AND c.DAILY_FEE*30*(1-P.DISCOUNT_RATE/100) < 2000000
ORDER BY FEE DESC, CAR_TYPE ASC, CAR_ID DESC