USE QuanLyDiemSV;

/* 1. Liệt kê danh sách sinh viên, gồm các thông tin sau: Mã sinh viên, Họ sinh
viên, Tên sinh viên, Học bổng. Danh sách sẽ được sắp xếp theo thứ tự Mã
sinh viên tăng dần */
SELECT MaSV, HoSV, TenSV, HocBong
FROM DMSV
ORDER BY MaSV;

/* 2. Danh sách các sinh viên gồm thông tin sau: Mã sinh viên, họ tên sinh viên,
Phái, Ngày sinh. Danh sách sẽ được sắp xếp theo thứ tự Nam/Nữ.*/
SELECT MaSV, CONCAT(HoSV, ' ', TenSV) AS HoTenSV, Phai, NgaySinh
FROM DMSV
ORDER BY FIELD(Phai, 'Nam', 'Nữ');

/* 3. Thông tin các sinh viên gồm: Họ tên sinh viên, Ngày sinh, Học bổng. Thông
tin sẽ được sắp xếp theo thứ tự Ngày sinh tăng dần và Học bổng giảm dần.*/
SELECT CONCAT(HoSV, ' ', TenSV) AS HoTenSV, NgaySinh, HocBong
FROM DMSV
ORDER BY NgaySinh, HocBong DESC;

/* 4. Danh sách các môn học có tên bắt đầu bằng chữ T, gồm các thông tin: Mã
môn, Tên môn, Số tiết.*/
SELECT MaMH, TenMH, SoTiet
FROM DMMH
WHERE TenMH LIKE 'T%'
ORDER BY TenMH;

/* 5. Liệt kê danh sách những sinh viên có chữ cái cuối cùng trong tên là I, gồm
các thông tin: Họ tên sinh viên, Ngày sinh, Phái.*/
SELECT CONCAT(HoSV, ' ', TenSV) AS HoTenSV, NgaySinh, Phai
FROM DMSV
WHERE SUBSTRING(TenSV, -1) = 'I';

/* 6. Danh sách những khoa có ký tự thứ hai của tên khoa có chứa chữ N, gồm
các thông tin: Mã khoa, Tên khoa*/
SELECT MaKhoa, TenKhoa
FROM DMKhoa
WHERE SUBSTRING(TenKhoa, 2, 1) = 'N';

/* 7. Liệt kê những sinh viên mà họ có chứa chữ Thị.*/
SELECT CONCAT(HoSV, ' ', TenSV) AS HoTenSV, NgaySinh, Phai
FROM DMSV
WHERE HoSV LIKE '%Thị%';

/* 8. Cho biết danh sách các sinh viên có học bổng lớn hơn 100,000, gồm các
thông tin: Mã sinh viên, Họ tên sinh viên, Mã khoa, Học bổng. Danh sách sẽ
được sắp xếp theo thứ tự Mã khoa giảm dần*/
SELECT DMSV.MaSV, CONCAT(HoSV, ' ', TenSV) AS HoTenSV, DMSV.MaKhoa, HocBong
FROM DMSV
         JOIN DMKhoa ON DMSV.MaKhoa = DMKhoa.MaKhoa
WHERE HocBong > 100000
ORDER BY DMKhoa.MaKhoa DESC;

/* 9. Liệt kê các sinh viên có học bổng từ 150,000 trở lên và sinh ở Hà Nội, gồm
các thông tin: Họ tên sinh viên, Mã khoa, Nơi sinh, Học bổng.*/
SELECT CONCAT(HoSV, ' ', TenSV) AS HoTenSV, DMSV.MaKhoa, NoiSinh, HocBong
FROM DMSV
         JOIN DMKhoa ON DMSV.MaKhoa = DMKhoa.MaKhoa
WHERE HocBong >= 150000 AND NoiSinh LIKE '%Hà Nội%';

/* 10. Danh sách các sinh viên của khoa Anh văn và khoa Vật lý, gồm các thông
tin: Mã sinh viên, Mã khoa, Phái.*/
SELECT DMSV.MaSV, DMSV.MaKhoa, DMSV.Phai
FROM DMSV
         JOIN DMKhoa ON DMSV.MaKhoa = DMKhoa.MaKhoa
WHERE DMKhoa.TenKhoa IN ('Anh văn', 'Vật lý');

/* 11. Cho biết những sinh viên có ngày sinh từ ngày 01/01/1991 đến ngày
05/06/1992 gồm các thông tin: Mã sinh viên, Ngày sinh, Nơi sinh, Học
bổng.*/
SELECT MaSV, NgaySinh, NoiSinh, HocBong
FROM DMSV
WHERE NgaySinh BETWEEN '1991-01-01' AND '1992-06-05';

/* 12. Danh sách những sinh viên có học bổng từ 80.000 đến 150.000, gồm các
thông tin: Mã sinh viên, Ngày sinh, Phái, Mã khoa.*/
SELECT MaSV, NgaySinh, Phai, MaKhoa
FROM DMSV
WHERE HocBong BETWEEN 80000 AND 150000;

/* 13. Cho biết những môn học có số tiết lớn hơn 30 và nhỏ hơn 45, gồm các thông
tin: Mã môn học, Tên môn học, Số tiết.*/
SELECT MaMH, TenMH, SoTiet
FROM DMMH
WHERE SoTiet > 30 AND SoTiet < 45;

/* 14. Liệt kê những sinh viên nam của khoa Anh văn và khoa tin học, gồm các
thông tin: Mã sinh viên, Họ tên sinh viên, tên khoa, Phái.*/
SELECT DMSV.MaSV, CONCAT(DMSV.HoSV, ' ', DMSV.TenSV) AS HoTenSV, DMKhoa.TenKhoa, DMSV.Phai
FROM DMSV
         JOIN DMKhoa ON DMSV.MaKhoa = DMKhoa.MaKhoa
WHERE DMSV.Phai = 'Nam' AND DMKhoa.TenKhoa IN ('Anh văn', 'Tin học');

/* 15. Liệt kê những sinh viên nữ, tên có chứa chữ N*/
SELECT MaSV, CONCAT(HoSV, ' ', TenSV) AS HoTenSV, Phai
FROM DMSV
WHERE Phai = 'Nữ' AND TenSV LIKE '%N%';

/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
/* 1.*/
