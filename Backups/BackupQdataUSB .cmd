@ECHO OFF

ECHO %DATE% %TIME%
SET dateTime=%DATE:~-4%%DATE:~4,2%%DATE:~7,2%_%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
SET dateTime=%dateTime: =0%
SET logFileName=backup-Qdata-%dateTime%.log

ECHO Starting Backup for Qdata folder to USB %dateTime%

REM robocopy "Q:\ " "D:\2025-03-10\Qdata" /mir /mt /zb /r:3  /LOG:C:\temp\backup\backup-Qdata-2025-04-08.log
"C:\Windows\System32\robocopy" "Q:\ " "D:\2025-03-10\Qdata" /mir /mt:64 /zb /r:3 /LOG:C:\temp\backup\%logFileName%
	
ECHO Exiting Backup for Qdata folder to USB %dateTime% - BYE!