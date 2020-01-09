﻿/*
Deployment script for ExamenSQL

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "ExamenSQL"
:setvar DefaultFilePrefix "ExamenSQL"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE Latin1_General_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY CHECKSUM,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 60 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET TEMPORAL_HISTORY_RETENTION ON 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Creating [dbo].[Avatar]...';


GO
CREATE TABLE [dbo].[Avatar] (
    [AvatarId] INT        IDENTITY (1, 1) NOT NULL,
    [Type]     NCHAR (20) NOT NULL,
    [Health]   INT        NOT NULL,
    [Defence]  INT        NOT NULL,
    [Stamina]  INT        NOT NULL,
    [Mana]     INT        NOT NULL,
    PRIMARY KEY CLUSTERED ([AvatarId] ASC)
);


GO
PRINT N'Creating [dbo].[Inventory]...';


GO
CREATE TABLE [dbo].[Inventory] (
    [InventoryId]    INT IDENTITY (1, 1) NOT NULL,
    [PlayerAvatarId] INT NULL,
    [AvatarType]     INT NULL,
    [ItemId]         INT NULL,
    PRIMARY KEY CLUSTERED ([InventoryId] ASC)
);


GO
PRINT N'Creating [dbo].[Item]...';


GO
CREATE TABLE [dbo].[Item] (
    [ItemId]      INT        IDENTITY (1, 1) NOT NULL,
    [Name]        NCHAR (50) NOT NULL,
    [AvatarType]  INT        NULL,
    [SlotType]    INT        NULL,
    [AttackPower] INT        NULL,
    [Defence]     INT        NULL,
    [Health]      INT        NULL,
    [Stamina]     INT        NULL,
    [Mana]        INT        NULL,
    PRIMARY KEY CLUSTERED ([ItemId] ASC),
    UNIQUE NONCLUSTERED ([Name] ASC)
);


GO
PRINT N'Creating [dbo].[Player]...';


GO
CREATE TABLE [dbo].[Player] (
    [PlayerId]  INT        IDENTITY (1, 1) NOT NULL,
    [FirstName] NCHAR (50) NOT NULL,
    [LastName]  NCHAR (50) NOT NULL,
    [Email]     NCHAR (50) NOT NULL,
    [Phone]     NCHAR (20) NOT NULL,
    [Login]     NCHAR (20) NOT NULL,
    [Password]  NCHAR (20) NOT NULL,
    PRIMARY KEY CLUSTERED ([PlayerId] ASC),
    UNIQUE NONCLUSTERED ([Login] ASC)
);


GO
PRINT N'Creating [dbo].[PlayerAvatar]...';


GO
CREATE TABLE [dbo].[PlayerAvatar] (
    [PlayerAvatarId] INT        IDENTITY (1, 1) NOT NULL,
    [PlayerId]       INT        NOT NULL,
    [AvatarId]       INT        NOT NULL,
    [FamilyName]     NCHAR (50) NULL,
    [AvatarName]     NCHAR (50) NOT NULL,
    [InventoryId]    INT        NULL,
    [TotalHealth]    INT        NULL,
    [TotalDefence]   INT        NULL,
    [TotalStamina]   INT        NULL,
    [TotalMana]      INT        NULL,
    [HeadSlot1]      INT        NULL,
    [ChestSlot2]     INT        NULL,
    [BootsSlot3]     INT        NULL,
    [MainHandSlot4]  INT        NULL,
    [OffHandSlot5]   INT        NULL,
    PRIMARY KEY CLUSTERED ([PlayerAvatarId] ASC),
    UNIQUE NONCLUSTERED ([AvatarName] ASC)
);


GO
PRINT N'Creating unnamed constraint on [dbo].[Item]...';


GO
ALTER TABLE [dbo].[Item]
    ADD DEFAULT ((0)) FOR [AttackPower];


GO
PRINT N'Creating unnamed constraint on [dbo].[Item]...';


GO
ALTER TABLE [dbo].[Item]
    ADD DEFAULT ((0)) FOR [Defence];


GO
PRINT N'Creating unnamed constraint on [dbo].[Item]...';


GO
ALTER TABLE [dbo].[Item]
    ADD DEFAULT ((0)) FOR [Health];


GO
PRINT N'Creating unnamed constraint on [dbo].[Item]...';


GO
ALTER TABLE [dbo].[Item]
    ADD DEFAULT ((0)) FOR [Stamina];


GO
PRINT N'Creating unnamed constraint on [dbo].[Item]...';


GO
ALTER TABLE [dbo].[Item]
    ADD DEFAULT ((0)) FOR [Mana];


GO
PRINT N'Creating unnamed constraint on [dbo].[PlayerAvatar]...';


GO
ALTER TABLE [dbo].[PlayerAvatar]
    ADD DEFAULT ((100)) FOR [TotalHealth];


GO
PRINT N'Creating unnamed constraint on [dbo].[PlayerAvatar]...';


GO
ALTER TABLE [dbo].[PlayerAvatar]
    ADD DEFAULT ((100)) FOR [TotalDefence];


GO
PRINT N'Creating unnamed constraint on [dbo].[PlayerAvatar]...';


GO
ALTER TABLE [dbo].[PlayerAvatar]
    ADD DEFAULT ((100)) FOR [TotalStamina];


GO
PRINT N'Creating unnamed constraint on [dbo].[PlayerAvatar]...';


GO
ALTER TABLE [dbo].[PlayerAvatar]
    ADD DEFAULT ((100)) FOR [TotalMana];


GO
PRINT N'Creating unnamed constraint on [dbo].[PlayerAvatar]...';


GO
ALTER TABLE [dbo].[PlayerAvatar]
    ADD DEFAULT ((0)) FOR [HeadSlot1];


GO
PRINT N'Creating unnamed constraint on [dbo].[PlayerAvatar]...';


GO
ALTER TABLE [dbo].[PlayerAvatar]
    ADD DEFAULT ((0)) FOR [ChestSlot2];


GO
PRINT N'Creating unnamed constraint on [dbo].[PlayerAvatar]...';


GO
ALTER TABLE [dbo].[PlayerAvatar]
    ADD DEFAULT ((0)) FOR [BootsSlot3];


GO
PRINT N'Creating unnamed constraint on [dbo].[PlayerAvatar]...';


GO
ALTER TABLE [dbo].[PlayerAvatar]
    ADD DEFAULT ((0)) FOR [MainHandSlot4];


GO
PRINT N'Creating unnamed constraint on [dbo].[PlayerAvatar]...';


GO
ALTER TABLE [dbo].[PlayerAvatar]
    ADD DEFAULT ((0)) FOR [OffHandSlot5];


GO
PRINT N'Creating [dbo].[FK_Item_ToInventory]...';


GO
ALTER TABLE [dbo].[Inventory]
    ADD CONSTRAINT [FK_Item_ToInventory] FOREIGN KEY ([ItemId]) REFERENCES [dbo].[Item] ([ItemId]);


GO
PRINT N'Creating [dbo].[FK_PlayerAvatar_Inventory]...';


GO
ALTER TABLE [dbo].[PlayerAvatar]
    ADD CONSTRAINT [FK_PlayerAvatar_Inventory] FOREIGN KEY ([InventoryId]) REFERENCES [dbo].[Inventory] ([InventoryId]);


GO
PRINT N'Creating [dbo].[FK_PlayerAvatarId_AvatarId]...';


GO
ALTER TABLE [dbo].[PlayerAvatar]
    ADD CONSTRAINT [FK_PlayerAvatarId_AvatarId] FOREIGN KEY ([AvatarId]) REFERENCES [dbo].[Avatar] ([AvatarId]);


GO
PRINT N'Creating [dbo].[FK_PlayerAvatarId_PlayerId]...';


GO
ALTER TABLE [dbo].[PlayerAvatar]
    ADD CONSTRAINT [FK_PlayerAvatarId_PlayerId] FOREIGN KEY ([PlayerId]) REFERENCES [dbo].[Player] ([PlayerId]);


GO
/*
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

GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Update complete.';


GO
