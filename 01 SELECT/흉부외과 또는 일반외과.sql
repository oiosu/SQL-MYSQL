-- 흉부외과 또는 일반외과 의사 목록 출력하기
-- DOCTOR 테이블에서 진료과가 흉부외가 CS이거나 
-- 일반외과 GS인 의사의 이름, 의사ID, 진료과, 고용일자를 조회하는 SQL문
-- 이때 결과는 고용일자를 기준으로 내림차순 정렬 
-- 고용일자가 같다면 이름을 기준으로 오름차순 정렬

-- 1) OR 사용한 코드
SELECT
    DR_NAME,
    DR_ID,
    MCDP_CD,
    DATE_FORMAT(HIRE_YMD, '%Y-%m-%d') AS HIRE_YMD
FROM
    DOCTOR
WHERE
        MCDP_CD = 'CS'
   OR
        MCDP_CD = 'GS'
ORDER BY
    HIRE_YMD DESC,
    DR_NAME ASC;