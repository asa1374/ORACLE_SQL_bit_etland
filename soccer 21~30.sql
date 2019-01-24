-- SOCCER_SQL_021
-- 이현 선수 소속팀의 선수명단 출력

select p.TEAM_ID
from player p
where p.PLAYER_NAME like '이현';

select p.PLAYER_NAME 선수명,p.POSITION 표지션, p.BACK_NO 등번호
from player p
where p.TEAM_ID like (select p.TEAM_ID
        from player p
        where p.PLAYER_NAME like '이현')
order by p.PLAYER_NAME;

-- SOCCER_SQL_022
-- NULL 처리에 있어
-- SUM(NVL(SAL,0)) 로 하지말고
-- NVL(SUM(SAL),0) 으로 해야 자원낭비가 줄어든다
-- 팀별 포지션별 인원수와 팀별 전체 인원수 출력
-- Oracle, Simple Case Expr 

select P.TEAM_ID,
        nvl(sum(case when position = 'FW' then 1 end ),0) FW,
        nvl(sum(case when position = 'MF' then 1 end ),0) MF,
        nvl(sum(case when position = 'DF' then 1 end ),0) DF,
        nvl(sum(case when position = 'GK' then 1 end ),0) GK,
        count(*) sum
from player P
group by TEAM_ID;
-- SOCCER_SQL_023
-- GROUP BY 절 없이 전체 선수들의 포지션별 평균 키 및 전체 평균 키 출력



-- SOCCER_SQL_024 
-- 소속팀별 키가 가장 작은 사람들의 정보
 
-- SOCCER_SQL_025 
-- 선수 자신이 속한 팀의 평균 키보다 작은 선수들의 정보