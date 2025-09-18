@echo off

"C:\Program Files\MySQL\MySQL Server 8.0\bin\mysqldump.exe" --defaults-extra-file="C:\Program Files\MySQL\MySQL Server 8.0\mybackup.ini" --all-databases --routines --verbose 2> "F:\MySQL80Backup\error.log" 1> "F:\MySQL80Backup\MySQL80_AllDB_%DATE:~-4%-%DATE:~4,2%-%DATE:~7,2%_%TIME:~0,2%-%TIME:~3,2%-%TIME:~6,2%.sql"
