-- 있었는데요 없었습니다 
-- 보호 시작일보다 입양일이 더 빠른 동물의 아이디와 이름을 조회
-- 이때 결과는 보호 시작일이 빠른 순으로 조회

/* SELECT ANIMAL_INS.ANIMAL_ID, ANIMAL_INS.NAME 
FROM ANIMAL_INS LEFT JOIN ANIMAL_OUTS ON ANIMAL_INS.ANIMAL_ID=ANIMAL_OUTS.ANIMAL_ID 
WHERE ANIMAL_INS.DATETIME > ANIMAL_OUTS.DATETIME 
ORDER BY ANIMAL_INS.DATETIME */

-- JOIN과 INNER JOIN은 같은 말
-- DATEDIFF 함수를 이용해도 상관없다
-- WHERE 절과 ORDER BY 순서를 바꾸면 에러 발생

SELECT ANIMAL_INS.ANIMAL_ID, ANIMAL_INS.NAME
FROM ANIMAL_INS
LEFT JOIN ANIMAL_OUTS
ON ANIMAL_INS.ANIMAL_ID = ANIMAL_OUTS.ANIMAL_ID
WHERE ANIMAL_INS.DATETIME > ANIMAL_OUTS.DATETIME
ORDER BY ANIMAL_INS.DATETIME

-- 이문제 너무 어려움 