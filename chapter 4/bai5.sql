-- Danh sách các giáo viên dạy các môn học có số tiết từ 45 trở lên
SELECT GV.TenGV
FROM GV JOIN MHoc MH ON GV.MaMH = MH.MaMH
WHERE MH.SoTiet >= 45

-- Danh sách giáo viên được phân công gác thi trong học kỳ 1

SELECT GV.TenGV
FROM GV JOIN PC_Coi_Thi ON GV.MaGV = PC_Coi_Thi.MaGV
WHERE PC_Coi_Thi.HKy = 'HK1'

-- Danh sách giáo viên không được phân công gác thi trong học kỳ 1
SELECT GV.TenGV
FROM GV
WHERE GV.MaGV NOT IN (
SELECT GV.MaGV
FROM GV JOIN PC_Coi_Thi ON GV.MaGV = PC_Coi_Thi.MaGV
WHERE PC_Coi_Thi.HKy = 'HK1')

-- Cho biết lịch thi môn văn (TENMH = ‘VĂN HỌC’)

SELECT BT.*
FROM BuoiThi BT JOIN MHoc MH ON BT.MaMH = MH.MaMH
WHERE MH.TenMH = N'VĂN HỌC'

--  Cho biết các buổi gác thi của các giáo viên chủ nhiệm môn văn (TENMH = ‘VĂN HỌC’)

SELECT KQ1.TenGV
FROM (SELECT GV.*, MH.TenMH 
		FROM GV JOIN MHoc MH ON GV.MaMH = MH.MaMH
		WHERE MH.TenMH = N'VĂN HỌC') KQ1 JOIN PC_Coi_Thi PC ON KQ1.MaGV = PC.MaGV
WHERE KQ1.TenMH = N'VĂN HỌC'

