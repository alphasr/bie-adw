rem Task 1 all
rem log.txt store log history, success.txt, error.txt, state.txt get's deleted on startup
@ECHO OFF
rem Scope for cmd file
@setlocal EnableDelayedExpansion
set host=google.com
set successCount=0
set errCount=0
set totalTest=0
set lastErrCount=0
set successLimit=2
set errorLimit=2
rem Increase the loop limit of success
set increseErrorLimit=2
rem Increase the loop limit of error
set increseSuccessLimit=2

del "success.txt"
del "err.txt"
del "state.txt"

 
rem response test
:loop
rem set errCount=0 lastErrCount=0
echo OK: %successCount% ERR: %errCount% > state.txt
echo == Host is %host%.
echo == -- ERR %errCount% / %totalCount% --- SUC %successCount% / %totalCount% ------
if %successCount%==%successLimit% goto success
timeout 5
rem Finding TTL in the ping response
ping %host% | find /i "TTL"
if errorlevel 1 goto err
echo Date: %date% Time: %time% OK >> success.txt
tracert Trace: %host% >> success.txt
echo ---------------------------- >> success.txt
echo Date: %date% Time: %time% OK >> log.txt
tracert Trace: %host% >> log.txt
echo ---------------------------- >> log.txt
rem If host is available ask to try ping again
set /a successCount+=1
set /a totalCount+=1
set lastErrCount=0
goto loop
 
rem An error has occured
:err
echo Date: %date%  Time: %time%  Error >> err.txt
tracert Trace: %host% >> err.txt
echo ---------------------------- >> err.txt
echo Date: %date%  Time: %time%  Error >> log.txt
tracert Trace: %host% >> log.txt
echo ---------------------------- >> log.txt
set /a errCount+=1
set /a totalCount+=1
if %errCount% GEQ %errorLimit% (echo == -- ERR %errCount% / %totalCount% --- SUC %successCount% / %totalCount% ------ && goto postErr)  
goto loop;

 
rem Will send an error message
:postErr
echo ---------------------------------------
echo ---------------------------------------
echo ########################################### >> log.txt
echo ERR: %errCount% / %totalCount% *** SUC %successCount% / %totalCount%  >> log.txt
echo ########################################### >> log.txt
echo == Your host is reachable, want to ping again?
echo == Cannot connnect to host please check the address and try again!!!
pause
set /a errorLimit=(errorLimit + increseErrorLimit)
goto loop
 
:end

rem After 5 success pause to loop again
:success
echo ---------------------------------------
echo ---------------------------------------
echo ########################################### >> log.txt
echo ERR: %errCount% / %totalCount% *** SUC %successCount% / %totalCount%  >> log.txt
echo ########################################### >> log.txt
echo == Your host is reachable, want to ping again?
pause
if %successLimit%==%successCount% set /a successLimit=(successLimit + increseSuccessLimit)
if %errLimit%==%errCount% set /a errLimit=(errLimit + increseErrorLimit)
goto loop