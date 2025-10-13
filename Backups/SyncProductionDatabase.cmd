SET LOGFILE=C:\temp\restore_log.txt

ECHO ========================================== >> %LOGFILE%
ECHO Restore operation started: %DATE% %TIME% >> %LOGFILE%
ECHO ========================================== >> %LOGFILE%

FOR /F "delims=" %%I IN ('DIR F:\MySQL80Backup\*.sql /A-D /B /O-D /TW') DO (SET NewestFile=%%I & GOTO FoundFile)
    :FoundFile
    ECHO The newest backup file is: %NewestFile% >> %LOGFILE%
    ECHO The newest backup file is: %NewestFile%

IF NOT "%NewestFile%" == "" (
    ECHO Restoring: %NewestFile% >> %LOGFILE%
    ECHO Restoring: %NewestFile%
    "C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" -usa -pBackup2025 -v < F:\MySQL80Backup\%NewestFile% >> %LOGFILE% 2>&1
    IF %ERRORLEVEL% EQU 0 (
        ECHO Restore completed successfully >> %LOGFILE%
        ECHO Restore completed successfully
    ) ELSE (
        ECHO Restore failed with error code: %ERRORLEVEL% >> %LOGFILE%
        ECHO Restore failed with error code: %ERRORLEVEL%
    )
) ELSE (
    ECHO Nothing to do! Bye! >> %LOGFILE%
    ECHO Nothing to do! Bye!
)

ECHO ========================================== >> %LOGFILE%
ECHO.