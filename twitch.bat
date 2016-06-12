@ECHO Off

REM Variables
SET SETUP=FALSE
SET ENTRHELP=Entering help...
SET UNRG=Unrecognized Command, Try Again
REM Name on twitch
SET TWNAME=Foo

TITLE Twitch Stream Setup
ECHO Welcome to Twitch Stream Setup
ECHO Created by Kiyakou.twitch.tv
ECHO First time? Enter HELP for a list of commands
GOTO :COMMAND

:COMMAND
ECHO.
SET COMMAND=
SET /P "COMMAND=Enter Command: "
IF /I %COMMAND%==SETUP (
	ECHO Starting Setup...
	REM Moving to Setup
	SET SETUP=TRUE
	GOTO :OBSLOOP
	)
IF /I %COMMAND%==OBS-C (
	ECHO You entered OBS...
	REM Moving to OBSLOOP
	GOTO :OBSCLOOP
	)
REM IF /I %COMMAND%==SOUND (
	REM Moving to SOUNDLOOP
REM	GOTO :SOUNDLOOP
REM	)
IF /I %COMMAND%==PRO (
	REM Moving to PROLOOP
	GOTO :PROLOOP
	)
IF /I %COMMAND%==ALERT (
	REM Moving to ALERTLOOP
	GOTO :ALERTLOOP
	)
IF /I %COMMAND%==DISCORD (
	REM Moving to DISCORDLOOP
	GOTO :DISCORDLOOP
	)
IF /I %COMMAND%==YT (
	REM Moving to YOUTUBELOOP
	GOTO :YOUTUBELOOP
	)
IF /I %COMMAND%==DASH (
	REM Moving to DASHLOOP
	GOTO :DASHLOOP
	)
IF /I %COMMAND%==PANDORA (
	REM Moving to SOUNDLOOP
	GOTO :PANDORALOOP
	)
IF /I %COMMAND%==HELP (
	REM Moving to SOUNDLOOP
	GOTO :HELP
	)
IF /I %COMMAND%==QUIT (
	ECHO Goodbye
	REM Close Program
	PAUSE
	EXIT
	)
	(
	ECHO Unrecognized Command. Enter HELP for more information
	REM Begin OBS Loop Again
	GOTO :COMMAND
	)

:HELP
ECHO.
REM Show Command List
ECHO Command List
ECHO 	SETUP: Start setup process
ECHO 	OBS-C: Launch OBS Classic 		OBS-S: Launch OBS Studio
ECHO		DISCORD: Launch Discord program
ECHO 	SOUND: **IN DEVELOPMENT** Launch Sound Settings program
ECHO 	PRO: Launch Streampro.com Window		ALERT: Launch TwitchAlerts.com Window
ECHO 	YT: Launch a Youtube Window
ECHO	DASH: Open Twitch dashboard
ECHO 	PANDORA: Launch Pandora.com program
ECHO 	QUIT: Soft Quit
ECHO 	EXIT: Hard Quit
ECHO 	HELP: Show command list
GOTO :COMMAND

:OBSCLOOP
ECHO.
SET OBSC=
SET /P "OBSC=Which OBS do you wish to open(32/64): "  
IF %OBSC%==32 (
	ECHO Launching %OBSC%-bit OBS Classic...
	REM START OBS 32-bit 
	START "" "C:\Program Files (x86)\OBS\OBS.exe"
	IF %SETUP%==TRUE GOTO :DISCORDLOOP
	IF %SETUP%==FALSE GOTO :COMMAND
	)
IF %OBSC%==64 (
	ECHO Launching %OBSC%-bit OBS Classic...
	REM START OBS 64-bit
	START "" "C:\Program Files\OBS\OBS.exe"
	IF %SETUP%==TRUE GOTO :DISCORDLOOP
	IF %SETUP%==FALSE GOTO :COMMAND
	)
IF /I %OBSC%==COMMAND (
	REM Command prompt
	GOTO :COMMAND
	)
IF /I %OBSC%==HELP (
	ECHO %ENTRHELP%
	GOTO :HELP
	)
