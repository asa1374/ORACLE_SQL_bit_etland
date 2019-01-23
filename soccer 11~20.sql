-- SOCCER_SQL_011
-- 팀과 스타디움을 조인하여
-- 팀이름, 스타디움 이름 출력

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

select s.STADIUM_NAME 스타디움,t.TEAM_NAME 홈팀,
        (select t.TEAM_NAME
            from team t
            where t.TEAM_ID like sch.AWAYTEAM_ID) 원정팀ID,
        sch.SCHE_DATE 스케줄날짜
from stadium s
    join team t
        on s.STADIUM_ID like t.STADIUM_ID
    join (select *
            from schedule sch
            where sch.SCHE_DATE like '20120317') sch
        on sch.STADIUM_ID = s.STADIUM_ID
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
from (select t.REGION_NAME,t.TEAM_NAME,t.TEAM_ID,t.STADIUM_ID
        from team t
        where t.TEAM_NAME like '스틸러스') t
    join (select p.PLAYER_NAME,p.POSITION,p.TEAM_ID
            from player p
            where p.POSITION like 'GK') p
        on t.TEAM_ID like p.TEAM_ID
    join stadium s
        on t.STADIUM_ID like s.STADIUM_ID
    join (select sch.SCHE_DATE,sch.STADIUM_ID
        from schedule sch
        where sch.SCHE_DATE like '20120317') sch
        on sch.STADIUM_ID = t.STADIUM_ID
order by p.PLAYER_NAME;

-- SOCCER_SQL_014
-- 홈팀이 3점이상 차이로 승리한 경기의 
-- 경기장 이름, 경기 일정
-- 홈팀 이름과 원정팀 이름을
-- 구하시오

select s.STADIUM_NAME 스타디움,
       sch.SCHE_DATE 경기날짜,
       t.REGION_NAME ||' '|| t.TEAM_NAME 홈팀,
       (select t.REGION_NAME||' '||t.TEAM_NAME
        from team t
        where t.TEAM_ID like sch.awayteam_id) 원정팀,
        sch.HOME_SCORE "홈팀 점수",
        sch.AWAY_SCORE "원정팀 점수"
from stadium s
    join team t
        on s.STADIUM_ID like t.STADIUM_ID
    join (select sch.HOME_SCORE,sch.AWAY_SCORE,sch.SCHE_DATE,sch.awayteam_id,sch.STADIUM_ID
        from schedule sch
        where (sch.HOME_SCORE - sch.AWAY_SCORE)>=3) sch
        on sch.STADIUM_ID = s.STADIUM_ID
order by sch.SCHE_DATE;
    
-- SOCCER_SQL_015
-- STADIUM 에 등록된 운동장 중에서
-- 홈팀이 없는 경기장까지 전부 나오도록
-- 카운트 값은 20

select s.STADIUM_NAME,
       s.STADIUM_ID,
       s.SEAT_COUNT,
       s.HOMETEAM_ID,
       (select t.E_TEAM_NAME
        from team t
        where t.STADIUM_ID like s.stadium_id)
from stadium s
order by s.HOMETEAM_ID;

-- SOCCER_SQL_016
-- 평균키가 인천 유나이티스팀의 평균키 보다 작은 팀의 
-- 팀ID, 팀명, 평균키 추출

select p.TEAM_ID 팀아이디,
        t.TEAM_NAME 팀명,
        p."평균키"
from (select p.TEAM_ID,round(avg(p.HEIGHT),2) 평균키
        from player p
        where p.HEIGHT < (select round(avg(p.HEIGHT),2)
                            from player p
                                join team t
                                    on t.TEAM_ID = p.TEAM_ID
                            where t.TEAM_NAME like '유나이티드')
        group by p.TEAM_ID) p
        join team t
            on t.team_id like p.TEAM_ID
order by p."평균키"; 

select round(avg(p.HEIGHT),2)
from player p
where (p.TEAM_ID like 'K04');

--팀별로 평균키 구하는법
select p.TEAM_ID,round(avg(p.HEIGHT),2) 평균키
from player p
where p.HEIGHT > (select round(avg(p.HEIGHT),2)
                    from player p
                    where (p.TEAM_ID like 'K04'))
group by p.TEAM_ID;

-- SOCCER_SQL_017
-- 포지션이 MF 인 선수들의  소속팀명 및 선수명, 백넘버 출력

select t.TEAM_NAME 팀명, p.PLAYER_NAME 선수명, p.BACK_NO 등번호
from (select p.PLAYER_NAME,p.BACK_NO,p.TEAM_ID
        from player p
        where p.POSITION like 'MF'
        order by p.PLAYER_NAME) p
    join team t
        on t.TEAM_ID like p.TEAM_ID;

-- SOCCER_SQL_018
-- 가장 키큰 선수 5 추출, 오라클, 단 키 값이 없으면 제외

select p.PLAYER_NAME 선수명,p.BACK_NO 등번호,p.POSITION 포지션,p.HEIGHT 키
from (select p.PLAYER_NAME,p.BACK_NO,p.POSITION,p.HEIGHT
        from player p
        order by p.HEIGHT desc) p
where p.HEIGHT is not null and rownum <= 5;

-- SOCCER_SQL_019
-- 선수 자신이 속한 팀의 평균키보다 작은 선수 정보 출력

select round(avg(HEIGHT),2)
from player
group by TEAM_ID
order by team_id;
-- 정답
select (select t.TEAM_NAME
        from team t
        where t.TEAM_ID like p.team_id) 팀명,p.PLAYER_NAME 선수명,p.POSITION 포지션,p.HEIGHT 키
from player p
    join (select team_id,round(avg(HEIGHT),2) hi
            from player
            group by TEAM_ID) t
        on p.team_id like t.team_id
where p.HEIGHT < t.HI
order by p.PLAYER_NAME;

-- SOCCER_SQL_020
-- 2012년 5월 한달간 경기가 있는 경기장 조회
-- EXISTS 쿼리는 항상 연관쿼리로 상요한다.
-- 또한 아무리 조건을 만족하는 건이 여러 건이라도
-- 조건을 만족하는 1건만 찾으면 추가적인 검색을 진행하지 않는다.p

select s.STADIUM_ID ID,s.STADIUM_NAME
from stadium s
where exists(select 1
        from schedule sch
        where s.STADIUM_ID like sch.STADIUM_ID and sch.SCHE_DATE like '201205%')
order by s.STADIUM_NAME;