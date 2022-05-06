--Bai th6
--Do Khanh Toan
--B2012046
-- bai 1
alter table nguoi_an add primary key (ten)
alter table lui_toi add primary key (ten,quanPizza)
alter table an add primary key (ten,pizza)
alter table phuc_vu add primary key (quanPizza,pizza,gia)


alter table lui_toi add foreign key (ten) references nguoi_an
alter table an add foreign key (ten) references nguoi_an

alter table phuc_vu add check(gia > 0)

-- bai 2
select pizza from phuc_vu where quanpizza = 'Pizza Hut' 

-- bai 3
select quanpizza,pizza
from phuc_vu
order by quanpizza

-- bai 4
select quanPizza 
from phuc_vu
where pizza like '%m'

-- bai 5
select na.ten,na.tuoi
from nguoi_an na join lui_toi lt
on na.ten = lt.ten
where quanPizza = 'Dominos'
order by na.tuoi desc

-- bai 6
select quanPizza, count(pizza) so_banh_phuc_vu
from phuc_vu
group by quanPizza

-- bai 7
select quanPizza, max(gia) giacaonhat
from phuc_vu
group by quanPizza having max(gia) = (select MAX(gia) from phuc_vu)

-- bai 8
select distinct quanPizza
from phuc_vu
where pizza in (select pizza from an where ten ='Ian')

-- bai 9
select distinct quanPizza
from phuc_vu
where pizza not in (select pizza from an where ten ='Eli')

-- bai 10
select quanpizza
from phuc_vu
group by quanpizza having 
                count(pizza) = (select count(*) from an where ten = 'Eli') 
                and quanpizza in (select quanpizza from phuc_vu
                                    where pizza in (select pizza from an where ten ='Eli')
                                    group by quanpizza having count(pizza) = (select count(*) from lui_toi where ten ='Eli'))
									
-- bai 11
select distinct quanPizza 
from phuc_vu
where quanPizza <> 'New York Pizza'
and gia > (select max(gia) from phuc_vu where quanPizza = 'New York Pizza')

-- bai 12
select distinct quanPizza 
from phuc_vu
where gia < 10 and quanPizza not in (select distinct quanPizza from phuc_vu where gia > 10)

-- bai 13
select pizza 
from phuc_vu 
where quanPizza = 'New York Pizza' and pizza in (select pizza 
                                                    from phuc_vu 
                                                    where quanPizza = 'Dominos' 
-- bai 14
select pizza 
from phuc_vu 
where quanPizza = 'Little Caesars' and pizza not in (select pizza 
                                                    from phuc_vu 
                                                    where quanPizza = 'Pizza Hut' )

-- bai 15
select quanpizza,count(pizza) SoLuongPizza
from phuc_vu 
group by quanpizza having count(pizza) = (select count(*) 
                                        from (select distinct pizza 
                                        from phuc_vu ))
										
-- bai 16
select quanpizza
from phuc_vu 
where pizza in (select pizza from an where ten = 'Gus') 
group by quanpizza having count(pizza) >= 2

-- bai 17
select quanpizza
from phuc_vu 
where pizza in (select pizza from an where ten = 'Ian') 
group by quanpizza having count(pizza) = (select count(*) from an where ten = 'Ian')


-- bai 18
select ten
from lui_toi
group by ten having count(quanPizza)>=3

-- bai 19
select quanpizza, count(pizza) soloaipizza
from phuc_vu 
group by quanpizza

-- bai 20
select ten
from an 
where pizza in (select pizza from an where ten = 'Hil') 
and ten <> 'Hil'
group by ten having count(pizza) >= (select count(*) from an where ten = 'Hil')