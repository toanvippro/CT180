--Bai thuc hanh 5
--DokhanhToan
--B2012046

CREATE TABLE khuvuc(
	IP varchar(20) NOT NULL PRIMARY KEY,
	tenKhuvuc varchar(30) not null,
	tang smallint);
----------------------------------------------------
CREATE TABLE phong(
	MP varchar(20) NOT NULL PRIMARY KEy,
	tenphong varchar(20) not null,
	somay smallint,
	IP varchar(20),
	foreign key(IP) references khuvuc(IP));
----------------------------------------------------
create table loai(
	idloai varchar(20) not null primary key,
	tenloai varchar(30) not null);
----------------------------------------------------
create table may(
	idMay varchar(20) not null primary key,
	tenmay varchar(20) not null,
	IP varchar(20),
	ad smallint check (ad BETWEEN 0 and 255),
	idloai varchar(20),
	MP varchar(20),
	foreign key(IP) references khuvuc(IP),
	foreign key(idloai) references loai(idloai));
----------------------------------------------------
create table phanmem(
	idPM varchar(20) not null primary key,
	tenPM varchar(30) not null,
	ngaymua date,
	version varchar(20),
	idloai varchar(20),
	gia smallint check(gia>=0),
	foreign key(idloai) references loai(idloai));
----------------------------------------------------
create table caidat(
	id varchar(20) not null primary key,
	idMay varchar(20),
	idPM varchar(20),
	ngaycai date default SYSDATE,
	foreign key(idMay) references may(idMay),
	foreign key(idPM) references phanmem(idPM));
	
----------------------------------------------------

insert into khuvuc values('130.120.80','Brin RDC',null);
insert into khuvuc values('130.120.81','Brin tang 1',null);
insert into khuvuc values('130.120.82','Brin tang 2',null);

----------------------------------------------------

insert into phong values('s01','salle 1',3,'130.120.80');
insert into phong values('s02','salle 2',2,'130.120.80');
insert into phong values('s03','salle 3',2,'130.120.80');
insert into phong values('s11','salle 11',2,'130.120.81');
insert into phong values('s12','salle 12',1,'130.120.81');
insert into phong values('s21','salle 21',2,'130.120.82');


--select * from khuvuc;
--select * from phong;
----------------------------------------------------

insert into loai values('TX','Terminal X-Window');
insert into loai values('UNIX','System Unix');
insert into loai values('PCNT','PC Windows NT');
insert into loai values('PCWS','PC Windows');
insert into loai values('NC','Network Computer');

-----------------------------------------------------
insert into may values('p1','Poste 1','130.120.80',01,'TX','s01');
insert into may values('p2','Poste 2','130.120.80',02,'UNIX','s01');
insert into may values('p3','Poste 3','130.120.80',03,'TX','s01');
insert into may values('p4','Poste 4','130.120.80',04,'PCWS','s02');
insert into may values('p5','Poste 5','130.120.80',05,'PCWS','s02');
insert into may values('p6','Poste 6','130.120.80',06,'UNIX','s03');
insert into may values('p7','Poste 7','130.120.80',07,'TX','s03');
insert into may values('p8','Poste 8','130.120.81',01,'UNIX','s11');
insert into may values('p9','Poste 9','130.120.81',02,'TX','s11');
insert into may values('p10','Poste 10','130.120.81',03,'UNIX','s12');
insert into may values('p11','Poste 11','130.120.82',01,'PCNT','s21');
insert into may values('p12','Poste 12','130.120.82',02,'PCWS','s21');
-----------------------------------------------------
insert into phanmem values('log1','Oracle 6','05-13-1995','6.2','UNIX',3000);
insert into phanmem values('log2','Oracle 8','09-15-1999','8i','UNIX',5600);
insert into phanmem values('log3','SQL Server','04-12-1998','7','PCNT',2700);
insert into phanmem values('log4','Front Page','06-03-1997','5','PCWS',500);
insert into phanmem values('log5','WinDev','05-12-1997','5','PCWS',750);
insert into phanmem values('log6','SQL*Net',null,'2.0','UNIX',500);
insert into phanmem values('log7','I.I.S.','04-12-2002','2','PCNT',810);

