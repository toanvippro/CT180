--Do KHANH TOAN
--MSSV B2012046
--STT 47
--Bai thuc hanh 4
CREATE TABLE  CGTRINH (
	STT_CTR int NOT NULL ,
	TEN_CTR varchar (20)  NULL ,
	DIACHI_CTR varchar (20)  NULL ,
	TINH_THANH varchar (15)  NULL ,
	KINH_PHI int NULL ,
	TEN_CHU varchar (20)  NULL ,
	TEN_THAU varchar (20)  NULL ,
	NGAY_BD date NULL 
) ;


CREATE TABLE  CHUNHAN (
	TEN_CHU varchar (20)  NOT NULL ,
	DCHI_CHU varchar (20)  NULL 
) ;


CREATE TABLE  CHUTHAU (
	TEN_THAU varchar (20)  NOT NULL ,
	TEL char (7)  NULL ,
	DCHI_THAU varchar (20)  NULL 
) ;


CREATE TABLE  CONGNHAN (
	HOTEN_CN varchar (20)  NOT NULL ,
	NAMS_CN int NULL ,
	NAM_VAO_N int NULL ,
	CH_MON varchar (10)  NULL 
) ;


CREATE TABLE  KTRUCSU (
	HOTEN_KTS varchar (20)  NOT NULL ,
	NAMS_KTS int NULL ,
	PHAI char (2)  NULL ,
	NOI_TN varchar (15)  NULL ,
	DCHI_LL_KTS varchar (30)  NULL 
) ;


CREATE TABLE  THAMGIA (
	HOTEN_CN varchar (20)  NOT NULL ,
	STT_CTR int NOT NULL ,
	NGAY_TGIA date NULL ,
	SO_NGAY int NULL 
) ;


CREATE TABLE  THIETKE (
	HOTEN_KTS varchar (20)  NOT NULL ,
	STT_CTR int NOT NULL ,
	THU_LAO int NULL 
) ;


ALTER TABLE  CGTRINH ADD 
	CONSTRAINT PK_CGTRINH PRIMARY KEY  	(STT_CTR	)  ; 


ALTER TABLE  CHUNHAN ADD 
	CONSTRAINT PK_CHUNHAN PRIMARY KEY  (	TEN_CHU	)  ; 


ALTER TABLE  CHUTHAU ADD 
	CONSTRAINT PK_CHUTHAU PRIMARY KEY  (	TEN_THAU	)  ; 


ALTER TABLE  CONGNHAN ADD 
	CONSTRAINT PK_CONGNHAN PRIMARY KEY  (	HOTEN_CN	)  ; 


ALTER TABLE  KTRUCSU ADD 
	CONSTRAINT PK_KTRUCSU PRIMARY KEY  	(	HOTEN_KTS	)  ; 


ALTER TABLE  THAMGIA ADD 
	CONSTRAINT PK_THAMGIA PRIMARY KEY  	(	HOTEN_CN,	STT_CTR	)  ; 


ALTER TABLE  THIETKE ADD 
	CONSTRAINT PK_THIETKE PRIMARY KEY  	(	HOTEN_KTS,	STT_CTR	)  ; 


ALTER TABLE  CGTRINH ADD 
	CONSTRAINT FK_CGTRINH_CHUNHAN FOREIGN KEY 	(	TEN_CHU	) REFERENCES  CHUNHAN (	TEN_CHU	);

ALTER TABLE  CGTRINH ADD 
	CONSTRAINT FK_CGTRINH_CHUTHAU FOREIGN KEY 
	(	TEN_THAU	) REFERENCES  CHUTHAU (	TEN_THAU	);


ALTER TABLE  THAMGIA ADD 
	CONSTRAINT FK_THAMGIA_CGTRINH FOREIGN KEY 
	(		STT_CTR	) REFERENCES  CGTRINH (		STT_CTR	);

ALTER TABLE  THAMGIA ADD 
	CONSTRAINT FK_THAMGIA_CONGNHAN FOREIGN KEY 
	(		HOTEN_CN	) REFERENCES  CONGNHAN (		HOTEN_CN	);


ALTER TABLE  THIETKE ADD 
	CONSTRAINT FK_THIETKE_CGTRINH FOREIGN KEY 	(STT_CTR) REFERENCES  CGTRINH (	STT_CTR	);

