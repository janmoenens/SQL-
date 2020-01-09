﻿/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
SET IDENTITY_INSERT [dbo].[Avatar] ON 
GO
INSERT [dbo].[Avatar] ([AvatarId], [Type], [Health], [Defence], [Stamina], [Mana]) VALUES (1, N'WARLOCK             ', 100, 75, 50, 175)
GO
INSERT [dbo].[Avatar] ([AvatarId], [Type], [Health], [Defence], [Stamina], [Mana]) VALUES (2, N'WARRIOR             ', 175, 125, 75, 25)
GO
INSERT [dbo].[Avatar] ([AvatarId], [Type], [Health], [Defence], [Stamina], [Mana]) VALUES (4, N'HUNTER              ', 150, 50, 175, 25)
GO
SET IDENTITY_INSERT [dbo].[Avatar] OFF
GO
SET IDENTITY_INSERT [dbo].[Player] ON 
GO
INSERT [dbo].[Player] ([PlayerId], [FirstName], [LastName], [Email], [Phone], [Login], [Password]) VALUES (31, N'FirstName                                         ', N'familienaam                                       ', N'test@email.com                                    ', N'505505              ', N'TestAccount         ', N'test                ')
GO
INSERT [dbo].[Player] ([PlayerId], [FirstName], [LastName], [Email], [Phone], [Login], [Password]) VALUES (32, N'Jan                                               ', N'Moenens                                           ', N'Janmoenens@test.be                                ', N'45454544554         ', N'Jan1                ', N'Admin               ')
GO
INSERT [dbo].[Player] ([PlayerId], [FirstName], [LastName], [Email], [Phone], [Login], [Password]) VALUES (37, N'jan                                               ', N'moenens                                           ', N'janmoenens@test.be                                ', N'454545              ', N'jan2                ', N'Admin               ')
GO
SET IDENTITY_INSERT [dbo].[Player] OFF
GO
SET IDENTITY_INSERT [dbo].[Item] ON 
GO
INSERT [dbo].[Item] ([ItemId], [Name], [AvatarType], [SlotType], [AttackPower], [Defence], [Health], [Stamina], [Mana]) VALUES (9, N'StartersHelm                                      ', NULL, 1, 0, 10, 0, 0, 25)
GO
INSERT [dbo].[Item] ([ItemId], [Name], [AvatarType], [SlotType], [AttackPower], [Defence], [Health], [Stamina], [Mana]) VALUES (10, N'StartersChest                                     ', NULL, 2, 0, 10, 25, 0, 0)
GO
INSERT [dbo].[Item] ([ItemId], [Name], [AvatarType], [SlotType], [AttackPower], [Defence], [Health], [Stamina], [Mana]) VALUES (11, N'StartersBoots                                     ', NULL, 3, 0, 10, 0, 25, 0)
GO
INSERT [dbo].[Item] ([ItemId], [Name], [AvatarType], [SlotType], [AttackPower], [Defence], [Health], [Stamina], [Mana]) VALUES (12, N'StartersSword                                     ', 2, 4, 10, 0, 0, 0, 0)
GO
INSERT [dbo].[Item] ([ItemId], [Name], [AvatarType], [SlotType], [AttackPower], [Defence], [Health], [Stamina], [Mana]) VALUES (13, N'StartersWand                                      ', 1, 4, 10, 0, 0, 0, 0)
GO
INSERT [dbo].[Item] ([ItemId], [Name], [AvatarType], [SlotType], [AttackPower], [Defence], [Health], [Stamina], [Mana]) VALUES (14, N'StartersMainDagger                                ', 4, 4, 10, 0, 0, 0, 0)
GO
INSERT [dbo].[Item] ([ItemId], [Name], [AvatarType], [SlotType], [AttackPower], [Defence], [Health], [Stamina], [Mana]) VALUES (15, N'StartersShield                                    ', 2, 5, 0, 10, 0, 0, 0)
GO
INSERT [dbo].[Item] ([ItemId], [Name], [AvatarType], [SlotType], [AttackPower], [Defence], [Health], [Stamina], [Mana]) VALUES (16, N'StartersRelic                                     ', 1, 5, 0, 10, 0, 0, 0)
GO
INSERT [dbo].[Item] ([ItemId], [Name], [AvatarType], [SlotType], [AttackPower], [Defence], [Health], [Stamina], [Mana]) VALUES (17, N'StartersOffDagger                                 ', 4, 5, 10, 0, 0, 0, 0)
GO
INSERT [dbo].[Item] ([ItemId], [Name], [AvatarType], [SlotType], [AttackPower], [Defence], [Health], [Stamina], [Mana]) VALUES (24, N'Kerstmuts                                         ', NULL, 1, 0, 0, 0, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[Item] OFF
GO
SET IDENTITY_INSERT [dbo].[Inventory] ON 
GO
INSERT [dbo].[Inventory] ([InventoryId], [PlayerAvatarId], [AvatarType], [ItemId]) VALUES (5, 6, 1, NULL)
GO
INSERT [dbo].[Inventory] ([InventoryId], [PlayerAvatarId], [AvatarType], [ItemId]) VALUES (6, 7, 4, NULL)
GO
INSERT [dbo].[Inventory] ([InventoryId], [PlayerAvatarId], [AvatarType], [ItemId]) VALUES (8, 6, 1, 9)
GO
INSERT [dbo].[Inventory] ([InventoryId], [PlayerAvatarId], [AvatarType], [ItemId]) VALUES (9, 6, 1, 10)
GO
INSERT [dbo].[Inventory] ([InventoryId], [PlayerAvatarId], [AvatarType], [ItemId]) VALUES (10, 6, 1, 11)
GO
INSERT [dbo].[Inventory] ([InventoryId], [PlayerAvatarId], [AvatarType], [ItemId]) VALUES (11, 6, 1, 13)
GO
INSERT [dbo].[Inventory] ([InventoryId], [PlayerAvatarId], [AvatarType], [ItemId]) VALUES (12, 6, 1, 16)
GO
INSERT [dbo].[Inventory] ([InventoryId], [PlayerAvatarId], [AvatarType], [ItemId]) VALUES (13, 6, 1, 12)
GO
INSERT [dbo].[Inventory] ([InventoryId], [PlayerAvatarId], [AvatarType], [ItemId]) VALUES (14, 6, 1, 17)
GO
INSERT [dbo].[Inventory] ([InventoryId], [PlayerAvatarId], [AvatarType], [ItemId]) VALUES (18, 12, 2, NULL)
GO
INSERT [dbo].[Inventory] ([InventoryId], [PlayerAvatarId], [AvatarType], [ItemId]) VALUES (22, 16, 4, NULL)
GO
INSERT [dbo].[Inventory] ([InventoryId], [PlayerAvatarId], [AvatarType], [ItemId]) VALUES (23, 17, 2, NULL)
GO
INSERT [dbo].[Inventory] ([InventoryId], [PlayerAvatarId], [AvatarType], [ItemId]) VALUES (25, 6, 1, 24)
GO
INSERT [dbo].[Inventory] ([InventoryId], [PlayerAvatarId], [AvatarType], [ItemId]) VALUES (26, 7, 1, 24)
GO
INSERT [dbo].[Inventory] ([InventoryId], [PlayerAvatarId], [AvatarType], [ItemId]) VALUES (27, 12, 1, 24)
GO
INSERT [dbo].[Inventory] ([InventoryId], [PlayerAvatarId], [AvatarType], [ItemId]) VALUES (28, 16, 1, 24)
GO
INSERT [dbo].[Inventory] ([InventoryId], [PlayerAvatarId], [AvatarType], [ItemId]) VALUES (29, 17, 1, 24)
GO
SET IDENTITY_INSERT [dbo].[Inventory] OFF
GO
SET IDENTITY_INSERT [dbo].[PlayerAvatar] ON 
GO
INSERT [dbo].[PlayerAvatar] ([PlayerAvatarId], [PlayerId], [AvatarId], [FamilyName], [AvatarName], [InventoryId], [TotalHealth], [TotalDefence], [TotalStamina], [TotalMana], [HeadSlot1], [ChestSlot2], [BootsSlot3], [MainHandSlot4], [OffHandSlot5]) VALUES (6, 31, 1, N'Glaxor                                            ', N'Jedi                                              ', 5, 100, 100, 100, 100, 9, 10, 11, 13, 16)
GO
INSERT [dbo].[PlayerAvatar] ([PlayerAvatarId], [PlayerId], [AvatarId], [FamilyName], [AvatarName], [InventoryId], [TotalHealth], [TotalDefence], [TotalStamina], [TotalMana], [HeadSlot1], [ChestSlot2], [BootsSlot3], [MainHandSlot4], [OffHandSlot5]) VALUES (7, 32, 4, N'Familie1                                          ', N'Test1                                             ', 6, 100, 100, 100, 100, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[PlayerAvatar] ([PlayerAvatarId], [PlayerId], [AvatarId], [FamilyName], [AvatarName], [InventoryId], [TotalHealth], [TotalDefence], [TotalStamina], [TotalMana], [HeadSlot1], [ChestSlot2], [BootsSlot3], [MainHandSlot4], [OffHandSlot5]) VALUES (12, 37, 2, N'Familie2                                          ', N'Test2                                             ', 18, 100, 100, 100, 100, 0, 0, 0, 0, 0)
GO
INSERT [dbo].[PlayerAvatar] ([PlayerAvatarId], [PlayerId], [AvatarId], [FamilyName], [AvatarName], [InventoryId], [TotalHealth], [TotalDefence], [TotalStamina], [TotalMana], [HeadSlot1], [ChestSlot2], [BootsSlot3], [MainHandSlot4], [OffHandSlot5]) VALUES (16, 31, 4, N'Glaxor                                            ', N'Jedi3                                             ', 22, 100, 100, 100, 100, 9, 10, 11, 14, 17)
GO
INSERT [dbo].[PlayerAvatar] ([PlayerAvatarId], [PlayerId], [AvatarId], [FamilyName], [AvatarName], [InventoryId], [TotalHealth], [TotalDefence], [TotalStamina], [TotalMana], [HeadSlot1], [ChestSlot2], [BootsSlot3], [MainHandSlot4], [OffHandSlot5]) VALUES (17, 31, 2, N'Glaxor                                            ', N'Jedi2                                             ', 23, 100, 100, 100, 100, 9, 10, 11, 12, 15)
GO
SET IDENTITY_INSERT [dbo].[PlayerAvatar] OFF
GO
--Toon alles wat er voor de moment  al bestaat.
CREATE VIEW Spelontwikkelaar AS
SELECT *
FROM Item
GO
--Toon alle avatarnaam/familiegroep/avatartype/totale health/defence/stamina/mana van 1 gebruiker
CREATE VIEW SpelerView AS
SELECT p.FirstName [Spelers Voornaam]
	,p.LastName [Spelers Achternaam]
	,pa.AvatarName [Spelers Avatarnaam]
	,pa.FamilyName [Familie's Groeps Naam]
	,Av.Type [Avatar's Type]
	,pa.TotalHealth + a.Health + i1.Health + i2.Health + i3.Health + i4.Health + i5.Health AS [Total Health]
	,pa.TotalDefence + a.Defence + i1.Defence + i2.Defence + i3.Defence + i4.Defence + i5.Defence AS [Total Defence]
	,pa.TotalStamina + a.Stamina + i1.Stamina + i2.Stamina + i3.Stamina + i4.Stamina + i5.Stamina AS [Total Stamina]
	,pa.TotalMana + a.Mana + i1.Mana + i2.Mana + i3.Mana + i4.Mana + i5.Mana AS [Total Mana]
FROM Player AS p
LEFT JOIN PlayerAvatar AS pa ON p.PlayerId = pa.PlayerId
LEFT JOIN Avatar AS Av ON pa.AvatarId = Av.AvatarId
INNER JOIN Avatar AS a ON pa.AvatarId = a.AvatarId
INNER JOIN Item AS i1 ON pa.HeadSlot1 = i1.ItemId
INNER JOIN Item AS i2 ON pa.ChestSlot2 = i2.ItemId
INNER JOIN Item AS i3 ON pa.BootsSlot3 = i3.ItemId
INNER JOIN Item AS i4 ON pa.MainHandSlot4 = i4.ItemId
INNER JOIN Item AS i5 ON pa.OffHandSlot5 = i5.ItemId
WHERE p.LOGIN = 'TestAccount'
GO
--toon alle avatars van 1 bepaalde speler
CREATE VIEW  AdminView AS
SELECT p.FirstName [Spelers Voornaam]
	,p.LastName [Spelers Achternaam]
	,pa.AvatarName [Spelers Avatarnaam]
	,pa.FamilyName [Familie's Groeps Naam]
	,Av.Type [Avatar's Type]
	,pa.PlayerAvatarId [Avatars Id]
	
FROM Player AS p
LEFT JOIN PlayerAvatar AS pa ON p.PlayerId = pa.PlayerId
LEFT JOIN Avatar AS Av ON pa.AvatarId = Av.AvatarId
LEFT JOIN Avatar AS a ON pa.AvatarId = a.AvatarId
WHERE pa.PlayerId = 31
GO
