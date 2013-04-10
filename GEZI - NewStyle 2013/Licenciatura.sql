USE [GEZI]
GO

/****** Object:  Table [doc].[Licenciatura]    Script Date: 04/04/2013 11:31:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [doc].[Licenciatura](
	[Licenciatura_id] [int] IDENTITY(1,1) NOT NULL,
	[Licenciatura] [varchar](200) NOT NULL,
	[DondeEstudio] [varchar](200) NOT NULL,
	[Pais] [varchar](30) NOT NULL,
	[TituloLegalizado] [bit] NOT NULL,
	[PeriodoInicio] [smalldatetime] NOT NULL,
	[PeriodoFinal] [smalldatetime] NOT NULL,
	[NoCedula] [varchar](30) NOT NULL,
	[Creadopor] [varchar](50) NOT NULL,
	[Creadoen] [smalldatetime] NOT NULL,
	[Creadodesde] [varchar](50) NOT NULL,
	[Modifpor] [varchar](50) NOT NULL,
	[Modifen] [smalldatetime] NOT NULL,
	[Modifdesde] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Licenciatura] PRIMARY KEY CLUSTERED 
(
	[Licenciatura_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Persona que lo creo' , @level0type=N'SCHEMA',@level0name=N'doc', @level1type=N'TABLE',@level1name=N'Licenciatura', @level2type=N'COLUMN',@level2name=N'Creadopor'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha en que se creo' , @level0type=N'SCHEMA',@level0name=N'doc', @level1type=N'TABLE',@level1name=N'Licenciatura', @level2type=N'COLUMN',@level2name=N'Creadoen'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Desde donde se creo' , @level0type=N'SCHEMA',@level0name=N'doc', @level1type=N'TABLE',@level1name=N'Licenciatura', @level2type=N'COLUMN',@level2name=N'Creadodesde'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Persona que lo modifico' , @level0type=N'SCHEMA',@level0name=N'doc', @level1type=N'TABLE',@level1name=N'Licenciatura', @level2type=N'COLUMN',@level2name=N'Modifpor'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha en que se modifico' , @level0type=N'SCHEMA',@level0name=N'doc', @level1type=N'TABLE',@level1name=N'Licenciatura', @level2type=N'COLUMN',@level2name=N'Modifen'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Desde donde se modifico' , @level0type=N'SCHEMA',@level0name=N'doc', @level1type=N'TABLE',@level1name=N'Licenciatura', @level2type=N'COLUMN',@level2name=N'Modifdesde'
GO

ALTER TABLE [doc].[Licenciatura] ADD  CONSTRAINT [DF_Licenciatura_Licenciatura]  DEFAULT ('') FOR [Licenciatura]
GO

ALTER TABLE [doc].[Licenciatura] ADD  CONSTRAINT [DF_Licenciatura_DondeEstudio]  DEFAULT ('') FOR [DondeEstudio]
GO

ALTER TABLE [doc].[Licenciatura] ADD  CONSTRAINT [DF_Licenciatura_Pais]  DEFAULT ('') FOR [Pais]
GO

ALTER TABLE [doc].[Licenciatura] ADD  CONSTRAINT [DF_Licenciatura_TituloLegalizado]  DEFAULT ((0)) FOR [TituloLegalizado]
GO

ALTER TABLE [doc].[Licenciatura] ADD  CONSTRAINT [DF_Licenciatura_PeriodoInicio]  DEFAULT (getdate()) FOR [PeriodoInicio]
GO

ALTER TABLE [doc].[Licenciatura] ADD  CONSTRAINT [DF_Licenciatura_PeriodoFinal]  DEFAULT (getdate()) FOR [PeriodoFinal]
GO

ALTER TABLE [doc].[Licenciatura] ADD  CONSTRAINT [DF_Licenciatura_NoCedula]  DEFAULT ('') FOR [NoCedula]
GO

ALTER TABLE [doc].[Licenciatura] ADD  CONSTRAINT [DF_Licenciatura_Creadopor]  DEFAULT ('') FOR [Creadopor]
GO

ALTER TABLE [doc].[Licenciatura] ADD  CONSTRAINT [DF_Licenciatura_Creadoen]  DEFAULT (getdate()) FOR [Creadoen]
GO

ALTER TABLE [doc].[Licenciatura] ADD  CONSTRAINT [DF_Licenciatura_Creadodesde]  DEFAULT ('') FOR [Creadodesde]
GO

ALTER TABLE [doc].[Licenciatura] ADD  CONSTRAINT [DF_Licenciatura_Modifpor]  DEFAULT ('') FOR [Modifpor]
GO

ALTER TABLE [doc].[Licenciatura] ADD  CONSTRAINT [DF_Licenciatura_Modifen]  DEFAULT (getdate()) FOR [Modifen]
GO

ALTER TABLE [doc].[Licenciatura] ADD  CONSTRAINT [DF_Licenciatura_Modifdesde]  DEFAULT ('') FOR [Modifdesde]
GO

