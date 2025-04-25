﻿CREATE TABLE [Person].[StateProvince] (
  [StateProvinceID] [int] IDENTITY,
  [StateProvinceCode] [nchar](3) NOT NULL,
  [CountryRegionCode] [nvarchar](3) NOT NULL,
  [IsOnlyStateProvinceFlag] [dbo].[Flag] NOT NULL CONSTRAINT [DF_StateProvince_IsOnlyStateProvinceFlag] DEFAULT (1),
  [Name] [dbo].[Name] NOT NULL,
  [TerritoryID] [int] NOT NULL,
  [rowguid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_StateProvince_rowguid] DEFAULT (newid()) ROWGUIDCOL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_StateProvince_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_StateProvince_StateProvinceID] PRIMARY KEY CLUSTERED ([StateProvinceID])
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [AK_StateProvince_Name]
  ON [Person].[StateProvince] ([Name])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [AK_StateProvince_rowguid]
  ON [Person].[StateProvince] ([rowguid])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [AK_StateProvince_StateProvinceCode_CountryRegionCode]
  ON [Person].[StateProvince] ([StateProvinceCode], [CountryRegionCode])
  ON [PRIMARY]
GO

ALTER TABLE [Person].[StateProvince]
  ADD CONSTRAINT [FK_StateProvince_CountryRegion_CountryRegionCode] FOREIGN KEY ([CountryRegionCode]) REFERENCES [Person].[CountryRegion] ([CountryRegionCode])
GO

ALTER TABLE [Person].[StateProvince]
  ADD CONSTRAINT [FK_StateProvince_SalesTerritory_TerritoryID] FOREIGN KEY ([TerritoryID]) REFERENCES [Sales].[SalesTerritory] ([TerritoryID])
GO