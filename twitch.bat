@ECHO Off

REM Variables
SET SETUP=FALSE
SET ENTRHELP=Entering help...
SET UNRG=Unrecognized Command, Try Again

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
IF /I %COMMAND%==OBS (
	ECHO You entered OBS...
	REM Moving to OBSLOOP
	GOTO :OBSLOOP
	)
REM IF /I %COMMAND%==SOUND (
	REM Moving to SOUNDLOOP
REM	GOTO :SOUNDLOOP
REM	)
IF /I %COMMAND%==PRO (
	REM Moving to SOUNDLOOP
	GOTO :PRO
	)
IF /I %COMMAND%==ALERT (
	REM Moving to SOUNDLOOP
	GOTO :ALERTLOOP
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
ECHO 	OBS : Launch OBS program
ECHO 	SOUND: **IN DEVELOPMENT** Launch Sound Settings program
ECHO 	PRO: Launch Streampro.com program
ECHO 	ALERT: Launch TwitchAlerts.com program
ECHO 	PANDORA: Launch Pandora.com program
ECHO 	QUIT: Soft Quit
ECHO 	EXIT: Hard Quit
ECHO 	HELP: Show command list
GOTO :COMMAND

:OBSLOOP
ECHO.
SET OBS=
SET /P "OBS=Which OBS do you wish to open(32/64): "  
IF %OBS%==32 (
	ECHO Launching %OBS%-bit OBS...
	REM START OBS 32-bit 
	START "" "C:\Program Files (x86)\OBS\OBS.exe"
	IF %SETUP%==TRUE GOTO :PROLOOP
	IF %SETUP%==FALSE GOTO :COMMAND
	)
IF %OBS%==64 (
	ECHO Launching %OBS%-bit OBS...
	REM START OBS 64-bit
	START "" "C:\Program Files\OBS\OBS.exe"
	IF %SETUP%==TRUE GOTO :PROLOOP
	IF %SETUP%==FALSE GOTO :COMMAND
	)
IF /I %OBS%==COMMAND (
	REM Command prompt
	GOTO :COMMAND
	)
IF /I %OBS%==HELP (
	ECHO %ENTRHELP%
	GOTO :HELP
	)
IF /I %OBS%==QUIT (
	GOTO :END
	)
	(
	ECHO %UNRG%
	REM Begin OBS Loop Again
	GOTO :OBSLOOP
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
	REM Begin OBS Loop Again
	GOTO :SOUNDLOOP
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
	REM Begin OBS Loop Again
	GOTO :PROLOOP
	)

:ALERTLOOP
ECHO.
SET ALERT=
SET /P "ALERT=Do you want to open Twitch Alerts?(Y/N): " 
IF /I %ALERT%==Y (
	ECHO Opening Twitch Alerts...
	START "" https://www.twitchalerts.com/
	IF %SETUP%==TRUE GOTO :PANDORALOOP
	IF %SETUP%==FALSE GOTO :COMMAND
	)
IF /I %ALERT%==N (
	IF %SETUP%==TRUE GOTO :PANDORALOOP
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
	REM Begin OBS Loop Again
	GOTO :ALERTLOOP
	)

:PANDORALOOP
ECHO.
SET PANDORA=
SET /P "PANDORA=Do you want to open Pandora?(Y/N): " 
IF /I %PANDORA%==Y (
	ECHO Opening Pandora...
	REM START OBS 32-bit
	START "" http://www.pandora.com/
	IF %SETUP%==TRUE GOTO :END
	IF %SETUP%==FALSE GOTO :COMMAND
	)
IF /I %PANDORA%==N (
	REM START OBS 64-bit
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
	REM Begin OBS Loop Again
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