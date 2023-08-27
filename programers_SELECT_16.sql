 -- 조건에 맞는 회원수 구하기

 /*
USER_INFO 테이블에서 2021년에 가입한 회원 중 나이가 20세 이상 29세 이하인 회원이 몇 명인지 출력하는 SQL문을 작성해주세요.
 */


 SELECT COUNT(USER_ID) USERS FROM USER_INFO
    WHERE DATE_FORMAT(JOINED, '%Y') = '2021' AND AGE >= 20 AND AGE <=29