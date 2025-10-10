@ECHO OFF

FOR /F "delims=" %%I IN ('DIR F:\MySQL80Backup\*.sql /A-D /B /O-D /TW') DO (SET NewestFile=%%I & GOTO FoundFile)
    :FoundFile
    ECHO The newest backup file is: %NewestFile%


IF NOT "%NewestFile%" == "" (
    ECHO Restoring: %NewestFile%
    "C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" -usa -pBackup2025 -v < F:\MySQL80Backup\%NewestFile%
) ELSE (
    ECHO Nothing to do! Bye!
)