@echo off
set logfile=log.csv
set stats_file=stats.txt
SETLOCAL EnableDelayedExpansion

if not exist stats.txt echo 0 0 0> %stats_file%

for /f "TOKENS=1,2,3" %%a in (stats.txt) do (
set test_num=%%a
set fail_num=%%b
set consecutive_fail=%%c
) 

ping %1 | find "bytes"

if %errorlevel% == 1 ( 
	set result="FAILURE"
	set /a success_cntr += 1
	set /a failure_cntr += 1
	set /a consecutive_failure_cntr += 1
) else ( 
	set result="SUCCESS"
	set /a success_cntr += 1
	set /a failure_cntr += 0
	set /a consecutive_failure_cntr=0
)

if !consecutive_fail! GEQ 5 (
	echo "ERROR,SERVER IS DOWN"
	set /a success_cntr=0
	set /a failure_cntr=0
	set /a consecutive_failure_cntr=0
)


echo "RESULT","!result!"	"DATE", "%date%"	"TIME","%time%" > %logfile%
echo !success_cntr! !failure_cntr! !consecutive_failure_cntr! > %stats_file%

ENDLOCAL