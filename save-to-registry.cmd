  rem Task 2 part 1
  @ECHO off

  rem setting arguments required to store in registry \HKEY_CURRENT_USER\Software\BIE-ADW
  set regKey=HKCU\Software\BIE-ADW
  set value=cv2-counter
  set type=REG_SZ
 
  rem create registry if not exist
  REG QUERY %regKey% /v %value%
  IF ERRORLEVEL 1 (REG ADD %regKey% /v %value% /d 0 /t %type% /f)
 
  rem tokens=3, taking 3rd collumn containg data in registry
  FOR /F "skip=1 tokens=3" %%a IN ('REG QUERY %regKey% /v %value%') DO (
    SET /A counter =%%a 
  )
 
  SET /A counter += 1
  ECHO %counter% >> counter.txt
  REG ADD %regKey% /v %value% /d %counter% /t %type% /f
