-- 과일로 만든 아이스크림 고르기
/*-
상반기 아이스크림 총주문량이 3,000보다 높으면서 아이스크림의 주 성분이 과일인 아이스크림의 맛을 총 주문량이 큰 순서대로 조회
*/

SELECT I.FLAVOR FROM ICECREAM_INFO I
    INNER JOIN  FIRST_HALF F
    ON I.FLAVOR = F.FLAVOR
WHERE F.TOTAL_ORDER > 3000 AND I.INGREDIENT_TYPE = 'fruit_based'
ORDER BY F.TOTAL_ORDER DESC;