USE QLNV1 
-- Hãy cho biết tên các dự án mà nhân viên có mã ‘NV01’ tham gia
SELECT DA.*
FROM DUAN DA
	left JOIN PhanCong PC 
	ON DA.MaDA = PC.MaDA
where PC.MaNV = 'nv01';

--Tính tổng thời gian tham gia các dự án của mỗi nhân viên
SELECT  MaNV,SUM(ThoiGian) as tg
FROM PhanCong as PC
group by MaNV

-- Cho biết họ tên các nhân viên chưa tham gia dự án nào
SELECT nv.*
FROM NhanVien nv left JOIN PhanCong pc on nv.Manv = pc.MaNV
where pc.Manv is NULL

--Tìm ngày sinh và địa chỉ của nhân viên “Nguyễn Bảo Hùng”
SELECT nv.NgSinh, nv.Dchi
FROM NhanVien nv
where nv.HoNV = N'Nguyen'
	and nv.Tenlot = N'Bao'
	and nv.tenNV = N'Hung'

--Tìm tên và địa chỉ của các nhân viên làm việc cho phòng “Nghiên cứu”
SELECT nv.tenNV, nv.Dchi
FROM NhanVien nv left JOIN PhongBan pb on nv.Phong = pb.MaPB
where pb.TenPB like 'Nghien cuu'

-- Với mỗi dự án được triển khai ở Gò Vấp, cho biết mã dự án, mã phòng quản lý và họ tên, ngày sinh trưởng phòng của phòng đó
SELECT DA.MaDA, PB.TrPhong,
	NV.HoNV + ' ' + NV.Tenlot + ' ' + NV.tenNV as TenTruongPhong,
	nv.NgSinh
FROM DUAN DA, NhanVien NV, PhongBan PB
where DA.Phong = PB.MaPB
	AND PB.TrPhong = NV.Manv

--Với mỗi nhân viên, cho biết họ tên nhân viên và họ tên của người quản lý nhân viên đó
SELECT NV.HoNV + ' ' + NV.Tenlot + ' ' + NV.tenNV as TenNV,
	QL.HoNV + ' ' + QL.Tenlot + ' ' + QL.tenNV as TenQL
FROM NhanVien NV, NhanVien QL
WHERE NV.MaNQL = QL.Manv
	AND NV.MaNQL is not null

-- Cho biết mã nhân viên, họ và tên của các nhân viên của phòng “Nghiên cứu” có mức lương từ 30000 đến 50000

SELECT NV.Manv,
	NV.HoNV + ' ' + NV.Tenlot + ' ' + NV.tenNV as TenNV
FROM NhanVien NV, PhongBan PB
WHERE NV.Phong = PB.MaPB and 
NV.Luong Between  30000 and 50000

--Cho biết mã nhân viên, họ tên nhân viên và mã dự án, tên dự án của các dự án mà họ tham gia

SELECT NV.Manv,
	NV.HoNV + ' ' + NV.Tenlot + ' ' + NV.tenNV as TenNV,
	DA.MaDA,
	DA.TenDA
FROM NhanVien NV, PhanCong PC, DUAN DA
WHERE PC.MaNV = NV.Manv AND PC.MaDA = DA.MaDA

-- Cho biết mã nhân viên, họ tên của những người không có người quản lý

SELECT NV.Manv,
	NV.HoNV + ' ' + NV.Tenlot + ' ' + NV.tenNV as TenNV
FROM NhanVien NV
WHERE NV.MaNQL is NULL

-- Cho biết họ tên của các trưởng phòng có thân nhân

SELECT QL.HoNV + ' ' + QL.Tenlot + ' ' + QL.tenNV as TenQL
FROM NhanVien QL
where QL.Manv in(
	SELECT TN.MaNV
	FROM ThanNhan TN
	WHERE TN.MaNV IN(
		SELECT NV.MaNQL
		FROM NhanVien NV
		GROUP BY NV.MaNQL))


--Tính tổng lương nhân viên, lương cao nhất, lương thấp nhất và mức lương trung bình

SELECT SUM(nv.luong) as Tong,
		MAX(nv.luong) as Max,
		MIN(nv.luong) as Min,
		AVG(nv.luong) as Trungbinh
