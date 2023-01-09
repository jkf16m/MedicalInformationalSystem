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

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230108091117_InitializeDatabase')
BEGIN
    CREATE TABLE [Address] (
        [Id] int NOT NULL IDENTITY,
        [City] nvarchar(max) NULL,
        [State] nvarchar(max) NULL,
        [PostalCode] nvarchar(max) NULL,
        [PhoneNumber] nvarchar(max) NULL,
        CONSTRAINT [PK_Address] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230108091117_InitializeDatabase')
BEGIN
    CREATE TABLE [ConsultationRoom] (
        [Id] int NOT NULL IDENTITY,
        CONSTRAINT [PK_ConsultationRoom] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230108091117_InitializeDatabase')
BEGIN
    CREATE TABLE [Money] (
        [Id] int NOT NULL IDENTITY,
        [Pesos] int NOT NULL,
        [Centavos] int NOT NULL,
        CONSTRAINT [PK_Money] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230108091117_InitializeDatabase')
BEGIN
    CREATE TABLE [PersonName] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        [MiddleName] nvarchar(max) NULL,
        [FatherLastName] nvarchar(max) NULL,
        [MotherLastName] nvarchar(max) NULL,
        CONSTRAINT [PK_PersonName] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230108091117_InitializeDatabase')
BEGIN
    CREATE TABLE [Doctor] (
        [Id] int NOT NULL IDENTITY,
        [NameId] int NULL,
        [LivingAddressId] int NULL,
        [SalaryId] int NULL,
        [ProfessionalLicenseNumber] int NOT NULL,
        CONSTRAINT [PK_Doctor] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Doctor_Address_LivingAddressId] FOREIGN KEY ([LivingAddressId]) REFERENCES [Address] ([Id]),
        CONSTRAINT [FK_Doctor_Money_SalaryId] FOREIGN KEY ([SalaryId]) REFERENCES [Money] ([Id]),
        CONSTRAINT [FK_Doctor_PersonName_NameId] FOREIGN KEY ([NameId]) REFERENCES [PersonName] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230108091117_InitializeDatabase')
BEGIN
    CREATE TABLE [Patient] (
        [Id] int NOT NULL IDENTITY,
        [NameId] int NULL,
        [LivingAddressId] int NULL,
        [DoctorId] int NULL,
        CONSTRAINT [PK_Patient] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Patient_Address_LivingAddressId] FOREIGN KEY ([LivingAddressId]) REFERENCES [Address] ([Id]),
        CONSTRAINT [FK_Patient_Doctor_DoctorId] FOREIGN KEY ([DoctorId]) REFERENCES [Doctor] ([Id]),
        CONSTRAINT [FK_Patient_PersonName_NameId] FOREIGN KEY ([NameId]) REFERENCES [PersonName] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230108091117_InitializeDatabase')
BEGIN
    CREATE TABLE [Illness] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        [Description] nvarchar(max) NULL,
        [Symptoms] nvarchar(max) NULL,
        [PatientId] int NULL,
        CONSTRAINT [PK_Illness] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Illness_Patient_PatientId] FOREIGN KEY ([PatientId]) REFERENCES [Patient] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230108091117_InitializeDatabase')
BEGIN
    CREATE INDEX [IX_Doctor_LivingAddressId] ON [Doctor] ([LivingAddressId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230108091117_InitializeDatabase')
BEGIN
    CREATE INDEX [IX_Doctor_NameId] ON [Doctor] ([NameId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230108091117_InitializeDatabase')
BEGIN
    CREATE INDEX [IX_Doctor_SalaryId] ON [Doctor] ([SalaryId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230108091117_InitializeDatabase')
BEGIN
    CREATE INDEX [IX_Illness_PatientId] ON [Illness] ([PatientId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230108091117_InitializeDatabase')
BEGIN
    CREATE INDEX [IX_Patient_DoctorId] ON [Patient] ([DoctorId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230108091117_InitializeDatabase')
BEGIN
    CREATE INDEX [IX_Patient_LivingAddressId] ON [Patient] ([LivingAddressId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230108091117_InitializeDatabase')
BEGIN
    CREATE INDEX [IX_Patient_NameId] ON [Patient] ([NameId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230108091117_InitializeDatabase')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230108091117_InitializeDatabase', N'7.0.1');
END;
GO

COMMIT;
GO

