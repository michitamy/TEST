USE [GEZI]
GO
/****** Object:  StoredProcedure [gezi].[spUsuarios]    Script Date: 04/04/2013 10:48:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [doc].[spLicenciatura]

@opcion				char(10)
,@licenciatura_id	int
,@licenciatura		varchar(200)
,@dondeEstudio		varchar(200)
,@pais				varchar(30)
,@tituloLegalizado	bit
,@periodoInicio		smalldatetime
,@periodoFinal		smalldatetime
,@noCedula			varchar(30)
,@usuario			varchar(50)
,@equipo			varchar(50)
,@fecha				smalldatetime

AS
	IF @opcion = 'AGREGA'
	BEGIN
		INSERT INTO [doc].[Licenciatura](
			Licenciatura
			,DondeEstudio
			,Pais
			,TituloLegalizado
			,PeriodoInicio
			,PeriodoFinal
			,NoCedula
			,Creadopor
			,Creadoen
			,Creadodesde
		)VALUES(
			@licenciatura
			,@dondeEstudio
			,@pais
			,@tituloLegalizado
			,@periodoInicio
			,@periodoFinal
			,@noCedula
			,@usuario
			,@fecha
			,@equipo)
	END ELSE
	IF @opcion = 'ACTUALIZA'
	BEGIN
		UPDATE [doc].[Licenciatura] SET
			Licenciatura		=@licenciatura
			,DondeEstudio		=@dondeEstudio
			,Pais				=@pais
			,TituloLegalizado	=@tituloLegalizado
			,PeriodoInicio		=@periodoInicio
			,PeriodoFinal		=@periodoFinal
			,NoCedula			=@noCedula
			,Modifpor			=@usuario
			,Modifen			=@fecha
			,Modifdesde			=@equipo
		WHERE Licenciatura_id =@licenciatura_id
	END ELSE
	IF @opcion = 'ELIMINAR'
	BEGIN
		DELETE FROM [doc].Licenciatura
		WHERE Licenciatura_id =@licenciatura_id
	END 
	
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
	RETURN

