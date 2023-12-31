-- 상품 별 오프라인 매출 구하기
-- PRODUCT 테이블과 OFFLINE_SALE 테이블에서 상품코드 별 매출액(판매가 * 판매량) 합계를 출력
-- 결과는 매출액을 기준으로 내림차순 정렬
-- 매출액이 같다면 상품코드를 기준으로 오름차순 정렬

/* SELECT PRODUCT_CODE, SUM(PRICE * SALES_AMOUNT) AS SALES
LEFT JOIN PRODUCT ON OFFLINE_SALE   */

/* SELECT P.PRODUCT_CODE, SUM(O.SALES_AMOUNT)*P.PRICE AS SALES
FROM PRODUCT P JOIN OFFLINE_SALE O ON P.PRODUCT_ID=O.PRODUCT_ID
GROUP BY P.PRODUCT_CODE
ORDER BY SALES DESC, P.PRODUCT_CODE; */

-- 상품코드 별 매출액(판매가 * 판매량) 합계를 가져오고 별칭 지정
SELECT P.PRODUCT_CODE, SUM(P.PRICE * O.SALES_AMOUNT) AS SALES
FROM PRODUCT P            
-- JOIN 기준 테이블을 PRODUCT 테이블로 정하기 
-- OFFLINE_SALE을 JOIN 대상 테이블로 지정하고 별칭 정하기
JOIN (SELECT PRODUCT_ID, SALES_AMOUNT FROM OFFLINE_SALE) AS O
ON P.PROUCT_ID = O.PRODUCT_ID
-- PRODUCT_ID로 JOIN을 한다. 
GROUP BY P.PRODUCT_ID
-- 매출액을 기준으로 내림차순 정렬, 매출액이 같다면 상품코드를 기준으로 오름차순 정렬
ORDER BY SALES DESC, P.PRODUCT_CODE



/* JOIN (SELECT PRODUCT_ID, SALES_AMOUNT FROM OFFLINE_SALE) AS O
ON P.PROUCT_ID = O.PRODUCT_ID

이부분만 잘 생각하기 */

/* SELECT P.PRODUCT_CODE, SUM(P.PRICE * O.SALES_AMOUNT) AS SALES
FROM PRODUCT P
JOIN (SELECT PRODUCT_ID, SALES_AMOUNT FROM OFFLINE_SALE) AS O
ON P.PROUCT_ID = O.PRODUCT_ID
GROUP BY P.PRODUCT_ID
ORDER BY SALES DESC, P.PRODUCT_CODE */

SELECT PRODUCT.PRODUCT_CODE, SUM(PRODUCT.PRICE * OFFLINE_SALE.SALES_AMOUNT) "SALES" 
    FROM OFFLINE_SALE 
    LEFT JOIN PRODUCT 
    ON OFFLINE_SALE.PRODUCT_ID = PRODUCT.PRODUCT_ID
    GROUP BY PRODUCT.PRODUCT_CODE
    ORDER BY SALES DESC, PRODUCT.PRODUCT_CODE ASC;