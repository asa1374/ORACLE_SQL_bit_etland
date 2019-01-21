-- SOCCER_SQL_011
-- 팀과 스타디움을 조인하여
-- 팀이름, 스타디움 이름 출력
select ddd from team;

select t.TEAM_NAME 팀명, s.STADIUM_NAME 스타디움
from team t
    join stadium s 
        on t.STADIUM_ID like s.STADIUM_ID
order by t.TEAM_NAME;

-- SOCCER_SQL_012
-- 팀과 스타디움, 스케줄을 조인하여
-- 2012년 3월 17일에 열린 각 경기의 
-- 팀이름, 스타디움, 어웨이팀 이름 출력
-- 다중테이블 join 을 찾아서 해결하시오.

select t.TEAM_NAME 팀명,
        s.STADIUM_NAME 스타디움,
        sch.AWAYTEAM_ID 원정팀ID,
        sch.SCHE_DATE 스케줄날짜
from stadium s
    join team t
        on s.STADIUM_ID like t.STADIUM_ID
    join schedule sch
        on sch.STADIUM_ID = s.STADIUM_ID
where sch.SCHE_DATE like '20120317'
order by t.TEAM_NAME;

-- SOCCER_SQL_013
-- 2012년 3월 17일 경기에 
-- 포항 스틸러스 소속 골키퍼(GK)
-- 선수, 포지션,팀명 (연고지포함), 
-- 스타디움, 경기날짜를 구하시오
-- 연고지와 팀이름은 간격을 띄우시오
select * from team;

select p.PLAYER_NAME 선수명,
        p.POSITION 포지션,
        t.REGION_NAME ||' ' ||t.TEAM_NAME 팀명,
        s.STADIUM_NAME 스타디움,
        sch.SCHE_DATE 스케줄날짜
from team t
    join player p
        on t.TEAM_ID like p.TEAM_ID
    join stadium s
        on t.STADIUM_ID like s.STADIUM_ID
    join SCHEDULE sch
        on sch.STADIUM_ID = t.STADIUM_ID
where sch.SCHE_DATE like '20120317' and p.POSITION like 'GK' and t.TEAM_NAME like '스틸러스';

-- SOCCER_SQL_014
-- 홈팀이 3점이상 차이로 승리한 경기의 
-- 경기장 이름, 경기 일정
-- 홈팀 이름과 원정팀 이름을
-- 구하시오

select s.STADIUM_NAME 스타디움,
       a.SCHE_DATE 경기날짜,
       (a.HOMETEAM_ID like t.TEAM_NAME) 홈팀,
       (a.AWAYTEAM_ID like t.TEAM_NAME) 원정팀,
        a.HOME_SCORE "홈팀 점수",
        a.AWAY_SCORE "원정팀 점수"
from team t
    join stadium s
        on s.STADIUM_ID like t.STADIUM_ID
    join (select *
        from schedule sch
        where (sch.HOME_SCORE - sch.AWAY_SCORE)>=3) a
        on a.STADIUM_ID = t.STADIUM_ID;
    
