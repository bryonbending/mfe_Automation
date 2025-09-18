@ECHO OFF

ECHO %DATE% %TIME%
SET dateTime=%DATE:~-4%%DATE:~4,2%%DATE:~7,2%_%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
SET dateTime=%dateTime: =0%
SET logFileName=backup-MySQL80-ALLDB-X-drive-%dateTime%.log

ECHO Starting Backup for MySQL80-ALLDB to X-drive Operations\MFE_SOFTWARE\MySQL80Backup folder %dateTime%

REM robocopy "Z:\Operations" "X:\Operations" /mir /mt /zb /r:3  /LOG:C:\temp\backup\backup-X-Drive-2025-04-25.log
"C:\Windows\System32\robocopy" "F:\MySQL80Backup" "X:\Operations\MFE_SOFTWARE\MySQL80Backup" /mir /mt:96 /zb /r:3 /LOG:C:\temp\backup\%logFileName%
	
ECHO Exiting Backup for MySQL80-ALLDB to X-drive Operations\MFE_SOFTWARE\MySQL80Backup folder %dateTime% - BYE!