select * from tab;
select * from player;
select * from team;

desc player;
create view pla as
select
PLAYER_ID pid,
PLAYER_NAME pname,
TEAM_ID tid,
E_PLAYER_NAME ename,
NICKNAME nname,
JOIN_YYYY jo,
POSITION pos,
BACK_NO ba,
NATION na,
BIRTH_DATE birth,
SOLAR sol,
HEIGHT,
WEIGHT
from player;

select * from team;
-- SQL_TEST_001
-- 전체 축구팀 목록. 이름 오름차순

select team_name "전체 축구팀 목록"
from team
order by team_name;

-- SQL_TEST_002
-- 포지션 종류(중복제거,없으면 빈공간

select distinct position "포지션 종류"
from player;

-- SQL_TEST_003
-- 포지션 종류(중복제거,없으면 신입으로 기재)
-- nvl2()사용

select distinct nvl2(position,position,'신입') "포지션 종류"
from player;

-- SQL_TEST_004
-- 수원팀(ID: K02)골키퍼

select p.PNAME 이름 
from pla p
where p.TID like 'K02' and p.POS like 'GK'
order by p.PNAME;

-- SQL_TEST_005
-- 수원팀(ID: K02)키가 170 이상 선수
-- 이면서 성이 고씨인 선수

select p.POS 포지션,p.PNAME 이름
from pla p
where p.PNAME like '고%' and p.HEIGHT>=170 and p.TID like 'K02';

-- SQL_TEST_006
-- 수원팀(ID: K02) 선수들 이름,
-- 키와 몸무게 리스트 (단위 cm 와 kg 삽입)
-- 키와 몸무게가 없으면 "0" 표시
-- 키 내림차순
select * from team;
select p.PNAME ||'선수'이름, 
        nvl2(p.HEIGHT,p.HEIGHT,0)||'cm' 키,
        nvl2(p.WEIGHT,p.WEIGHT,0)||'kg'몸무게
from pla p
where p.TID like 'K02'
order by p.HEIGHT desc;

-- SQL_TEST_007
-- 수원팀(ID: K02) 선수들 이름,
-- 키와 몸무게 리스트 (단위 cm 와 kg 삽입)
-- 키와 몸무게가 없으면 "0" 표시
-- BMI지수 
-- 키 내림차순

select PNAME ||'선수'이름, 
        nvl2(HEIGHT,HEIGHT,0)||'cm' 키,
        nvl2(WEIGHT,WEIGHT,0)||'kg'몸무게,
        round(WEIGHT/(HEIGHT*HEIGHT)*10000,2) "bmi 비만지수"
from (select PNAME,HEIGHT,WEIGHT
        from pla
        where TID like 'K02')
order by height desc;


-- SQL_TEST_008
-- 수원팀(ID: K02) 과 대전팀(ID: K10)선수들 중 
--  포지션이 GK 인  선수
-- 팀명, 사람명 오름차순
select tid,pos,pname
from pla
where TID like 'K02' or TID like 'K10';

select (select team_name
        from team t
        where tid like t.TEAM_ID)팀명,pos,pname
from (select tid,pos,pname
        from pla p
        where TID in('K02','K10'))
where pos like 'GK'
order by tid,pname;

-- SQL_TEST_009
-- 수원팀(ID: K02) 과 대전팀(ID: K10)선수들 중 이
-- 키가 180 이상 183 이하인 선수들
-- 키, 팀명, 사람명 오름차순

select height||'cm' 키,(select team_name
        from team t
        where tid like t.TEAM_ID)팀명,pname 이름
from (select tid,height,pname
        from pla p
        where TID like 'K02' or TID like 'K10')
where height between 180 and 183
order by height,tid,pname;

-- SOCCER_SQL_010
-- 모든 선수들 중
-- 포지션을 배정받지 못한 선수들의 팀과 이름
-- 팀명, 사람명 오름차순

select (select t.TEAM_NAME
            from team t
            where tid like t.TEAM_ID)팀명, pname 이름
from (select tid,pname
        from pla
        where pos is null);