-- 가장 비싼 상품 구하기 
-- PRODUCT 테이블에서 판매 중인 상품 중 가장 높은 판매가를 출력
-- 이때 컬럼명은 MAX_PRICE로 지정

SELECT MAX(PRICE) AS MAX_PRICE FROM PRODUCT;