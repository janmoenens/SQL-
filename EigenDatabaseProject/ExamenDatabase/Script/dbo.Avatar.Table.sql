USE [Examen]
GO
SET IDENTITY_INSERT [dbo].[Avatar] ON 

INSERT [dbo].[Avatar] ([AvatarId], [Type], [Health], [Defence], [Stamina], [Mana]) VALUES (1, N'WARLOCK             ', 100, 75, 50, 175)
INSERT [dbo].[Avatar] ([AvatarId], [Type], [Health], [Defence], [Stamina], [Mana]) VALUES (2, N'WARRIOR             ', 175, 125, 75, 25)
INSERT [dbo].[Avatar] ([AvatarId], [Type], [Health], [Defence], [Stamina], [Mana]) VALUES (4, N'HUNTER              ', 150, 50, 175, 25)
SET IDENTITY_INSERT [dbo].[Avatar] OFF
