--Bai thuc hanh 1
--DoKhanhToan
--B2012046



--1. KHOAHOC (MAKH,TENKH,NGAYBD, NGAYKT)
create table khoahoc(
    makh char(5) primary key,
    tenkh varchar(50) not null,
    ngaybd date not null,
    ngaykt date not null,
    constraint KH_CK check (ngaybd < ngaykt)
);
--2. CHUONGTRINH (MACT,TENCT)
create table chuongtrinh(
    mact char(5) primary key,
    tenct varchar(100) not null
);
--3. LOAILOP (MALOAI, MACT, TENLOAI)
create table loailop(
    maloai char(5) primary key,
    mact char(5) not null references chuongtrinh(mact),
    tenloai varchar(100) not null
);
--4. LOP (MALOP, MALOAI, TENLOP, SISO, MAKH)
create table lop(
    malop char(4) primary key,
    maloai char(5) not null references loailop(maloai),
    tenlop varchar(50) not null,
    siso smallint not null check (siso > 12),
    makh char(5) not null references khoahoc(makh)
);
--5. HOCVIEN (MAHV,TENHV,GIOITINH,NGAYSINH,SDT,DIACHI)
create table hocvien(
    mahv char(6) primary key,
    tenhv varchar(50) not null,
    gioitinh char(1) check (gioitinh in('0','1')),
    ngaysinh date not null,
    sdt char(10) not null,
    daichi varchar(100) not null
);
--6. PHIEUTHU(SOPT,MAHV, MALOP,NGAYLAPPHIEU,THANHTIEN)
create table phieuthu( 
    sopt char(8) primary key,
    mahv char(6) not null references hocvien(mahv),
    malop char(4) not null references lop(malop),
    ngaylapphieu date not null,
    thanhtien int not null check (thanhtien > 0)
);
--7. MONHOC (MAMH, TENMH)
create table monhoc(
    mamh char(5) primary key,
    tenmh varchar(20) not null
);
--8. DIEM (MAMH,MAHV,MALOP,DIEM)
create table diem(
    mamh char(5) references monhoc(mamh),
    mahv char(6) references hocvien(mahv),
    malop char(4) references lop(malop),
    primary key (mamh,mahv,malop),
    diem float check (diem between 0 and 10)
);


--cau 3
Insert Into phieuthu values('PT00008','HV0012','L001','2021-02-06',1350000);
-- không thêm dòng dữ liệu ('PT00008','HV0012','L001','2021-06-02',1350000) vào PHIEUTHU được vì khóa chính mahv trong bảng hocvien không có mahv nào = HV0012 ,dữ liệu thêm vào sẽ không hợp lệ.

--câu 4 Thêm dòng dữ liệu ('L004','LL002','Lớp 4',10,'K001') vào LOP ? Dòng này có thêm vào được không ? Giải thích tại sao ?
Insert Into lop(malop, maloai, siso, makh, tenlop) values ('L004','LL002','Lớp 4',10,'K001');

--Không thêm dòng dữ liệu này được vì vị trí các cột dữ liệu cần thêm không đúng với thứ tự các cột của bảng dẫn đến các kiểu dữ liệu không tương thích với nhau.

--Câu 5 Xóa khoá học có mã 'K001', khoá học này có xoá được không ? Giải thích tại sao ?
delete from khoahoc where makh ='K001';
-- Không xóa được mã K001 vì vi phạm tính toàn vẹn, mã K001 có  mặt trong bảng LOP  và đóng vai trò là khóa ngoại nên không thể xóa được

--câu 6. Xóa khoá học có mã 'K002', khoá học này có xoá được không ? Giải thích tại sao ?
delete from  khoahoc where makh ='K002';

--Xóa được mã khóa học K002 vì nó không vi phạm tính toàn vẹn, K002 không có mặt trong các bảng khác nên có thể xóa được mã này

--câu 7 Giảm giá trị cột thành tiền của phiếu thu 000001 xuống 10%
update phieuthu set thanhtien = thanhtien * 0.9 where sopt ='PT000001';
select from phieuthu;

--cau 8 Thêm vào quan hệ LOP cột hocphi và cập nhật giá trị cho cột này như sau:
--1) 1350000 cho loại lớp LL001
--2) 1650000 cho loại lớp LL002
ALTER TABLE lop
  ADD hocphi int;
update lop set hocphi = 1350000 where maloai = 'LL001';
update lop set hocphi = 1650000 where lower(maloai) = 'll002';
select * from  lop;


--Câu 9. Tạo bảng HOCVIEN_NAM(MAHV,TENHV,SDT,NGAYSINH,DIACHI), chỉ bao gồm các học viên giới tính nam (1)
create table hocvien_nam(
    mahv char(6) not null references hocvien(mahv),
    tenhv varchar(50) not null,
    sdt char(10) not null,
    ngaysinh date not null,
    diachi varchar(100) not null
);

--10. Lấy dữ liệu tự động từ bảng HOCVIEN thêm vào bảng HOCVIEN_NAM vừa tạo

Insert into hocvien_nam
    select mahv, tenhv, sdt, ngaysinh, diachi 
    from hocvien where gioitinh = '1';

select * from hocvien_nam;

--11. Xoá Bảng KHOAHOC, bảng này xoá được không ? Giải thích tại sao ?

drop table khoahoc;

--Không thể xóa được bảng khóa học vì vi phạm các ràng buộc, khóa chính makh của bảng KHOAHOC đang làm khóa ngoại cho bảng LOP nên không thể xóa bảng KHOAHOC

--12. Xoá bảng HOCVIEN_NAM bảng này xoá được không ? Giải thích tại sao ?
drop table hocvien_nam;

--Bảng HOCVIEN_NAM xóa được vì nó không bị các ràng buộc bởi các bảng còn lại

--13. Đổi kiểu dữ liệu của cột tenMH trong bảng MONHOC thành VARCHAR(100)

ALTER TABLE monhoc MODIFY tenmh VARCHAR(100);


--Xóa cột HOCPHI trong bảng LOP
ALTER TABLE LOP DROP COLUMN HOCPHI