IF /I %OBSC%==QUIT (
	GOTO :END
	)
	(
	ECHO %UNRG%
	REM Begin OBS Loop Again
	GOTO :OBSCLOOP
	)

:OBSSLOOP
ECHO.
SET OBSS=
SET /P "OBSS=Which OBS do you wish to open(32/64): "  
IF %OBSS%==32 (
	ECHO Launching %OBSS%-bit OBS Studio...
	REM START OBS 32-bit 
	START "" "C:\Program Files (x86)\obs-studio\bin\32bit\obs32.exe"
	IF %SETUP%==TRUE GOTO :DISCORDLOOP
	IF %SETUP%==FALSE GOTO :COMMAND
	)
IF %OBSS%==64 (
	ECHO Launching %OBSS%-bit OBS Studio...
	REM START OBS 64-bit
	START "" "C:\Program Files (x86)\obs-studio\bin\64bit\obs64.exe"
	IF %SETUP%==TRUE GOTO :DISCORDLOOP
	IF %SETUP%==FALSE GOTO :COMMAND
	)
IF /I %OBSS%==COMMAND (
	REM Command prompt
	GOTO :COMMAND
	)
IF /I %OBSS%==HELP (
	ECHO %ENTRHELP%
	GOTO :HELP
	)
IF /I %OBSS%==QUIT (
	GOTO :END
	)
	(
	ECHO %UNRG%
	REM Begin OBSS Loop Again
	GOTO :OBSSLOOP
	)

:DISCORDLOOP
ECHO.
SET DIS=
SET /P "DIS=Do you want to open Discord?(Y/N): " 
IF /I %DIS%==Y (
	ECHO Opening Discord...
	START "" https://discordapp.com/channels/@me
	IF %SETUP%==TRUE GOTO :YOUTUBELOOP
	IF %SETUP%==FALSE GOTO :COMMAND
	)
IF /I %DIS%==N (
	IF %SETUP%==TRUE GOTO :YOUTUBELOOP
	IF %SETUP%==FALSE GOTO :COMMAND
	)
IF /I %DIS%==HELP (
	ECHO %ENTRHELP%
	GOTO :HELP
	)
IF /I %DIS%==QUIT (
	GOTO :END
	)
	(
	ECHO %UNRG%
	REM Begins Discord Loop Again
	GOTO :DISCORDLOOP
	)

:SOUNDLOOP
ECHO.
SET SOUND=
SET /P "SOUND=Do you wish to open sound settings?(Y/N): " 
IF /I %SOUND%==Y (
	ECHO Opening sound settings...
	IF %SETUP%==TRUE GOTO :PROLOOP
	IF %SETUP%==FALSE GOTO :COMMAND
	)
IF /I %SOUND%==N (
	IF %SETUP%==TRUE GOTO :PROLOOP
	IF %SETUP%==FALSE GOTO :COMMAND
	)
IF /I %SOUND%==HELP (
	ECHO %ENTRHELP%
	GOTO :HELP
	)
IF /I %SOUND%==QUIT (
	GOTO :END
	)
	(
	ECHO %UNRG%
	REM Begins sound loop again
	GOTO :SOUNDLOOP
	)

:YOUTUBELOOP
ECHO.
SET YOU=
SET /P "YOU=Do you want to open Youtube?(Y/N): " 
IF /I %YOU%==Y (
	ECHO Opening Youtube...
	REM Opens youtube window
	START "" https://www.youtube.com 
	IF %SETUP%==TRUE GOTO :PROLOOP
	IF %SETUP%==FALSE GOTO :COMMAND
	)
IF /I %YOU%==N (
	REM Moves on to streampro loop
	IF %SETUP%==TRUE GOTO :PROLOOP
	IF %SETUP%==FALSE GOTO :COMMAND
	)
IF /I %YOU%==HELP (
	ECHO %ENTRHELP%
	GOTO :HELP
	)
IF /I %YOU%==QUIT (
	GOTO :END
	)
	(
	ECHO %UNRG%
	REM Begin Youtube loop
	GOTO :YOUTUBELOOP
	)