ALTER TABLE  THIETKE ADD 
	CONSTRAINT FK_THIETKE_KTRUCSU FOREIGN KEY 
	(	HOTEN_KTS	) REFERENCES  KTRUCSU (	HOTEN_KTS );


insert into  chunhan values ('so t mai du lich','54 xo viet nghe tinh');
insert into  chunhan values ('so van hoa thong tin','101 hai ba trung');
insert into  chunhan values ('so giao duc','29 duong 3/2');
insert into  chunhan values ('dai hoc can tho','56 duong 30/4');
insert into  chunhan values ('cty bitis','29 phan dinh phung');
insert into  chunhan values ('nguyen thanh ha','45 de tham');
insert into  chunhan values ('phan thanh liem','48/6 huynh thuc khan');


insert into  chuthau values ('cty xd so 6','567456','5 phan chu trinh');
insert into  chuthau values ('phong dich vu so xd','206481','2 le van sy');
insert into  chuthau values ('le van son','028374','12 tran nhan ton');
insert into  chuthau values ('tran khai hoan','658432','20 nguyen thai hoc');

insert into  congnhan values ('nguyen thi suu',   45 ,    60  ,'ho');
insert into  congnhan values ('vi chi a',   66  ,    87  ,'han');
insert into  congnhan values ('le manh quoc',   56  ,    71 ,'moc');
insert into  congnhan values ('vo van chin',   40 ,    52  ,'son');
insert into  congnhan values ('le quyet thang',   54  ,    74 ,'son');
insert into  congnhan values ('nguyen hong van',   50  ,    70   ,'dien');
insert into  congnhan values ('dang van son',   48,    65 ,'dien');


insert into  ktrucsu values ('le thanh tung',   1956          ,'1','tp hcm','25 duong 3/2 tp bien hoa');
insert into  ktrucsu values ('le kim dung',   1952          ,'0','ha noi','18/5 phan van tri tp can tho');
insert into  ktrucsu values ('nguyen anh thu',   1970          ,'0','new york usa','khu i dhct tp can tho');
insert into  ktrucsu values ('nguyen song do quyen',   1970          ,'0','tp hcm','73 tran hung dao tp hcm');
insert into  ktrucsu values ('truong minh thai',   1950          ,'1','paris france','12/2/5 tran phu tp hanoi');

insert into  cgtrinh values 
( 1       ,'khach san quoc te','5 nguyen an ninh','can tho',450 ,'so t mai du lich','cty xd so 6','dec-13-1994'); 
insert into  cgtrinh values 
( 2       ,'cong vien thieu nhi','100 nguyen thai hoc','can tho',   200         ,'so van hoa thong tin','cty xd so 6','may-08-1994'); 
insert into  cgtrinh values 
( 3       ,'hoi cho nong nghiep','bai cat','vinh long',   1000        ,'so t mai du lich','phong dich vu so xd','jun-10-1994'); 
insert into  cgtrinh values 
( 4       ,'truong mg mang non','48 cm thang 8','can tho',   30          ,'so giao duc','le van son','jun-10-1994'); 
insert into  cgtrinh values 
( 5       ,'khoa trong trot dhct','khu ii dhct','can tho',   3000        ,'dai hoc can tho','le van son','jun-10-1994'); 
insert into  cgtrinh values 
( 6       ,'van phong bitis','25 phan dinh phung','ha noi',   40          ,'cty bitis','le van son','oct-05-1994'); 
insert into  cgtrinh values 
( 7       ,'nha rieng 1','124/5 nguyen trai','tp hcm',   65          ,'nguyen thanh ha','phong dich vu so xd','nov-15-1994'); 
insert into  cgtrinh values 
( 8       ,'nha rieng 2','76 chau van liem','ha noi',   100         ,'phan thanh liem','tran khai hoan','sep-06-1994'); 

insert into  thamgia values ('nguyen thi suu',   2       ,'may-08-1994',   20          );
insert into  thamgia values ('nguyen thi suu',   4       ,'sep-07-1994',   20          );
insert into  thamgia values ('nguyen thi suu',   1       ,'dec-15-1994',   5           );
insert into  thamgia values ('le manh quoc',   1       ,'dec-18-1994',   6           );
insert into  thamgia values ('vo van chin',   2       ,'may-10-1994',   10          );
insert into  thamgia values ('le quyet thang',   2       ,'may-12-1994',   5           );
insert into  thamgia values ('nguyen hong van',   1       ,'dec-16-1994',   7           );
insert into  thamgia values ('nguyen hong van',   4       ,'sep-14-1994',   7           );
insert into  thamgia values ('dang van son',   3       ,'jun-10-1994',   18          );
insert into  thamgia values ('vo van chin',   3       ,'jun-10-1994',   10          );



