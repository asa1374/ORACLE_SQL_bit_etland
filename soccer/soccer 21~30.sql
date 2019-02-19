-- SOCCER_SQL_021
-- ���� ���� �Ҽ����� ������� ���

select p.TEAM_ID
from player p
where p.PLAYER_NAME like '����';

select p.PLAYER_NAME ������,p.POSITION ǥ����, p.BACK_NO ���ȣ
from player p
where p.TEAM_ID like (select p.TEAM_ID
        from player p
        where p.PLAYER_NAME like '����')
order by p.PLAYER_NAME;

-- SOCCER_SQL_022
-- NULL ó���� �־�
-- SUM(NVL(SAL,0)) �� ��������
-- NVL(SUM(SAL),0) ���� �ؾ� �ڿ����� �پ���
-- ���� �����Ǻ� �ο����� ���� ��ü �ο��� ���
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
-- GROUP BY �� ���� ��ü �������� �����Ǻ� ��� Ű �� ��ü ��� Ű ���



-- SOCCER_SQL_024 
-- �Ҽ����� Ű�� ���� ���� ������� ����
 
-- SOCCER_SQL_025 
-- ���� �ڽ��� ���� ���� ��� Ű���� ���� �������� ����