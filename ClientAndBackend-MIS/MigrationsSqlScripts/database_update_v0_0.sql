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

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    ALTER TABLE [Doctor] DROP CONSTRAINT [FK_Doctor_Address_LivingAddressId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    ALTER TABLE [Doctor] DROP CONSTRAINT [FK_Doctor_Money_SalaryId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    ALTER TABLE [Doctor] DROP CONSTRAINT [FK_Doctor_PersonName_NameId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    ALTER TABLE [Patient] DROP CONSTRAINT [FK_Patient_Address_LivingAddressId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    ALTER TABLE [Patient] DROP CONSTRAINT [FK_Patient_PersonName_NameId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    DROP TABLE [Address];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    DROP TABLE [Money];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    DROP TABLE [PersonName];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    DROP INDEX [IX_Patient_LivingAddressId] ON [Patient];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    DROP INDEX [IX_Patient_NameId] ON [Patient];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    DROP INDEX [IX_Doctor_LivingAddressId] ON [Doctor];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    DROP INDEX [IX_Doctor_NameId] ON [Doctor];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    DROP INDEX [IX_Doctor_SalaryId] ON [Doctor];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    DECLARE @var0 sysname;
    SELECT @var0 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Patient]') AND [c].[name] = N'LivingAddressId');
    IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [Patient] DROP CONSTRAINT [' + @var0 + '];');
    ALTER TABLE [Patient] DROP COLUMN [LivingAddressId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    DECLARE @var1 sysname;
    SELECT @var1 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Patient]') AND [c].[name] = N'NameId');
    IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [Patient] DROP CONSTRAINT [' + @var1 + '];');
    ALTER TABLE [Patient] DROP COLUMN [NameId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    DECLARE @var2 sysname;
    SELECT @var2 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Illness]') AND [c].[name] = N'Symptoms');
    IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [Illness] DROP CONSTRAINT [' + @var2 + '];');
    ALTER TABLE [Illness] DROP COLUMN [Symptoms];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    DECLARE @var3 sysname;
    SELECT @var3 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Doctor]') AND [c].[name] = N'LivingAddressId');
    IF @var3 IS NOT NULL EXEC(N'ALTER TABLE [Doctor] DROP CONSTRAINT [' + @var3 + '];');
    ALTER TABLE [Doctor] DROP COLUMN [LivingAddressId];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    EXEC sp_rename N'[Doctor].[SalaryId]', N'Salary_Pesos', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    EXEC sp_rename N'[Doctor].[NameId]', N'Salary_Centavos', N'COLUMN';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    ALTER TABLE [Patient] ADD [LivingAddress_City] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    ALTER TABLE [Patient] ADD [LivingAddress_PhoneNumber] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    ALTER TABLE [Patient] ADD [LivingAddress_PostalCode] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    ALTER TABLE [Patient] ADD [LivingAddress_State] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    ALTER TABLE [Patient] ADD [Name_FatherLastName] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    ALTER TABLE [Patient] ADD [Name_MiddleName] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    ALTER TABLE [Patient] ADD [Name_MotherLastName] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    ALTER TABLE [Patient] ADD [Name_Name] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    ALTER TABLE [Doctor] ADD [LivingAddress_City] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    ALTER TABLE [Doctor] ADD [LivingAddress_PhoneNumber] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    ALTER TABLE [Doctor] ADD [LivingAddress_PostalCode] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    ALTER TABLE [Doctor] ADD [LivingAddress_State] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    ALTER TABLE [Doctor] ADD [Name_FatherLastName] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    ALTER TABLE [Doctor] ADD [Name_MiddleName] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    ALTER TABLE [Doctor] ADD [Name_MotherLastName] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    ALTER TABLE [Doctor] ADD [Name_Name] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    CREATE TABLE [Symptom] (
        [Id] int NOT NULL IDENTITY,
        [Name] nvarchar(max) NULL,
        [Description] nvarchar(max) NULL,
        [Causes] nvarchar(max) NULL,
        [IllnessId] int NULL,
        CONSTRAINT [PK_Symptom] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Symptom_Illness_IllnessId] FOREIGN KEY ([IllnessId]) REFERENCES [Illness] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    CREATE INDEX [IX_Symptom_IllnessId] ON [Symptom] ([IllnessId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023214_SymptomTableAddedAndOwnedEntities')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230109023214_SymptomTableAddedAndOwnedEntities', N'7.0.1');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023708_SymptomTableAddedAndOwnedEntities_2')
BEGIN
    DECLARE @var4 sysname;
    SELECT @var4 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Doctor]') AND [c].[name] = N'Salary_Pesos');
    IF @var4 IS NOT NULL EXEC(N'ALTER TABLE [Doctor] DROP CONSTRAINT [' + @var4 + '];');
    UPDATE [Doctor] SET [Salary_Pesos] = 0 WHERE [Salary_Pesos] IS NULL;
    ALTER TABLE [Doctor] ALTER COLUMN [Salary_Pesos] int NOT NULL;
    ALTER TABLE [Doctor] ADD DEFAULT 0 FOR [Salary_Pesos];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023708_SymptomTableAddedAndOwnedEntities_2')
BEGIN
    DECLARE @var5 sysname;
    SELECT @var5 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Doctor]') AND [c].[name] = N'Salary_Centavos');
    IF @var5 IS NOT NULL EXEC(N'ALTER TABLE [Doctor] DROP CONSTRAINT [' + @var5 + '];');
    UPDATE [Doctor] SET [Salary_Centavos] = 0 WHERE [Salary_Centavos] IS NULL;
    ALTER TABLE [Doctor] ALTER COLUMN [Salary_Centavos] int NOT NULL;
    ALTER TABLE [Doctor] ADD DEFAULT 0 FOR [Salary_Centavos];
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230109023708_SymptomTableAddedAndOwnedEntities_2')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230109023708_SymptomTableAddedAndOwnedEntities_2', N'7.0.1');
END;
GO

COMMIT;
GO

