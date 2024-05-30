-- Cho biết Địa chỉ và số điện thoại của Nhà xuất bản “Addison Wesley”
SELECT NXB.DiaChi, NXB.SoDT
FROM NXB
WHERE NXB.TenNXB = 'Addison Wesley'

-- Cho biết mã sách và Tựa sách của những cuốn sách được xuất bản bởi nhà xuất bản “Addison Wesley”
SELECT KQ1.MaSach, KQ1.Tua
FROM (SELECT DS.Tua, DS.MaSach
	FROM NXB, DauSach DS
	WHERE NXB.MaNXB = DS.MaNXB AND NXB.TenNXB = 'Addison Wesley') KQ1 

-- Cho biết mã sách và Tựa sách của những cuốn sách có tác giả là “Hemingway”
SELECT DS.MaSach, DS.Tua
FROM DauSach DS JOIN TacGia TG ON DS.MaSach = TG.MaSach
WHERE TG.TenTacGia = 'Hemingway'

--Với mỗi đầu sách, cho biết tựa và số lượng cuốn sách mà thư viện đang sở hữu

SELECT DS.Tua, COUNT(DS.MaSach) AS SL
FROM DauSach DS
GROUP BY DS.Tua

-- Với mỗi độc giả, hãy cho biết Tên, địa chỉ và số lượng cuốn sách mà người đó đã mượn

SELECT DG.TenDG, COUNT(M.MaCuon) AS SL
FROM DocGia DG LEFT JOIN Muon M ON DG.MaDG = M.MaDG
GROUP BY  DG.TenDG

-- Cho biết mã cuốn, tựa sách và vị trí của những cuốn sách được xuất bản bởi nhà xuất bản “Addison Wesley”

SELECT DS.MaSach, DS.Tua, CS.ViTri
FROM
	(SELECT DS.MaSach, DS.Tua
	FROM DauSach DS, NXB
	Where DS.MaNXB = NXB.MaNXB
	AND NXB.TenNXB = 'Addison Wesley') DS JOIN CuonSach CS ON DS.MaSach = CS.MaSach

-- Với mỗi đầu sách, hãy cho biết Tên nhà xuất bản và số lượng tác giả




-- Hãy cho biết Tên, địa chỉ, số điện thoại của những độc giả đã mượn từ 5 cuốn sách trở lên
 
 SELECT DG.TenDG, DG.DiaChi, DG.SoDT
 FROM DocGia DG JOIN Muon M ON DG.MaDG = M.MaDG
 GROUP BY DG.MaDG, DG.DiaChi, DG.SoDT, DG.TenDG
 Having count(M.MaCuon) >= 5;

 -- Cho biết mã NXB, tên NXB và số lượng đầu sách của NXB đó trong CSDL

 SELECT NXB.MaNXB, NXB.TenNXB, count(DS.MaNXB) as SL
 FROM NXB JOIN DauSach DS ON NXB.MaNXB = DS.MaNXB
 GROUP BY NXB.MaNXB, NXB.TenNXB
 -- Cho biết mã NXB, tên NXB và địa chỉ của những NXB có từ 100 đầu sách trở lên
SELECT NXB.MaNXB, NXB.TenNXB, count(DS.MaNXB) as SL
FROM NXB JOIN DauSach DS ON NXB.MaNXB = DS.MaNXB
GROUP BY NXB.MaNXB, NXB.TenNXB
HAVING COUNT(DS.MaNXB) > 100

--Cho biết mã NXB, tên NXB, và số lượng tác giả đã hợp tác với NXB đó
SELECT NXB.MaNXB, NXB.TenNXB, COUNT(DS.MaSach) AS SL
FROM DauSach DS JOIN NXB ON DS.MaNXB = NXB.MaNXB
GROUP BY NXB.MaNXB, NXB.TenNXB
-- Tựa và số lượng tác giả của những cuốn sách có tác giả là “Hemingway” mà độc giả “Nguyễn Văn A” đã từng mượn

SELECT KQ3.Tua, count(KQ2.MaSach) AS SL
FROM (
		SELECT CS.MaSach
		FROM (SELECT M.MaCuon
				FROM Muon M JOIN DocGia DG ON M.MaDG = DG.MaDG
				where DG.TenDG = N'Nguyễn Anh Mạnh') KQ1 JOIN CuonSach CS ON KQ1.MaCuon = CS.MaCuon ) KQ2
		JOIN (SELECT DS.MaSach, DS.Tua
				FROM TacGia TG JOIN DauSach DS ON TG.MaSach = DS.MaSach) KQ3
		ON KQ2.MaSach = KQ3.MaSach
Group BY KQ3.Tua

		
	