--SELECT * FROM PHANMEM;
-----------------------------------------------------
insert into caidat(idMay,idPM,id,ngaycai) values('p1','log1','13','08-10-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p1','log2','14','08-11-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p2','log1','1','05-15-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p2','log2','2','09-17-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p4','log5','3',null);
insert into caidat(idMay,idPM,id,ngaycai) values('p6','log6','4','05-20-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p6','log1','5','05-2-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p8','log2','6','05-19-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p8','log6','7','05-20-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p8','log1','12','06-20-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p11','log3','8','04-20-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p12','log4','9','04-20-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p11','log7','10','04-20-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p7','log7','11','04-01-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p12','log6','15','07-25-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p12','log1','16','03-20-2003');
insert into caidat(idMay,idPM,id,ngaycai) values('p3','log1','17','03-20-2003');

--C�u 2
select l.idloai, tenloai
from may m, loai l
where  m.idloai = l.idloai and idmay = 'p8';

--C�u 3
select tenpm from phanmem
where idloai ='UNIX';

--C�u 4
select p.mp, p.tenphong, p.ip
from phong p, may m
where p.mp=m.mp and m.idloai='UNIX' or m.idloai='PCWS';

--C�u 5
select p.mp, p.tenphong, p.ip
from phong p, may m
where p.mp=m.mp and m.idloai='UNIX' or m.idloai='PCWS'
and p.ip='130.120.80';

--C�u 6
select count(*) from caidat
where idmay='p6';

--C�u 7
select count(idmay) from caidat
where idpm='log1';

--C�u 8
select idMay, IP ||'.'|| ad as fullIP
from May;

--C�u 9
select idmay, count(idpm) as sophanmem
from caidat
group by idmay;

--C�u 10
select p.mp, count (distinct m.idmay)
from phong p join may m on p.mp = m.mp
group by p.mp;

--C�u 11
select idpm, count (distinct idmay) as socaidat
from caidat
group by idpm;

--C�u 12
select avg(gia) giatrungbinh
from phanmem
where idloai = 'UNIX';

--C�u 13
select max(ngaymua)
from phanmem;

--C�u 14
select idmay, count(idpm) as sophanmem
from caidat
group by idmay
having count (idpm) >=2;

--C�u 15
select loai.idloai
from loai
where loai.idloai not in (
    select distinct idloai
    from may
)

--C�u 16
select loai.idloai
from loai
where loai.idloai in (
    select distinct idloai
    from may
)
and loai.idloai in (
    select distinct idloai
    from phanmem
)

--C�u 17
select idloai
from loai
where idloai not in (select idloai from phanmem);

--C�u 18
select idpm, ip ||'.'|| ad ipdaydu
from caidat cd join may m on cd.idmay=m.idmay
where idpm = 'log6';

--C�u 19
select m.idmay, tenpm, ip ||'.'|| ad ipdaydu
from caidat cd join may m on cd.idmay=m.idmay
join phanmem pm on cd.idpm = pm.idpm
where tenpm = 'Oracle 8';

--C�u 20
select tenkhuvuc ,count(*) somay
from
(select tenkhuvuc, idmay, idloai
from khuvuc k join may m on k.ip = m.ip
where idloai = 'TX')
group by tenkhuvuc having count(*) =3;

--C�u 21
select  distinct tenphong ,tenpm
from phong p join may m on p.mp = m.mp
join caidat cd on m.idmay = cd.idmay
join phanmem p on cd.idpm = p.idpm
where tenpm ='Oracle 6';

--C�u 22
select tenpm, ngaymua
from phanmem
where ngaymua = (select max(ngaymua) from phanmem);

--C�u 23
select tenpm, gia
from phanmem
where idloai ='PCNT'
and gia > (select min(gia) from phanmem where  idloai ='UNIX');

--C�u 24
select tenpm, gia
from phanmem
where idloai = 'UNIX' and
gia > (select max(gia) from phanmem where idloai ='PCNT');

--C�u 25
select distinct  cd.idmay, tenmay
from caidat cd join may m on cd.idmay = m.idmay
where cd.idmay  <> 'p6'
and idpm in (select idpm from caidat where idmay ='p6');

--C�u 26
select c.idmay
from caidat c join (select idpm from caidat where idmay= 'p6') t on c.idpm = t.idpm
where c.idmay <> 'p6'
group by c.idmay
having count (c.idpm)>=(select count(idpm) from caidat where idmay='p6');

--C�u 27
create table cau27 as
select c.idmay
from caidat c join (select idpm from caidat where idmay='p2') t on c.idpm=t.idpm
where c.idmay <> 'p2'
group by c.idmay
having count(c.idpm)>=(select count(idpm) from caidat where idmay='p2');

select *
from cau27
where idmay in (select idmay from caidat group by idmay
having count(idpm) = (select count(idpm) from caidat where idmay='p2'));

drop table cau27;

