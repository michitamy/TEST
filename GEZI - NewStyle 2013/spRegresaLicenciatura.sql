USE [GEZI]
GO
/****** Object:  StoredProcedure [gezi].[spRegresaUsuarios]    Script Date: 04/04/2013 11:03:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [doc].[spRegresaLicenciatura]

@opcion			  char(10)
,@licenciatura_id int

AS
	IF @opcion = 'TODOS'
	BEGIN
		SELECT 
			Licenciatura_id
			,Licenciatura
			,DondeEstudio
			,Pais
			,TituloLegalizado
			,PeriodoInicio
			,PeriodoFinal
			,NoCedula
		FROM [doc].Licenciatura WITH(NOLOCK)
	END ELSE
	BEGIN
		SELECT 
			Licenciatura_id
			,Licenciatura
			,DondeEstudio
			,Pais
			,TituloLegalizado
			,PeriodoInicio
			,PeriodoFinal
			,NoCedula
		FROM [doc].Licenciatura WITH(NOLOCK)
		where Licenciatura_id=@licenciatura_id
	END

