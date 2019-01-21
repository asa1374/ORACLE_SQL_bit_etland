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
-- ��ü �౸�� ���. �̸� ��������

select team_name "��ü �౸�� ���"
from team
order by team_name;

-- SQL_TEST_002
-- ������ ����(�ߺ�����,������ �����

select distinct position "������ ����"
from player;

-- SQL_TEST_003
-- ������ ����(�ߺ�����,������ �������� ����)
-- nvl2()���

select distinct nvl2(position,position,'����') "������ ����"
from player;

-- SQL_TEST_004
-- ������(ID: K02)��Ű��

select p.PNAME �̸� 
from pla p
where p.TID like 'K02' and p.POS like 'GK'
order by p.PNAME;

-- SQL_TEST_005
-- ������(ID: K02)Ű�� 170 �̻� ����
-- �̸鼭 ���� ���� ����

select p.POS ������,p.PNAME �̸�
from pla p
where p.PNAME like '��%' and p.HEIGHT>=170 and p.TID like 'K02';

-- SQL_TEST_006
-- ������(ID: K02) ������ �̸�,
-- Ű�� ������ ����Ʈ (���� cm �� kg ����)
-- Ű�� �����԰� ������ "0" ǥ��
-- Ű ��������
select * from team;
select p.PNAME ||'����'�̸�, 
        nvl2(p.HEIGHT,p.HEIGHT,0)||'cm' Ű,
        nvl2(p.WEIGHT,p.WEIGHT,0)||'kg'������
from pla p
where p.TID like 'K02'
order by p.HEIGHT desc;

-- SQL_TEST_007
-- ������(ID: K02) ������ �̸�,
-- Ű�� ������ ����Ʈ (���� cm �� kg ����)
-- Ű�� �����԰� ������ "0" ǥ��
-- BMI���� 
-- Ű ��������

select PNAME ||'����'�̸�, 
        nvl2(HEIGHT,HEIGHT,0)||'cm' Ű,
        nvl2(WEIGHT,WEIGHT,0)||'kg'������,
        round(WEIGHT/(HEIGHT*HEIGHT)*10000,2) "bmi ������"
from (select PNAME,HEIGHT,WEIGHT
        from pla
        where TID like 'K02')
order by height desc;


-- SQL_TEST_008
-- ������(ID: K02) �� ������(ID: K10)������ �� 
--  �������� GK ��  ����
-- ����, ����� ��������
select tid,pos,pname
from pla
where TID like 'K02' or TID like 'K10';

select (select team_name
        from team t
        where tid like t.TEAM_ID)����,pos,pname
from (select tid,pos,pname
        from pla p
        where TID in('K02','K10'))
where pos like 'GK'
order by tid,pname;

-- SQL_TEST_009
-- ������(ID: K02) �� ������(ID: K10)������ �� ��
-- Ű�� 180 �̻� 183 ������ ������
-- Ű, ����, ����� ��������

select height||'cm' Ű,(select team_name
        from team t
        where tid like t.TEAM_ID)����,pname �̸�
from (select tid,height,pname
        from pla p
        where TID like 'K02' or TID like 'K10')
where height between 180 and 183
order by height,tid,pname;

-- SOCCER_SQL_010
-- ��� ������ ��
-- �������� �������� ���� �������� ���� �̸�
-- ����, ����� ��������

select (select t.TEAM_NAME
            from team t
            where tid like t.TEAM_ID)����, pname �̸�
from (select tid,pname
        from pla
        where pos is null);