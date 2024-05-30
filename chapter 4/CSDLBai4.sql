CREATE DATABASE BAI4
GO 

USE BAI4
GO 

CREATE TABLE dbo.Tho(
	MaTho char PRIMARY KEY,
	TenTho nvarchar(20) NOT NULL,
	Nhom char NOT NULL,
	NhomTruong char NULL
)
GO

INSERT INTO Tho Values('1', N'Nguyễn Anh Dũng', '1', '3')
INSERT INTO Tho Values('2', N'Phạm Mạnh HUy', '2', '8')
INSERT INTO Tho Values('3', N'Phún Khoắn Vồ', '1', NULL)
INSERT INTO Tho Values('4', N'Quốc Vương', '1', '3')
INSERT INTO Tho Values('5', N'Anh Duy', '2', '8')
INSERT INTO Tho Values('6', N'Quốc Bảo', '1', '3')
INSERT INTO Tho Values('7', N'Tiến HUy', '2', '8')
INSERT INTO Tho Values('8', N'Lâm Hoàng', '2', NULL)
GO

CREATE TABLE dbo.CongViec(
	MaCV char(10) PRIMARY KEY,
	NoiDungCV nvarchar(40) NOT NULL
)
GO

INSERT INTO CongViec VALUES('CV001', N'Thay Nhớt')
INSERT INTO CongViec VALUES('CV002', N'Sửa chữa phần thân máy')
INSERT INTO CongViec VALUES('CV003', N'Sửa chữa các mạch của xe')
INSERT INTO CongViec VALUES('CV004', N'Kiểm tra các đồ điện tử trong xe')
GO

CREATE TABLE dbo.KhachHang(
	MaKH char(10) PRIMARY KEY,
	TenKH nvarchar(20) NOT NULL,
	DiaChi nVarchar(20) NOT NULL,
	DienThoai char(10) NOT NULL
	
)
GO
INSERT INTO KhachHang VALUES('KH001', N'Phạm Quốc Vương', N'484 Lê Văn Việt','0123456789')
INSERT INTO KhachHang VALUES('KH002', N'Phạm Quốc Huy', N'Chung Cư GigaMall','0345123678')
INSERT INTO KhachHang VALUES('KH003', N'Lã Giang Hương', N'120 Hoàng Diệu 2','0876123153')
INSERT INTO KhachHang VALUES('KH004', N'Phan Hoàng Quý', N'123 Lê Văn Việt','0123153123')
INSERT INTO KhachHang VALUES('KH005', N'Nguyễn Phú Tài', N'20 Võ Văn Ngân','0123145123')
INSERT INTO KhachHang VALUES('KH006', N'Trần Cung Bắc', N'20 Đặng Văn Bi','0981235123')
INSERT INTO KhachHang VALUES('KH007', N'Nguyễn Thị Diệu Liên', N'484 Lê Văn Việt','0812397651')
INSERT INTO KhachHang VALUES('KH008', N'Nguyễn Huy Hòa', N'484 Lê Văn Việt','0123123122')

GO

CREATE TABLE dbo.HopDong(
	SoHD char(10) PRIMARY KEY,
	NgayHD date,
	MaKH char(10) references KhachHang(MaKH),
	SoXe char(10) NOT NULL ,
	TriGiaHD MONEY,
	NgayGiaoDK date,
	NgayNgThu date
)
GO

INSERT INTO HopDong VALUES('HD001', '2021-12-8', 'KH001', '12E1-12318', '120000', '2021-12-10', '2021-12-10')
INSERT INTO HopDong VALUES('HD002', '2021-12-15', 'KH002', '13A1-43141', '250000', '2021-12-16', '2021-12-17')
INSERT INTO HopDong VALUES('HD003', '2021-12-16', 'KH003', '59E1-19812', '100000', '2021-12-17', '2021-12-17')
INSERT INTO HopDong VALUES('HD004', '2021-12-20', 'KH004', '59A1-51231', '500000', '2021-12-25', '2021-12-25')
INSERT INTO HopDong VALUES('HD005', '2021-12-24', 'KH005', '54V1-81235', '720000', '2021-12-27', '2021-12-27')
INSERT INTO HopDong VALUES('HD006', '2021-12-28', 'KH006', '59A1-51241', '220000', '2021-12-30', '2021-12-30')
INSERT INTO HopDong VALUES('HD007', '2021-12-30', 'KH007', '42A1-12565', '550000', '2022-1-3', '2022-1-3')
INSERT INTO HopDong VALUES('HD008', '2022-1-4', 'KH008', '12V1-61341', '380000', '2022-1-7', '2022-1-7')

GO

-- CHITIET_HD(SoHD, MaCV, TriGiaCV, MaTho, KhoanTHo)

CREATE TABLE ChiTietHD(
	SoHD char(10) references HopDong(SoHD),
	MaCV char(10) references CongViec(MaCV),
	TriGiaCV MONEY,
	MaTho char references Tho(MaTho),
	KhoanTho MONEY
	PRIMARY KEY (SoHD, MaCV, MaTho)
)

GO
INSERT INTO ChiTietHD values('HD001', 'CV001', '80000', '1', '10000')
INSERT INTO ChiTietHD values('HD001', 'CV003', '20000', '4', '10000')
INSERT INTO ChiTietHD values('HD002', 'CV002', '200000', '2', '50000')
INSERT INTO ChiTietHD values('HD003', 'CV003', '80000', '3', '20000')
INSERT INTO ChiTietHD values('HD004', 'CV003', '400000', '4', '100000')
INSERT INTO ChiTietHD values('HD005', 'CV001', '600000', '5', '120000')
INSERT INTO ChiTietHD values('HD006', 'CV002', '200000', '6', '20000')
INSERT INTO ChiTietHD values('HD007', 'CV003', '500000', '7', '50000')
INSERT INTO ChiTietHD values('HD008', 'CV002', '250000', '8', '40000')
INSERT INTO ChiTietHD values('HD008', 'CV001', '80000', '8', '10000')
GO

-- PHIEUTHU(SoPT, NgaylapPT, SoHD, MaKH, HoTen, SoTienThu)

CREATE TABLE PhieuThu(
	SoPT char(10) PRIMARY KEY,
	NgayLapPT date,
	SoHD char(10) references HopDong(SoHD),
	MaKH char(10) references KhachHang(MaKH),
	HoTen nvarchar(20) NOT NULL,
	SoTienThu MONEY 
)

GO
INSERT INTO PhieuThu Values('PT001', '2021-12-10', 'HD001', 'KH001', N'Phạm Quốc Vương', '120000')
INSERT INTO PhieuThu Values('PT002', '2021-12-16', 'HD002', 'KH002',N'Phạm Quốc Huy', '250000')
INSERT INTO PhieuThu Values('PT003', '2021-12-17', 'HD003', 'KH003', N'Lã Giang Hương', '100000')
INSERT INTO PhieuThu Values('PT004', '2021-12-25', 'HD004', 'KH004', N'Phan Hoàng Quý', '500000')
INSERT INTO PhieuThu Values('PT005', '2021-12-27', 'HD005', 'KH005', N'Nguyễn Phú Tài', '720000')
INSERT INTO PhieuThu Values('PT006', '2021-12-30', 'HD006', 'KH006', N'Trần Cung Bắc', '220000')
INSERT INTO PhieuThu Values('PT007', '2022-1-3', 'HD007', 'KH007', N'Nguyễn Anh Dũng', '550000')
INSERT INTO PhieuThu Values('PT008', '2022-1-7', 'HD008', 'KH008', N'Nguyễn Huy Hòa', '380000')

GO