:PROLOOP
ECHO.
SET PRO=
SET /P "PRO=Do you want to open Streampro?(Y/N): " 
IF /I %PRO%==Y (
	ECHO Opening Streampro...
	START "" https://streampro.io/dashboard/main
	IF %SETUP%==TRUE GOTO :ALERTLOOP
	IF %SETUP%==FALSE GOTO :COMMAND
	)
IF /I %PRO%==N (
	IF %SETUP%==TRUE GOTO :ALERTLOOP
	IF %SETUP%==FALSE GOTO :COMMAND
	)
IF /I %PRO%==HELP (
	ECHO %ENTRHELP%
	GOTO :HELP
	)
IF /I %PRO%==QUIT (
	GOTO :END
	)
	(
	ECHO %UNRG%
	REM Begin streampro loop again
	GOTO :PROLOOP
	)

:ALERTLOOP
ECHO.
SET ALERT=
SET /P "ALERT=Do you want to open Twitch Alerts?(Y/N): " 
IF /I %ALERT%==Y (
	ECHO Opening Twitch Alerts...
	REM	Opens twitch alerts window
	START "" https://www.twitchalerts.com/
	IF %SETUP%==TRUE GOTO :DASHLOOP
	IF %SETUP%==FALSE GOTO :COMMAND
	)
IF /I %ALERT%==N (
	IF %SETUP%==TRUE GOTO :DASHLOOP
	IF %SETUP%==FALSE GOTO :COMMAND
	)
IF /I %ALERT%==HELP (
	ECHO %ENTRHELP%
	GOTO :HELP
	)
IF /I %ALERT%==QUIT (
	GOTO :END
	)
	(
	ECHO %UNRG%
	REM Begins Alert loop again
	GOTO :ALERTLOOP
	)

:DASHLOOP
ECHO.
SET DASH=
SET /P "DASH=Do you want to open Pandora?(Y/N): " 
IF /I %DASH%==Y (
	ECHO Opening Twitch Dashboard window...
	REM Opens Twitch Dashboard window
	START "" http://www.twitch.tv/%TWNAME%/dashboard
	IF %SETUP%==TRUE GOTO :PANDORALOOP
	IF %SETUP%==FALSE GOTO :COMMAND
	)
IF /I %DASH%==N (
	REM Will not open dashboard, moves on to Pandora loop
	IF %SETUP%==TRUE GOTO :PANDORALOOP
	IF %SETUP%==FALSE GOTO :COMMAND
	)
IF /I %DASH%==HELP (
	ECHO %ENTRHELP%
	GOTO :HELP
	)
IF /I %DASH%==QUIT (
	GOTO :END
	)
	(
	ECHO %UNRG%
	REM Begin Dashboard loop again
	GOTO :DASHLOOP
	)

:PANDORALOOP
ECHO.
SET PANDORA=
SET /P "PANDORA=Do you want to open Pandora?(Y/N): " 
IF /I %PANDORA%==Y (
	ECHO Opening Pandora...
	REM Opens Pandora window
	START "" http://www.pandora.com/
	IF %SETUP%==TRUE GOTO :END
	IF %SETUP%==FALSE GOTO :COMMAND
	)
IF /I %PANDORA%==N (
	REM Opens Pandora window
	IF %SETUP%==TRUE GOTO :END
	IF %SETUP%==FALSE GOTO :COMMAND
	)
IF /I %PANDORA%==HELP (
	ECHO %ENTRHELP%
	GOTO :HELP
	)
IF /I %PANDORA%==QUIT (
	GOTO :END
	)
	(
	ECHO %UNRG%
	REM Begin Pandora loop again
	GOTO :PANDORALOOP
	)

:END
ECHO.
SET END=
SET /P "END=Are you sure you want to end this session(Y/N)"
IF /I %END%==Y (
	ECHO Have fun streaming :D
	PAUSE
	EXIT
	)
IF /I %END%==N GOTO :COMMAND