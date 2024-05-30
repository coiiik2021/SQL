CREATE DATABASE BAI2
GO

USE BAI2
GO

CREATE TABLE dbo.NXB(
	MaNXB char(10) PRIMARY KEY,
	TenNXB nvarchar(20) NULL,
	DiaChi nvarchar(10) NULL,
	SoDT char(15) NULL,
)
GO

INSERT INTO NXB VALUES('NXB001', 'Addison Wesley', 'London', '0123456789')
INSERT INTO NXB VALUES('NXB002', 'Harry Poter', 'Sài Gòn', '03456789123')
INSERT INTO NXB VALUES('NXB003', N'Phạm Quốc Vương', 'London', '0192345678')
INSERT INTO NXB VALUES('NXB004', N'Ngô Quốc Huy', 'Sài Gòn', '0123223312')
GO
CREATE TABLE dbo.DauSach(
	MaSach char(10) PRIMARY KEY,
	Tua nvarchar(15) NULL,
	MaNXB char(10) references NXB(MaNXB)
)
GO
INSERT INTO DauSach Values('Sach001', N'Thuyết Minh', 'NXB001')
INSERT INTO DauSach Values('Sach002', N'Thuyết Minh', 'NXB002')
INSERT INTO DauSach Values('Sach003', N'Truyền Thuyết', 'NXB001')
INSERT INTO DauSach Values('Sach004', N'Thuyết Minh', 'NXB003')
INSERT INTO DauSach Values('Sach005', N'Từ Sự', 'NXB004')
INSERT INTO DauSach Values('Sach006', N'Kịch', 'NXB004')
GO
CREATE TABLE dbo.TacGia(
	MaSach char (10) references DauSach(MaSach),
	TenTacGia nvarchar (20) NOT NULL,
	PRIMARY KEY(MaSach, TenTacGia)
)
GO
INSERT INTO TacGia Values('Sach001', 'Hemingway')
INSERT INTO TacGia Values('Sach002', N'Phún Khoắn Vồ')
INSERT INTO TacGia Values('Sach003', 'Hemingway')
INSERT INTO TacGia Values('Sach004', 'Hemingway')
INSERT INTO TacGia Values('Sach005', 'Jason')
INSERT INTO TacGia Values('Sach006', 'Nguyễn ANh Dũng')
GO
CREATE TABLE dbo.CuonSach(
	MaSach char(10) references DauSach(MaSach),
	MaCuon char(10) PRIMARY KEY,
	ViTri char(10)
)
GO
INSERT INTO CuonSach Values('Sach005', 'MaCuon001','KhuC')
INSERT INTO CuonSach Values('Sach006', 'MaCuon002','KhuA')
INSERT INTO CuonSach Values('Sach001', 'MaCuon003','KhuB')
INSERT INTO CuonSach Values('Sach002', 'MaCuon004','KhuD')
INSERT INTO CuonSach Values('Sach003', 'MaCuon005','KhuE')
INSERT INTO CuonSach Values('Sach004', 'MaCuon006','KhuA')
GO
CREATE TABLE dbo.DocGia(
	MaDG char(10) PRIMARY KEY,
	TenDG nvarchar(20),
	DiaChi nvarchar(10),
	SoDT char(15)
)
GO
INSERT INTO DocGia Values('DG001', N'Phạm Minh Huy', N'Gò vấp', '011123123')
INSERT INTO DocGia Values('DG002', N'Nguyễn Anh Mạnh', N'Thủ Đức', '011231231')
INSERT INTO DocGia Values('DG003', N'Nguyễn Chi Huy', N'Quận 8', '0111456781')
GO

CREATE TABLE Muon(
	MaCuon char(10) references CuonSach(MaCuon),
	MaDG char(10) references DocGia(MaDG),
	NgayMuon date NULL,
	NgayTra date NULL,
	PRIMARY KEY(MaCuon, MADG)
)
GO
INSERT INTO Muon Values('MaCuon001', 'DG001', '2019-11-11', '2020-5-12')
INSERT INTO Muon Values('MaCuon002', 'DG001', '2019-11-11', '2020-5-12')
INSERT INTO Muon Values('MaCuon003', 'DG002', '2019-1-11', '2019-5-12')
INSERT INTO Muon Values('MaCuon004', 'DG002', '2019-1-11', '2019-5-12')
INSERT INTO Muon Values('MaCuon005', 'DG003', '2021-7-11', '2022-6-12')
INSERT INTO Muon Values('MaCuon006', 'DG003', '2021-7-11', '2022-6-12')

GO
