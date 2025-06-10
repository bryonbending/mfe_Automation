@ECHO OFF
SET month=%DATE:~4,2%
SET year=%DATE:~-4%

ECHO Getting the current month and year month=%month% year=%year%

REM Set the Correct Month if the Month is January
IF "%month%"=="01" (
	SET month=12
	SET /A year=%DATE:~-4% - 1
) ELSE (
	ECHO else
	SET /A month=%DATE:~4,2% - 1
	SET year=%DATE:~-4%
)
	
REM Fetch the values for the previous month
ECHO Running UpdateTestAndCalPerformanceSummary for %month%-%year%
"%cd%\UpdateTestAndCalPerformanceSummary.exe" %month% %year%

REM Reset the Month and Year values for current month
SET month=%DATE:~4,2%
SET year=%DATE:~-4%

REM Fetch the values for this month
ECHO Running UpdateTestAndCalPerformanceSummary for %month%-%year%
"%cd%\UpdateTestAndCalPerformanceSummary.exe" %month% %year%

ECHO Exiting UpdateTestAndCalPerformanceSummary - BYE!