FROM NhanVien NV

-- Cho biết tổng số nhân viên và mức lương trung bình của phòng “Nghiên cứu”

SELECT COUNT(NV.MaNV) as TongNV,
	AVG(NV.luong) as TBLuong
FROM NhanVien NV, PhongBan PB
Where NV.Phong = PB.MaPB and PB.TenPB = 'Nghien Cuu'


-- Với mỗi phòng, cho biết mã phòng, số lượng nhân viên và mức lương trung bình

SELECT PB.MaPB, COUNT(NV.maNV) as SL, AVG(NV.luong) as LuongTB

FROM NhanVien NV, PhongBan PB
Where NV.Phong = PB.MaPB
GROUP BY PB.MaPB

--  Với mỗi dự án, cho biết mã dự án, tên dự án và tổng số nhân viên tham gia

SELECT DA.MaDA, DA.TenDA, COUNT(PC.MaNV) AS SL
FROM DUAN DA, PhanCong PC
WHERE DA.MaDA = PC.MaDA
GROUP BY DA.MaDA, DA.TenDA

-- Với mỗi dự án có nhiều hơn 2 nhân viên tham gia, cho biết mã dự án, tên dự án và số lượng nhân viên tham gia

SELECT DA.MaDA, DA.TenDA, COUNT(PC.MaNV) AS SL
FROM DUAN DA, PhanCong PC
WHERE DA.MaDA = PC.MaDA
GROUP BY DA.MaDA, DA.TenDA
HAVING COUNT(PC.MaNV) >= 2

-- Với mỗi dự án, cho biết mã số dự án, tên dự án và số lượng nhân viên phòng số 5 tham gia

SELECT DA.MaDA,DA.TenDA, COUNT(NV.MaNV) AS SLNVPhong5
FROM
	DUAN DA LEFT JOIN PhanCong PC ON DA.MaDA = PC.MaDA 
	LEFT JOIN
	(SELECT NV.*
	FROM NhanVien NV
	where NV.Phong = 5) NV ON NV.Manv = PC.MaNV
GROUP BY DA.MaDA, DA.TenDA

-- Với mỗi phòng có nhiều hơn 2 nhân viên, cho biết mã phòng và số lượng nhân viên có lương lớn hơn 25000
SELECT NV.*
FROM NhanVien NV JOIN
	(SELECT PB.MaPB
	FROM NhanVien NV, PhongBan PB
	Where NV.Phong = PB.MaPB
	Group BY PB.MaPB, PB.TenPB
	HAVING COUNT(NV.Manv) >= 2
	) PB ON NV.Phong = PB.MaPB
Where NV.Luong > 25000
-- Với mỗi phòng có mức lương trung bình lớn hơn 30000, cho biết mã phòng, tên phòng, số lượng nhân viên của phòng đó

SELECT PB.MaPB, PB.TenPB, COUNT(NV.MaNV)
FROM NhanVien NV, PhongBan PB
WHERE NV.Phong = PB.MaPB
GROUP BY PB.MaPB, PB.TenPB
Having AVG(NV.Luong) >= 30000

SELECT kq.MaPB, kq.TenPB, kq.SL
FROM (
	SELECT PB.MaPB, PB.TenPB, COUNT(NV.MaNV) as SL , AVG(NV.Luong) as TienTB
	FROM NhanVien NV, PhongBan PB
	Where NV.Phong = PB.MaPB
	Group BY PB.MaPB, PB.TenPB) kq 
WHERE TienTB>30000

--Với mỗi phòng có mức lương trung bình lớn hơn 30000, cho biết mã phòng, tên phòng, số lượng nhân viên nam của phòng đó

SELECT kq.MaPB, kq.TenPB, kq.SoNVNam
FROM (
	SELECT PB.MaPB, PB.TenPB, COUNT(NV.Manv) as SoNVNam
	FROM (SELECT NV.*
		FROM NhanVien NV 
		WHERE NV.Phai = 'Nam') NV, PhongBan PB
	Where NV.Phong = PB.MaPB
	Group BY PB.MaPB, PB.TenPB
	Having AVG(NV.Luong) > 30000) kq

