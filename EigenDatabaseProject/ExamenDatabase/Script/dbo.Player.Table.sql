USE [Examen]
GO
SET IDENTITY_INSERT [dbo].[Player] ON 

INSERT [dbo].[Player] ([PlayerId], [FirstName], [LastName], [Email], [Phone], [Login], [Password]) VALUES (31, N'FirstName                                         ', N'familienaam                                       ', N'test@email.com                                    ', N'505505              ', N'TestAccount         ', N'test                ')
INSERT [dbo].[Player] ([PlayerId], [FirstName], [LastName], [Email], [Phone], [Login], [Password]) VALUES (32, N'Jan                                               ', N'Moenens                                           ', N'Janmoenens@test.be                                ', N'45454544554         ', N'Jan1                ', N'Admin               ')
INSERT [dbo].[Player] ([PlayerId], [FirstName], [LastName], [Email], [Phone], [Login], [Password]) VALUES (37, N'jan                                               ', N'moenens                                           ', N'janmoenens@test.be                                ', N'454545              ', N'jan2                ', N'Admin               ')
SET IDENTITY_INSERT [dbo].[Player] OFF
