@echo off

SET logDateTime=%DATE:~-4%%DATE:~4,2%%DATE:~7,2%_%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
SET logDateTime=%logDateTime: =0%
SET LOGFILE=F:\MySQL51Backup\restore-planning-consumables-table-log_%logDateTime%.txt
SET destPath=F:\MySQL51Backup

ECHO ========================================== >> %LOGFILE%
ECHO Restore operation started: %DATE% %TIME% >> %LOGFILE%
ECHO ========================================== >> %LOGFILE%

FOR /F "delims=" %%I IN ('DIR F:\MySQL51Backup\MySQL51_planning_consumables_table_*.sql /A-D /B /O-D /TW') DO (SET NewestFile=%%I & GOTO FoundFile)
    :FoundFile
    ECHO The newest backup file is: %NewestFile% >> %LOGFILE%
    ECHO The newest backup file is: %NewestFile%

IF NOT "%NewestFile%" == "" (
	IF EXIST "%destPath%\%NewestFile%" (
		ECHO Restoring: "%destPath%\%NewestFile%" >> %LOGFILE%
		ECHO Restoring: "%destPath%\%NewestFile%"
		"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" -usa -pBackup2025 -v planning < "%destPath%\%NewestFile%" >> %LOGFILE% 2>&1
		IF %ERRORLEVEL% EQU 0 (
			ECHO Restore completed successfully >> %LOGFILE%
			ECHO Restore completed successfully
		) ELSE (
			ECHO Restore failed with error code: %ERRORLEVEL% >> %LOGFILE%
			ECHO Restore failed with error code: %ERRORLEVEL%
		)
	) ELSE (
		ECHO Failed "%destPath%\%NewestFile%" doesn't exist >> %LOGFILE%
		ECHO Failed "%destPath%\%NewestFile%" doesn't exist
	)
) ELSE (
    ECHO Nothing to do! Bye! >> %LOGFILE%
    ECHO Nothing to do! Bye!
)

ECHO ========================================== >> %LOGFILE%
ECHO.