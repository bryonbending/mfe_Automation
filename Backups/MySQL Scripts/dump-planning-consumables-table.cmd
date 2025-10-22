@echo off

"C:\Program Files (x86)\MySQL\MySQL Server 5.1\bin\mysqldump.exe" --defaults-extra-file="C:\Program Files (x86)\MySQL\MySQL Server 5.1\mybackup.ini" planning consumables --verbose 2> "F:\MySQL51Backup\planning-consumables-table-error.log" 1> "F:\MySQL51Backup\MySQL51_planning_consumables_table_%DATE:~-4%-%DATE:~4,2%-%DATE:~7,2%_%TIME:~0,2%-%TIME:~3,2%-%TIME:~6,2%.sql"