insert into  thietke values ('le thanh tung',   1       ,    25          );
insert into  thietke values ('le kim dung',   5       ,    30          );
insert into  thietke values ('truong minh thai',   8       ,    18          );
insert into  thietke values ('le kim dung',   6       ,    40          );
insert into  thietke values ('nguyen anh thu',   3       ,    12          );
insert into  thietke values ('le thanh tung',   7       ,    10          );
insert into  thietke values ('nguyen song do quyen',   2       ,    6           );
insert into  thietke values ('truong minh thai',   6       ,    27          );
insert into  thietke values ('le kim dung',   4       ,    20          );
insert into  thietke values ('truong minh thai',   1       ,    12          );

--Bai lam

--2 M? c??c b?ng d? li?u d? xem ki?u d? li?u c?a t?ng tru?ng v?? quan s??t d? li?u
-- c?a t?ng b?ng
select * 
from ktrucsu;
select * 
from chuthau;
select * 
from chunhan;
select * 
from congnhan;
select * 
from cgtrinh;
select * 
from thamgia;
select * 
from thietke;

--3 H??y cho bi?t th??ng tin v? c??c ki?n tr??c su c?? h? l?? L?? v?? sinh nam 1956
SELECT * FROM KTRUCSU
WHERE KTRUCSU.HOTEN_KTS LIKE 'le%' AND KTRUCSU.NAMS_KTS ='1956';

--4 H??y cho bi?t t??n c??c c??ng tr??nh b?t d?u trong kho?ng 1/9/1994 d?n 20/10/1994

select TEN_CTR from CGTRINH 
where NGAY_BD between to_date('09-01-1994','MM-DD-YYYY') 
and to_date ('10-20-1997', 'MM-DD-YYYY');

--5 H??y cho bi?t t??n v?? d?a ch? c??c c??ng tr??nh do ch? th?u ???c??ng ty x??y d?ng 
--s? 6??? thi c??ng (ch?? ??: xem d? li?u d? l?y d??ng t??n c??ng ty x??y d?ng s? 6)
SELECT TEN_CTR, DIACHI_CTR FROM CHUTHAU
WHERE TEN_THAU = 'cty xd so 6';

--6. T??m t??n v?? d?a ch? li??n l?c c?a c??c ch? th?u thi c??ng 
--c??ng tr??nh ? C?n Tho do ki?n tr??c su L?? Kim Dung thi?t k?

select distinct ct.ten_thau, dchi_thau, tel
from chuthau ct JOIN cgtrinh c ON ct.ten_thau = c.ten_thau
                JOIN thietke k ON c.stt_ctr = k.stt_ctr
where tinh_thanh = 'can tho' and hoten_kts ='le kim dung';
--7. H??y cho bi?t noi t?t nghi?p c?a c??c ki?n tr??c su d?? thi?t k? c??ng tr??nh 
--Kh??ch s?n qu?c t? ? C?n Tho
select k.hoten_kts, noi_tn, ten_ctr, tinh_thanh
from cgtrinh ct JOIN thietke k ON ct.stt_ctr = k.stt_ctr
                JOIN ktrucsu kt ON k.hoten_kts = kt.hoten_kts
        where ten_ctr ='khach san quoc te' and tinh_thanh ='can tho';

--8. Cho bi?t h? t??n, nam sinh v?? nam v??o ngh? c?a c??c c??ng nh??n c?? chuy??n m??n 
--h??n ho?c di?n d?? tham gia c??c c??ng tr??nh m?? ch? th?u L?? Van Son d?? tr??ng th?u
select cn.hoten_cn, nams_cn, nam_vao_n, ten_thau, ch_mon
from congnhan cn JOIN thamgia t ON cn.hoten_cn = t.hoten_cn
        JOIN cgtrinh ct ON t.stt_ctr = ct.stt_ctr
        where (ch_mon ='han' or ch_mon = 'dien') and ten_thau ='le van son';

        
