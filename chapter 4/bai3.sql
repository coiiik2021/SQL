-- Tìm tên những nhân viên ở cơ quan có mã số là 50
SELECT NV.*
FROM NhanVien NV
WHERE NV.MSCoQuan = 50

-- Tìm mã số tất cả các cơ quan từ quan hệ NV
select NV.MSCoQuan
from NhanVien NV 
group by NV.MSCoQuan
--  Tìm tên các nhân viên ở cơ quan có mã số là 15,20,25
SELECT NV.Ten
FROM NhanVien NV
WHERE NV.MSCoQuan = 15
	or NV.MSCoQuan = 20
	or NV.MSCoQuan = 25

-- Tìm tên những người làm việc ở Đồ Sơn
SELECT NV.Ten
FROM NhanVien NV JOIN CoQuan CQ ON NV.MSCoQuan = CQ.MSCoQuan
WHERE CQ.DiaChi = N'Đồ Sơn'