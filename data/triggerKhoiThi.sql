USE [QL_DIEM]
GO
/****** Object:  Trigger [dbo].[triggerKhoiThi]    Script Date: 2020-05-09 1:52:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALter TRIGGER [dbo].[triggerKhoiThi] 
   ON  [dbo].[Diem]
   AFTER INSERT,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	declare @hoa float = (select DiemHoa from inserted )
	declare @ly float = (select DiemLy from inserted )
	declare @sinh float = (select DiemSinh from inserted )
	declare @su float = (select DiemSu from inserted )
	declare @dia float = (select DiemDia from inserted )
	declare @gdcd float = (select DiemGDCD from inserted )
	declare @khoithi nvarchar = (select KhoiThi from ThiSinh inner join inserted on ThiSinh.SoBaoDanh = inserted.SoBaoDanh)
	if(@khoithi = 'KHTN')
	begin
	IF(@su IS NOT NULL or @dia IS NOT NULL or @gdcd IS NOT NULL )
		begin
			print N'1 thí sinh không thể thi 2 khối' 
			ROLLBACK TRAN
		end
	end
		
	if(@khoithi = 'KHTN')
		begin
		IF( @hoa IS NOT NULL or @ly IS NOT NULL or @sinh IS NOT NULL )
			begin
				print N'1 thí sinh không thể thi 2 khối' 
				ROLLBACK TRAN
			end
		end
END
