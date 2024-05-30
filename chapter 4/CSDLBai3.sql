CREATE DATABASE BAI3
GO
USE BAI3
GO

CREATE TABLE dbo.CoQuan(
    MSCoQuan int PRIMARY KEY,
    TenCoQuan nvarchar(20) NOT NULL,
    DiaChi nvarchar(20) NOT NULL
)
Go
INSERT INTO CoQuan VALUES(10, N'Xưởng Mỹ Tho', N'Mỹ Tho')
INSERT INTO CoQuan VALUES(15, N'Xưởng Phú Quốc', N'Phú Quốc')
INSERT INTO CoQuan VALUES(20, N'Xưởng Đồ Sơn', N'Đồ Sơn')
INSERT INTO CoQuan VALUES(25, N'Xưởng KonTum', N'KonTum')
INSERT INTO CoQuan VALUES(30, N'Xưởng Sài Gòn', N'Sài Gòn')

GO
CREATE TABLE NhanVien(
    MSNV int PRIMARY KEY,
    Ten nvarchar(20) NOT NULL,
    MSCoQuan int references CoQuan(MSCoQuan),
    CongViec nvarchar(20) NOT NULL,
    luong MONEY 
)
GO
INSERT INTO NhanVien Values(1, N'Phạm Minh Huy', 10, N'Xếp Hàng', '10000000')
INSERT INTO NhanVien Values(2, N'Phạm Duy Linh', 10, N'Thu Ngân', '8000000')
INSERT INTO NhanVien Values(3, N'Nguyễn Hiếu Hiền', 10, N'Chở hàng', '12000000')
INSERT INTO NhanVien Values(4, N'Lã Giang Hương', 15, N'Xếp Hàng', '10000000')
INSERT INTO NhanVien Values(5, N'Trúc Quỳnh', 15, N'Thu Ngân', '8000000')
INSERT INTO NhanVien Values(6, N'Phạm văn Bá', 15, N'Chở hàng', '12000000')
INSERT INTO NhanVien Values(7, N'Quốc Huy', 20, N'Xếp Hàng', '10000000')
INSERT INTO NhanVien Values(8, N'Hương Giang', 20, N'Thu Ngân', '8000000')
INSERT INTO NhanVien Values(9, N'Bá Văn', 20, N'Chở hàng', '12000000')
INSERT INTO NhanVien Values(10, N'Bùi Quang Huy', 25, N'Xếp Hàng', '10000000')
INSERT INTO NhanVien Values(11, N'Trúc Phượng', 25, N'Thu Ngân', '8000000')
INSERT INTO NhanVien Values(12, N'Gia Nhanh', 25, N'Chở hàng', '12000000')
INSERT INTO NhanVien Values(13, N'Bùi Nhật Phước', 30, N'Xếp Hàng', '10000000')
INSERT INTO NhanVien Values(14, N'Trúc Linh', 30, N'Thu Ngân', '8000000')
INSERT INTO NhanVien Values(15, N'Huỳnh Phước Hậu', 30, N'Chở hàng', '12000000')