--9. Nh?ng c??ng nh??n n??o d?? b?t d?u tham gia s??ng tr??nh Kh??ch s?n Qu?c t? ? 
--C?n Tho trong giai do?n t? ng??y 15/12/1994 d?n 31/12/1994
select hoten_cn, ngay_bd, ten_ctr, tinh_thanh
from thamgia t JOIN cgtrinh c ON t.stt_ctr = c.stt_ctr
where ten_ctr = 'khach san quoc te' and tinh_thanh = 'can tho' 
	and ngay_tgia between '12-15-1994' and '12-31-1994';


--10. Cho bi?t h? t??n v?? nam sinh c?a c??c ki?n tr??c su d?? t?t nghi?p ? TP HCM 
--v?? d?? thi?t k? ??t nh?t m?t c??ng tr??nh c?? kinh ph?? d?u tu tr??n 400 tri?u d?ng
select kt.hoten_kts, nams_kts, noi_tn, kinh_phi
from ktrucsu kt JOIN thietke tk ON kt.hoten_kts=tk.hoten_kts
                JOIN cgtrinh ct ON tk.stt_ctr = ct.stt_ctr
where noi_tn='tp hcm' and kinh_phi > 400;


--11. T??m h? t??n v?? chuy??n m??n c?a c??c c??ng nh??n tham gia c??c c??ng tr??nh do ki?n
-- tr??c su L?? Thanh T??ng thi?t k?
select cn.hoten_cn, ch_mon, hoten_kts
from congnhan cn JOIN thamgia t ON cn.hoten_cn=t.hoten_cn
                    JOIN thietke k ON t.stt_ctr = k.stt_ctr
        where hoten_kts ='le thanh tung';

--12. Cho bi?t t??n c??ng tr??nh c?? kinh ph?? cao nh?t
select ten_ctr, kinh_phi
from cgtrinh
where kinh_phi = (select max(kinh_phi) from cgtrinh);

--13. Cho bi?t h? t??n ki?n tr??c su tr? tu?i nh?t
select hoten_kts, nams_kts
from ktrucsu
where nams_kts = (select max(nams_kts) from ktrucsu);

--14. T??m t?ng kinh ph?? c?a c??c c??ng tr??nh theo t?ng ch? th?u
select ten_thau, sum(kinh_phi), ten_chu
from cgtrinh
group by ten_chu, ten_thau;

--15. T??m t??n v?? d?a ch? nh?ng ch? th?u d?? tr??ng th?u c??ng tr??nh c?? kinh ph?? th?p nh?t
select cth.ten_thau, dchi_thau, kinh_phi
from chuthau cth JOIN cgtrinh ctr ON cth.ten_thau = ctr.ten_thau
where kinh_phi = (select min(kinh_phi) from cgtrinh);


--16. Cho bi?t h? t??n c??c ki?n tr??c su c?? t?ng th?? lao thi?t k? c??c c??ng tr??nh l?n hon 25
--tri?u
select distinct hoten_kts, sum(thu_lao) tongthulao
from thietke
group by hoten_kts having  sum(thu_lao)>25;
--17. Cho bi?t s? lu?ng c??c ki?n tr??c su c?? t?ng th?? lao thi?t k? c??c c??ng tr??nh 
--l?n hon 25 tri?u
create table cau17 as
select distinct hoten_kts, sum(thu_lao) tongthulao
from thietke
group by hoten_kts having  sum(thu_lao)>25;
select count(*)tongktrusu
from cau17

drop table cau17;\
-- 18. T??nh s? c??ng tr??nh m?? m?i ki?n tr??c su d?? thi?t k?
select count(*)socongtrinh, hoten_kts
from thietke 
group by hoten_kts;

--19 . T??nh t?ng s? c??ng nh??n d?? tham gia m?i c??ng tr??nh
select count(*)tongsocn, ten_ctr
from thamgia tg JOIN cgtrinh ct ON tg.stt_ctr = ct.stt_ctr
group by tg.stt_ctr, ten_ctr;

--20 . T??m t??n v?? d?a ch? c??ng tr??nh c?? t?ng s? c??ng nh??n tham gia nhi?u nh?t
create table cau20 as
select ten_ctr, diachi_ctr, count(*) socn 
from cgtrinh ct JOIN thamgia t  ON ct.stt_ctr = t.stt_ctr
group by ten_ctr, diachi_ctr;

select ten_ctr, diachi_ctr, socn
from cau20
where socn = (select max(socn) from cau20);

drop table cau20;

--21 Cho bi?t t??n c??c th??nh ph? v?? kinh ph?? trung b??nh c?a c??c c??ng tr??nh c?a 
-- t?ng th??nh ph? tuong ?ng
select avg(kinh_phi)kinhphitb, tinh_thanh
from cgtrinh
group by tinh_thanh;

