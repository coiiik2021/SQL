--Cho biết danh sách các người thợ hiện không tham gia vào một hợp đồng sửa chữa nào

SELECT T.TenTho
FROM Tho T INNER JOIN ChiTietHD CT ON T.MaTho = CT.MaTho
WHERE T.MaTho IS NULL

-- Cho biết danh sách những hợp đồng đã thanh lý nhưng chưa được thanh toán tiền đầy đủ.

SELECT HD.*
FROM HopDong HD JOIN PhieuThu PT ON HD.SoHD = PT.SoHD
WHERE PT.SoHD is NULL 

-- Cho biết danh sách những hợp đồng cần phải hoàn tất trước ngày 31/12/2002
SELECT HD.*
FROM HopDong HD
WHERE HD.NgayNgThu < '2002-12-31'

--  Cho biết người thợ nào thực hiện công việc nhiều nhất.

SELECT Tho.MaTho, TenTho, COUNT(ChiTietHD.SoHD)
FROM Tho JOIN ChiTietHD ON Tho.MaTho = ChiTietHD.MaTho
Group BY Tho.MaTho, Tho.TenTho
Having COUNT(ChiTietHD.SoHD) = (
								SELECT MAX(SL)
								FROM (SELECT COUNT(HD.SoHD) SL
									FROM Tho T JOIN ChiTietHD HD ON T.MaTho = HD.MaTho
									Group BY T.MaTho) KQ
									)

--Cho biết người thợ nào có tổng trị giá công việc được giao cao nhất.


SELECT T.MaTho, T.TenTho, Sum(HD.TriGiaCV) AS Tien
FROM Tho T JOIN ChiTietHD HD ON T.MaTho = HD.MaTho
Group By T.MaTho, T.TenTho
Having  Sum(HD.TriGiaCV) = (
							SELECT MAX(Tien)
							FROM (SELECT Sum(HD.TriGiaCV) AS Tien
									FROM Tho T JOIN ChiTietHD HD ON T.MaTho = HD.MaTho
									Group By T.MaTho) KQ
							)