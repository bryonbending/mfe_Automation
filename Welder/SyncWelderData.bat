@ECHO OFF

REM Setup Directories
SET "workingDir=c:\Objects\Welder"
CD %workingDir%
ECHO %cd%
SET "scriptsDir=venv\Scripts"
CD %scriptsDir%
ECHO %cd%
CALL activate
CD %workingDir%
ECHO %cd%
CALL Python process_csv_files.py
CD %scriptsDir%
ECHO %cd%
CALL deactivate