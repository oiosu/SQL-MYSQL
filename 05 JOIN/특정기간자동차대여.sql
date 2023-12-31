-- 특정 기간동안 대여 가능한 자동차들의 대여비용 구하기 

-- CAR_RENTAL_COMPANY_CAR 테이블과 
-- CAR_RENTAL_COMPANY_RENTAL_HISTORY 테이블과 
-- CAR_RENTAL_COMPANY_DISCOUNT_PLAN 테이블에서 자동차 종류가 
-- '세단' 또는 'SUV' 인 자동차 중 2022년 11월 1일부터 2022년 11월 30일까지 대여 가능
-- 30일간의 대여 금액이 50만원 이상 200만원 미만인 자동차에 대해서 자동차 ID, 
-- 자동차 종류, 대여 금액(컬럼명: FEE) 리스트를 출력

-- 결과는 대여 금액을 기준으로 내림차순 정렬
-- 대여 금액이 같은 경우 자동차 종류를 기준으로 오름차순 정렬
-- 자동차 종류까지 같은 경우 자동차 ID를 기준으로 내림차순 정렬

SELECT DISTINCT A.CAR_ID, A.CAR_TYPE, ROUND(A.DAILY_FEE * 30 * (100 - C.DISCOUNT_RATE) / 100, 0) AS FEE
FROM CAR_RENTAL_COMPANY_CAR A
LEFT JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY B
ON A.CAR_ID = B.CAR_ID
LEFT JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN C
ON A.CAR_TYPE = C.CAR_TYPE
WHERE A.CAR_TYPE IN ('세단', 'SUV') 
AND (A.CAR_ID NOT IN (
    SELECT CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE '2022-11' BETWEEN DATE_FORMAT(START_DATE, '%Y-%m') AND DATE_FORMAT(END_DATE, '%Y-%m')))
AND (C.DURATION_TYPE = '30일 이상' AND (A.DAILY_FEE * 30 * (100 - C.DISCOUNT_RATE) / 100) 
     BETWEEN 500000 AND 2000000)
ORDER BY FEE DESC, A.CAR_TYPE ASC, A.CAR_ID DESC;



/* 다시 풀어봐야하는 문제 중에 하나! 
참고 : https://velog.io/@dl-00-e8/Programmers-%ED%8A%B9%EC%A0%95-%EA%B8%B0%EA%B0%84%EB%8F%99%EC%95%88-%EB%8C%80%EC%97%AC-%EA%B0%80%EB%8A%A5%ED%95%9C-%EC%9E%90%EB%8F%99%EC%B0%A8%EB%93%A4%EC%9D%98-%EB%8C%80%EC%97%AC%EB%B9%84%EC%9A%A9-%EA%B5%AC%ED%95%98%EA%B8%B0
*/