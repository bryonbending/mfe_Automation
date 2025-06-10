@ECHO OFF

ECHO %DATE% %TIME%
SET dateTime=%DATE:~-4%%DATE:~4,2%%DATE:~7,2%_%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%
SET dateTime=%dateTime: =0%
SET logFileName=backup-Operations-2-%dateTime%.log

ECHO Starting Backup for Operations folder to USB-2 %dateTime%

"C:\Windows\System32\robocopy" "Z:\Operations" "D:\2025-05-15\Operations" /mir /mt:64 /zb /r:3 /LOG:C:\temp\backup\%logFileName%
	
ECHO Exiting Backup for Operations folder to USB-2 %dateTime% - BYE!