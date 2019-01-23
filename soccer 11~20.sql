-- SOCCER_SQL_011
-- ���� ��Ÿ����� �����Ͽ�
-- ���̸�, ��Ÿ��� �̸� ���

select t.TEAM_NAME ����, s.STADIUM_NAME ��Ÿ���
from team t
    join stadium s 
        on t.STADIUM_ID like s.STADIUM_ID
order by t.TEAM_NAME;

-- SOCCER_SQL_012
-- ���� ��Ÿ���, �������� �����Ͽ�
-- 2012�� 3�� 17�Ͽ� ���� �� ����� 
-- ���̸�, ��Ÿ���, ������� �̸� ���
-- �������̺� join �� ã�Ƽ� �ذ��Ͻÿ�.

select s.STADIUM_NAME ��Ÿ���,t.TEAM_NAME Ȩ��,
        (select t.TEAM_NAME
            from team t
            where t.TEAM_ID like sch.AWAYTEAM_ID) ������ID,
        sch.SCHE_DATE �����ٳ�¥
from stadium s
    join team t
        on s.STADIUM_ID like t.STADIUM_ID
    join (select *
            from schedule sch
            where sch.SCHE_DATE like '20120317') sch
        on sch.STADIUM_ID = s.STADIUM_ID
order by t.TEAM_NAME;

-- SOCCER_SQL_013
-- 2012�� 3�� 17�� ��⿡ 
-- ���� ��ƿ���� �Ҽ� ��Ű��(GK)
-- ����, ������,���� (����������), 
-- ��Ÿ���, ��⳯¥�� ���Ͻÿ�
-- �������� ���̸��� ������ ���ÿ�
select * from team;

select p.PLAYER_NAME ������,
        p.POSITION ������,
        t.REGION_NAME ||' ' ||t.TEAM_NAME ����,
        s.STADIUM_NAME ��Ÿ���,
        sch.SCHE_DATE �����ٳ�¥
from (select t.REGION_NAME,t.TEAM_NAME,t.TEAM_ID,t.STADIUM_ID
        from team t
        where t.TEAM_NAME like '��ƿ����') t
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
-- Ȩ���� 3���̻� ���̷� �¸��� ����� 
-- ����� �̸�, ��� ����
-- Ȩ�� �̸��� ������ �̸���
-- ���Ͻÿ�

select s.STADIUM_NAME ��Ÿ���,
       sch.SCHE_DATE ��⳯¥,
       t.REGION_NAME ||' '|| t.TEAM_NAME Ȩ��,
       (select t.REGION_NAME||' '||t.TEAM_NAME
        from team t
        where t.TEAM_ID like sch.awayteam_id) ������,
        sch.HOME_SCORE "Ȩ�� ����",
        sch.AWAY_SCORE "������ ����"
from stadium s
    join team t
        on s.STADIUM_ID like t.STADIUM_ID
    join (select sch.HOME_SCORE,sch.AWAY_SCORE,sch.SCHE_DATE,sch.awayteam_id,sch.STADIUM_ID
        from schedule sch
        where (sch.HOME_SCORE - sch.AWAY_SCORE)>=3) sch
        on sch.STADIUM_ID = s.STADIUM_ID
order by sch.SCHE_DATE;
    
-- SOCCER_SQL_015
-- STADIUM �� ��ϵ� ��� �߿���
-- Ȩ���� ���� �������� ���� ��������
-- ī��Ʈ ���� 20

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
-- ���Ű�� ��õ ������Ƽ������ ���Ű ���� ���� ���� 
-- ��ID, ����, ���Ű ����

select p.TEAM_ID �����̵�,
        t.TEAM_NAME ����,
        p."���Ű"
from (select p.TEAM_ID,round(avg(p.HEIGHT),2) ���Ű
        from player p
        where p.HEIGHT < (select round(avg(p.HEIGHT),2)
                            from player p
                                join team t
                                    on t.TEAM_ID = p.TEAM_ID
                            where t.TEAM_NAME like '������Ƽ��')
        group by p.TEAM_ID) p
        join team t
            on t.team_id like p.TEAM_ID
order by p."���Ű"; 

select round(avg(p.HEIGHT),2)
from player p
where (p.TEAM_ID like 'K04');

--������ ���Ű ���ϴ¹�
select p.TEAM_ID,round(avg(p.HEIGHT),2) ���Ű
from player p
where p.HEIGHT > (select round(avg(p.HEIGHT),2)
                    from player p
                    where (p.TEAM_ID like 'K04'))
group by p.TEAM_ID;

-- SOCCER_SQL_017
-- �������� MF �� ��������  �Ҽ����� �� ������, ��ѹ� ���

select t.TEAM_NAME ����, p.PLAYER_NAME ������, p.BACK_NO ���ȣ
from (select p.PLAYER_NAME,p.BACK_NO,p.TEAM_ID
        from player p
        where p.POSITION like 'MF'
        order by p.PLAYER_NAME) p
    join team t
        on t.TEAM_ID like p.TEAM_ID;

-- SOCCER_SQL_018
-- ���� Űū ���� 5 ����, ����Ŭ, �� Ű ���� ������ ����

select p.PLAYER_NAME ������,p.BACK_NO ���ȣ,p.POSITION ������,p.HEIGHT Ű
from (select p.PLAYER_NAME,p.BACK_NO,p.POSITION,p.HEIGHT
        from player p
        order by p.HEIGHT desc) p
where p.HEIGHT is not null and rownum <= 5;

-- SOCCER_SQL_019
-- ���� �ڽ��� ���� ���� ���Ű���� ���� ���� ���� ���

select round(avg(HEIGHT),2)
from player
group by TEAM_ID
order by team_id;
-- ����
select (select t.TEAM_NAME
        from team t
        where t.TEAM_ID like p.team_id) ����,p.PLAYER_NAME ������,p.POSITION ������,p.HEIGHT Ű
from player p
    join (select team_id,round(avg(HEIGHT),2) hi
            from player
            group by TEAM_ID) t
        on p.team_id like t.team_id
where p.HEIGHT < t.HI
order by p.PLAYER_NAME;

-- SOCCER_SQL_020
-- 2012�� 5�� �Ѵް� ��Ⱑ �ִ� ����� ��ȸ
-- EXISTS ������ �׻� ���������� ����Ѵ�.
-- ���� �ƹ��� ������ �����ϴ� ���� ���� ���̶�
-- ������ �����ϴ� 1�Ǹ� ã���� �߰����� �˻��� �������� �ʴ´�.p

select s.STADIUM_ID ID,s.STADIUM_NAME
from stadium s
where exists(select 1
        from schedule sch
        where s.STADIUM_ID like sch.STADIUM_ID and sch.SCHE_DATE like '201205%')
order by s.STADIUM_NAME;