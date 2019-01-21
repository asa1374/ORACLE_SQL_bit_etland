-- SOCCER_SQL_011
-- ���� ��Ÿ����� �����Ͽ�
-- ���̸�, ��Ÿ��� �̸� ���
select ddd from team;

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

select t.TEAM_NAME ����,
        s.STADIUM_NAME ��Ÿ���,
        sch.AWAYTEAM_ID ������ID,
        sch.SCHE_DATE �����ٳ�¥
from stadium s
    join team t
        on s.STADIUM_ID like t.STADIUM_ID
    join schedule sch
        on sch.STADIUM_ID = s.STADIUM_ID
where sch.SCHE_DATE like '20120317'
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
from team t
    join player p
        on t.TEAM_ID like p.TEAM_ID
    join stadium s
        on t.STADIUM_ID like s.STADIUM_ID
    join SCHEDULE sch
        on sch.STADIUM_ID = t.STADIUM_ID
where sch.SCHE_DATE like '20120317' and p.POSITION like 'GK' and t.TEAM_NAME like '��ƿ����';

-- SOCCER_SQL_014
-- Ȩ���� 3���̻� ���̷� �¸��� ����� 
-- ����� �̸�, ��� ����
-- Ȩ�� �̸��� ������ �̸���
-- ���Ͻÿ�

select s.STADIUM_NAME ��Ÿ���,
       a.SCHE_DATE ��⳯¥,
       (a.HOMETEAM_ID like t.TEAM_NAME) Ȩ��,
       (a.AWAYTEAM_ID like t.TEAM_NAME) ������,
        a.HOME_SCORE "Ȩ�� ����",
        a.AWAY_SCORE "������ ����"
from team t
    join stadium s
        on s.STADIUM_ID like t.STADIUM_ID
    join (select *
        from schedule sch
        where (sch.HOME_SCORE - sch.AWAY_SCORE)>=3) a
        on a.STADIUM_ID = t.STADIUM_ID;
    
