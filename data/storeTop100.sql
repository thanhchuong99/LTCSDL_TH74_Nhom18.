USE [QL_DIEM]
GO
/****** Object:  StoredProcedure [dbo].[top100]    Script Date: 2020-05-15 10:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [dbo].[top100]
	-- Add the parameters for the stored procedure here
	@monhoc nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	if(@monhoc = 'Toán')
	begin
	SELECT top(100) d.*,[Điểm KHTN] = cast(Round(((d.DiemSinh + d.DiemHoa + d.DiemLy)/3),2) as decimal(16,2)),[Điểm KHXH] = cast(Round(((d.DiemSu + d.DiemDia + d.DiemGDCD)/3),2) as decimal(16,2)) from ThiSinh ts inner join Diem d on ts.SoBaoDanh = d.SoBaoDanh 
	order by DiemToan DESC 
	end
	if(@monhoc = 'Ngoại Ngữ')
	begin
	SELECT top(100) d.*,[Điểm KHTN] = cast(Round(((d.DiemSinh + d.DiemHoa + d.DiemLy)/3),2) as decimal(16,2)),[Điểm KHXH] = cast(Round(((d.DiemSu + d.DiemDia + d.DiemGDCD)/3),2) as decimal(16,2)) from ThiSinh ts inner join Diem d on ts.SoBaoDanh = d.SoBaoDanh 
	order by DiemNgoaiNgu DESC 
	end
	if(@monhoc = 'Ngữ Văn')
	begin
	SELECT top(100) d.*,[Điểm KHTN] = cast(Round(((d.DiemSinh + d.DiemHoa + d.DiemLy)/3),2) as decimal(16,2)),[Điểm KHXH] = cast(Round(((d.DiemSu + d.DiemDia + d.DiemGDCD)/3),2) as decimal(16,2)) from ThiSinh ts inner join Diem d on ts.SoBaoDanh = d.SoBaoDanh 
	order by DiemVan DESC 
	end
	if(@monhoc = 'Hoá')
	begin
	SELECT top(100) d.*,[Điểm KHTN] = cast(Round(((d.DiemSinh + d.DiemHoa + d.DiemLy)/3),2) as decimal(16,2)) from ThiSinh ts inner join Diem d on ts.SoBaoDanh = d.SoBaoDanh
	where DiemHoa is not null
	order by DiemHoa DESC 
	end
	if(@monhoc = 'Vật Lý')
	begin
	SELECT top(100) d.*,[Điểm KHTN] = cast(Round(((d.DiemSinh + d.DiemHoa + d.DiemLy)/3),2) as decimal(16,2)) from ThiSinh ts inner join Diem d on ts.SoBaoDanh = d.SoBaoDanh 
	where DiemLy is not null
	order by DiemLy DESC 
	end
	if(@monhoc = 'Sinh Học')
	begin
	SELECT top(100) d.*,[Điểm KHTN] = cast(Round(((d.DiemSinh + d.DiemHoa + d.DiemLy)/3),2) as decimal(16,2)) from ThiSinh ts inner join Diem d on ts.SoBaoDanh = d.SoBaoDanh 
	where DiemSinh is not null
	order by DiemSinh DESC 
	end
	if(@monhoc = 'KHTN')
	begin
	SELECT top(100) d.*,[Điểm KHTN] = cast(Round(((d.DiemSinh + d.DiemHoa + d.DiemLy)/3),2) as decimal(16,2)) from ThiSinh ts inner join Diem d on ts.SoBaoDanh = d.SoBaoDanh 
	where (DiemHoa is not null) and (DiemSinh is not null) and (DiemLy is not null)
	order by [Điểm KHTN] DESC 
	end
	if(@monhoc = 'Lịch Sử')
	begin
	SELECT top(100) d.*,[Điểm KHXH] = cast(Round(((d.DiemDia + d.DiemGDCD + d.DiemSu)/3),2) as decimal(16,2)) from ThiSinh ts inner join Diem d on ts.SoBaoDanh = d.SoBaoDanh 
	where DiemSu is not null
	order by DiemSu DESC 
	end
	if(@monhoc = 'Địa Lý')
	begin
	SELECT top(100) d.*,[Điểm KHXH] = cast(Round(((d.DiemDia + d.DiemGDCD + d.DiemSu)/3),2) as decimal(16,2)) from ThiSinh ts inner join Diem d on ts.SoBaoDanh = d.SoBaoDanh 
	where DiemDia is not null
	order by DiemDia DESC 
	end
	if(@monhoc = 'GDCD')
	begin
	SELECT top(100) d.*,[Điểm KHXH] = cast(Round(((d.DiemDia + d.DiemGDCD + d.DiemSu)/3),2) as decimal(16,2)) from ThiSinh ts inner join Diem d on ts.SoBaoDanh = d.SoBaoDanh 
	where DiemGDCD is not null
	order by DiemGDCD DESC 
	end
	if(@monhoc = 'KHXH')
	begin
	SELECT top(100) d.*,[Điểm KHXH] = cast(Round(((d.DiemDia + d.DiemGDCD + d.DiemSu)/3),2) as decimal(16,2)) from ThiSinh ts inner join Diem d on ts.SoBaoDanh = d.SoBaoDanh 
	where (DiemSu is not null) and (DiemGDCD is not null) and (DiemDia is not null)
	order by [Điểm KHXH] DESC 
	end
END