--22 Cho bi?t t??n v?? d?a ch? c?a c??c c??ng tr??nh m?? c??ng nh??n Nguy?n H?ng V??n dang
--tham gia v??o ng??y 18/12/1994

select ten_ctr, diachi_ctr
from cgtrinh c JOIN thamgia t ON c.stt_ctr=t.stt_ctr
where lower(hoten_cn) = 'nguyen hong van' 
and '12-18-1994' between ngay_tgia and ngay_tgia + so_ngay;

--23 Cho bi?t h? t??n ki?n tr??c su v?a thi?t k? c??c c??ng tr??nh do Ph??ng d?ch v? 
--S? X??y d?ng thi c??ng, v?a thi?t k? c??c c??ng tr??nh do ch? th?u L?? Van Son thi c??ng
select hoten_kts 
from cgtrinh c join thietke t on c.stt_ctr = t.stt_ctr
where ten_thau = 'phong dich vu so xd'
INTERSECT
select hoten_kts 
from cgtrinh c join thietke t on c.stt_ctr = t.stt_ctr
where ten_thau = 'cty xd so 6';


--24 Cho bi?t h? t??n c??c c??ng nh??n c?? tham gia c??c c??ng tr??nh ? C?n Tho nhung 
-- kh??ng tham gia c??ng tr??nh ? Vinh Long
select distinct hoten_cn 
from thamgia t join cgtrinh c on c.stt_ctr = t.stt_ctr
where lower(tinh_thanh) = 'can tho'
MINUS
select distinct hoten_cn 
from thamgia t join cgtrinh c on c.stt_ctr = t.stt_ctr
where lower(tinh_thanh) = 'vinh long';

--25 Cho bi?t t??n c?a c??c ch? th?u d?? thi c??ng c??c c??ng tr??nh c?? kinh ph?? l?n
-- hon t?t c? c??c c??ng tr??nh do ch? th?u Ph??ng d?ch v? s? x??y d?ng thi c??ng
select ten_thau
from cgtrinh
where kinh_phi >ALL
	(select kinh_phi
	from cgtrinh
	where ten_thau='phong dich vu so xd')

--26 Cho bi?t h? t??n c??c ki?n tr??c su c?? th?? lao thi?t k? cho m?t c??ng tr??nh n??o 
--d?? du?i gi?? tr? trung b??nh th?? lao thi?t k? c?a c??c KTS.

select distinct hoten_kts, thu_lao
from thietke 
where thu_lao < (select avg(thu_lao) from thietke);

--27 Cho bi?t h? t??n c??c c??ng nh??n c?? t?ng s? ng??y tham gia v??o c??c c??ng
-- tr??nh l?n hon t?ng s? ng??y tham gia c?a c??ng nh??n Nguy?n H?ng V??n 
create table bang27_1 as
select hoten_cn, sum(so_ngay)songay
from thamgia 
group by hoten_cn;

create table bang27_2 as
select hoten_cn, sum(so_ngay)songay
from thamgia 
where hoten_cn='nguyen hong van'
group by hoten_cn;

select hoten_cn, songay
from bang27_1
where songay > (select songay from bang27_2);

drop table bang27_1;
drop table bang27_2;

--28 Cho bi?t h? t??n c??ng nh??n c?? tham gia t?t c? c??c c??ng tr??nh
select hoten_cn, count(*) 
from thamgia
group by hoten_cn having count(*) = (select count(*) from cgtrinh);
 
--29 T??m c??c c?p t??n c?a ch? th?u c?? tr??ng th?u c??c c??ng tr??nh t?i c??ng m?t th??nh ph?
select distinct c.ten_thau, c1.ten_thau 
from cgtrinh c JOIN cgtrinh c1 ON c.tinh_thanh = c1.tinh_thanh
where c.ten_thau < c1.ten_thau;

--30 T??m c??c c?p t??n c?a c??c c??ng nh??n c?? lam vi?c chung v?i nhau trong ??t nh?t 
--l?? hai c??ng tr??nh
select distinct t.hoten_cn, t1.hoten_cn 
from thamgia t JOIN thamgia t1 ON t.stt_ctr = t1.stt_ctr
where t.hoten_cn < t1.hoten_cn
group by t.hoten_cn, t1.hoten_cn having count(*)>1;