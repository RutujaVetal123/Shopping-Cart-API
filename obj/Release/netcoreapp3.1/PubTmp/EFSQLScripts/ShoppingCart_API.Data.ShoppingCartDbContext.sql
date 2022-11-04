IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220721093238_First')
BEGIN
    CREATE TABLE [UserDetails] (
        [UserId] int NOT NULL IDENTITY,
        [FirstName] nvarchar(max) NULL,
        [LastName] nvarchar(max) NULL,
        [EmailId] nvarchar(max) NOT NULL,
        [MobileNumber] nvarchar(max) NOT NULL,
        [Password] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_UserDetails] PRIMARY KEY ([UserId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220721093238_First')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220721093238_First', N'5.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220721175728_second')
BEGIN
    CREATE TABLE [Product] (
        [ProductId] int NOT NULL IDENTITY,
        [Category] nvarchar(max) NULL,
        [ProductName] nvarchar(max) NOT NULL,
        [Price] decimal(18,2) NOT NULL,
        [Description] nvarchar(max) NULL,
        [ProductImage] nvarchar(max) NULL,
        CONSTRAINT [PK_Product] PRIMARY KEY ([ProductId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220721175728_second')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220721175728_second', N'5.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220722023035_third')
BEGIN
    CREATE TABLE [Cart] (
        [CartId] int NOT NULL IDENTITY,
        [UserId] int NOT NULL,
        [ProductId] int NOT NULL,
        [ProductName] nvarchar(max) NULL,
        [Quantity] int NOT NULL,
        [Tprice] decimal(18,2) NOT NULL,
        CONSTRAINT [PK_Cart] PRIMARY KEY ([CartId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220722023035_third')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220722023035_third', N'5.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220722031755_forth')
BEGIN
    CREATE TABLE [Order] (
        [OrderId] int NOT NULL IDENTITY,
        [CartId] int NOT NULL,
        [UserId] int NOT NULL,
        [ProductId] int NOT NULL,
        [ProductName] nvarchar(max) NULL,
        [Quantity] int NOT NULL,
        [Tprice] decimal(18,2) NOT NULL,
        CONSTRAINT [PK_Order] PRIMARY KEY ([OrderId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220722031755_forth')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220722031755_forth', N'5.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220722043843_fifth')
BEGIN
    CREATE TABLE [Payment] (
        [TransactionId] int NOT NULL IDENTITY,
        [TransactionAmount] decimal(18,2) NOT NULL,
        [UserId] int NOT NULL,
        [OrderId] int NOT NULL,
        [Tstatus] nvarchar(max) NULL,
        [Mode] nvarchar(max) NULL,
        [Code] nvarchar(max) NULL,
        CONSTRAINT [PK_Payment] PRIMARY KEY ([TransactionId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220722043843_fifth')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220722043843_fifth', N'5.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220725051959_sixth')
BEGIN
    CREATE TABLE [AddressT] (
        [AddId] int NOT NULL IDENTITY,
        [UserId] int NOT NULL,
        [AddressInfo] nvarchar(max) NULL,
        [City] nvarchar(max) NULL,
        [UserState] nvarchar(max) NULL,
        [Pincode] nvarchar(max) NULL,
        CONSTRAINT [PK_AddressT] PRIMARY KEY ([AddId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220725051959_sixth')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220725051959_sixth', N'5.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220726044331_seventh')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220726044331_seventh', N'5.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220731065401_ninth')
BEGIN
    DECLARE @var0 sysname;
    SELECT @var0 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Cart]') AND [c].[name] = N'UserId');
    IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [Cart] DROP CONSTRAINT [' + @var0 + '];');
    ALTER TABLE [Cart] DROP COLUMN [UserId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220731065401_ninth')
BEGIN
    EXEC sp_rename N'[Cart].[Tprice]', N'Price', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220731065401_ninth')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220731065401_ninth', N'5.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220803163442_tenth')
BEGIN
    ALTER TABLE [UserDetails] ADD [AddressInfo] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220803163442_tenth')
BEGIN
    ALTER TABLE [UserDetails] ADD [City] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220803163442_tenth')
BEGIN
    ALTER TABLE [UserDetails] ADD [Pincode] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220803163442_tenth')
BEGIN
    ALTER TABLE [UserDetails] ADD [Role] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220803163442_tenth')
BEGIN
    ALTER TABLE [UserDetails] ADD [UserState] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220803163442_tenth')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220803163442_tenth', N'5.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220804024804_eighth')
BEGIN
    EXEC sp_rename N'[Order].[Tprice]', N'Price', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220804024804_eighth')
BEGIN
    ALTER TABLE [Cart] ADD [UserId] int NOT NULL DEFAULT 0;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220804024804_eighth')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220804024804_eighth', N'5.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220804083121_sss')
BEGIN
    ALTER TABLE [UserDetails] ADD [IsLogin] bit NOT NULL DEFAULT CAST(0 AS bit);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220804083121_sss')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220804083121_sss', N'5.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220804083958_aaa')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220804083958_aaa', N'5.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220804102220_aaaaaa')
BEGIN
    ALTER TABLE [Order] ADD [ProductImage] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220804102220_aaaaaa')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220804102220_aaaaaa', N'5.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220804103112_aaaaaaa')
BEGIN
    ALTER TABLE [Cart] ADD [ProductImage] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220804103112_aaaaaaa')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220804103112_aaaaaaa', N'5.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220806142245_abcd')
BEGIN
    CREATE TABLE [feedback] (
        [UserId] int NOT NULL IDENTITY,
        [Username] nvarchar(max) NULL,
        [Feedback] nvarchar(max) NULL,
        CONSTRAINT [PK_feedback] PRIMARY KEY ([UserId])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220806142245_abcd')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220806142245_abcd', N'5.0.0');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220818192415_new')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220818192415_new', N'5.0.0');
END;
GO

COMMIT;
GO

