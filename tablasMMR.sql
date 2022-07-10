/*
Microsoft SQL Server 2017 (RTM) - 14.0.1000.169 (X64)   Aug 22 2017 17:04:49   Copyright (C) 2017 Microsoft Corporation  Express Edition (64-bit) on Windows 10 Pro 10.0 <X64> (Build 19044: ) 
 Source Server         : sql server
 Source Server Type    : SQL Server
 Source Server Version : 14001000
 Source Server Version : 2017
 Source Schema         : dbo

 Target Server Type    : SQL Server
 Target Server Version : 14001000
 File Encoding         : 65001

*/


-- ----------------------------
-- Table structure for detail
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[detail]') AND type IN ('U'))
	DROP TABLE [dbo].[detail]
GO

CREATE TABLE [dbo].[detail] (
  [PACKING_LIST_NUMBER] nvarchar(10) NOT NULL,
  [PART_ID] nvarchar(5) NOT NULL,
  [SERVICE_TAG] nvarchar(7) NULL
)
GO

ALTER TABLE [dbo].[detail] SET (LOCK_ESCALATION = TABLE)
GO


-- ----------------------------
-- Table structure for header
-- ----------------------------
IF EXISTS (SELECT * FROM sys.all_objects WHERE object_id = OBJECT_ID(N'[dbo].[header]') AND type IN ('U'))
	DROP TABLE [dbo].[header]
GO

CREATE TABLE [dbo].[header] (
  [DATE] date  NOT NULL,
  [PACKING_LIST_NUMBER] nvarchar(10) NOT NULL,
  [PART_ID] nvarchar(5) NOT NULL,
  [QTY] int  NULL,
  [COMMODITY] nvarchar(3) NULL,
  [VENDOR_ID] nvarchar(10) NULL,
  [VENDOR_LOC] nvarchar(5) NULL,
  [VENDOR_NAME] nvarchar(50) NULL,
  [BOL] bit  NULL,
  [CONTAINER] nvarchar(50) NULL,
  [PO_NUMBER] int  NULL
)
GO

ALTER TABLE [dbo].[header] SET (LOCK_ESCALATION = TABLE)
GO



-- ----------------------------
-- Primary Key structure for table detail
-- ----------------------------
ALTER TABLE [dbo].[detail] ADD CONSTRAINT [PK_detail_1] PRIMARY KEY CLUSTERED ([PACKING_LIST_NUMBER])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Primary Key structure for table header
-- ----------------------------
ALTER TABLE [dbo].[header] ADD CONSTRAINT [PK_header] PRIMARY KEY CLUSTERED ([PACKING_LIST_NUMBER])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)  
ON [PRIMARY]
GO


-- ----------------------------
-- Foreign Keys structure for table detail
-- ----------------------------
ALTER TABLE [dbo].[detail] ADD CONSTRAINT [FK_detail_header] FOREIGN KEY ([PACKING_LIST_NUMBER]) REFERENCES [dbo].[header] ([PACKING_LIST_NUMBER]) ON DELETE NO ACTION ON UPDATE NO ACTION
GO

