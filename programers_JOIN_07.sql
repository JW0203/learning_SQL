-- 그룹별 조건에 맞는 식당 목록 출력하기
/*
MEMBER_PROFILE와 REST_REVIEW 테이블에서 리뷰를 가장 많이 작성한 회원의 리뷰들을 조회하는 SQL문을 작성해주세요. 
회원 이름, 리뷰 텍스트, 리뷰 작성일이 출력되도록 작성해주시고, 
결과는 리뷰 작성일을 기준으로 오름차순, 리뷰 작성일이 같다면 리뷰 텍스트를 기준으로 오름차순 정렬해주세요
*/

SELECT M.MEMBER_NAME, R.REVIEW_TEXT, 
DATE_FORMAT(R.REVIEW_DATE, "%Y-%m-%d") REVIEW_DATE
FROM MEMBER_PROFILE M
    JOIN REST_REVIEW R
    ON M.MEMBER_ID = R.MEMBER_ID
    JOIN (
    	SELECT MEMBER_ID, COUNT(MEMBER_ID) COUNT_MEMBER
        FROM REST_REVIEW 
        GROUP BY MEMBER_ID
        ) RM
    ON R.MEMBER_ID = RM.MEMBER_ID
    WHERE RM.COUNT_MEMBER >= (
    	SELECT COUNT(MEMBER_ID)
        FROM REST_REVIEW 
        GROUP BY MEMBER_ID
        ORDER BY COUNT(MEMBER_ID) DESC LIMIT 1)
ORDER BY R.REVIEW_DATE ASC, R.REVIEW_TEXT