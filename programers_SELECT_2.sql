-- 서울에 위치한 식당 목록 출력하기

SELECT i.rest_id, rest_name, food_type, favorites, address, 
ROUND(AVG(r.review_score), 2) AS SCORE 
FROM rest_info AS i
INNER JOIN rest_review AS r USING(rest_id)
WHERE address LIKE '서울%'
GROUP BY i.rest_id
ORDER BY 6 DESC, 4 DESC;