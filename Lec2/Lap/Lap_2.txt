@echo off 

for /F "tokens=1-4 delims= " %%i in (input.txt) do (
 
 IF EXIST "Text Files" (
 echo Text Files Folder already exists
 ) ELSE (
 mkdir "Text Files" 
 ) 
 IF EXIST "Source Files" (
 echo Source Files Folder already exists
 ) ELSE (
 mkdir "Source Files" 
 ) 
 IF EXIST "Header Files" (
 echo Header Files Folder already exists
 ) ELSE (
 mkdir "Header Files" 
 ) 
 
 IF EXIST %%i ( 
 echo %%i already exists
 ) ELSE (
 mkdir %%i
 )
 
 rem the tokens must be given consecutive letters
 rem if first token = %%i then, second must be %%j and third must be %%k and fourth must be %%l 
 rem (i,j,k,l) or (a,b,c,d) or etc..
 
 IF EXIST %%i\%%j (
 for /F "tokens=1" %%x in (%%i\%%j) do (
 rem calling a function or a subroutine outside for loop 
 rem because a variable will not change inside a for loop instantly 
 rem therefore we have two options  1- setlocal enabledelayedexpansion (at start of script)
 rem                                2- Create a batch function/subroutine using batch goto labels :Label 
 rem first parameter passed is iterator (to be incremented)
 rem second paramter passed is path of file (to be overwritten/updated by the new value)
 CALL :add_func "%%x" "%%i\%%j"
 )
 ) ELSE (
 echo 0 > %%i\%%j
 )
 
 IF EXIST %%i\%%k (
 for /F "tokens=1" %%y in (%%i\%%k) do ( CALL :add_func "%%y" "%%i\%%k" )
 ) ELSE (
 echo 0 > %%i\%%k
 )
 
 IF EXIST %%i\%%l (
 for /F "tokens=1" %%z in (%%i\%%l) do ( CALL :add_func "%%z" "%%i\%%l")
 ) ELSE (
 echo 0 > %%i\%%l
 )
 
 copy /y %%i\*.txt "Text Files"
 copy /y %%i\*.c "Source Files"
 copy /y %%i\*.h "Header Files"
)

GOTO :END

rem add_func is a function or subroutine
:add_func
rem %1: first parameter passed to function (number inside file)
rem %2: second parameter passed to function (path of file)
set /A var=%1+1
echo %var% > %2
rem goto :EOF  is used for exiting the subroutine and continue processing in FOR loop in second line.
rem It does not exit processing of the batch file, it exits only the processing of the subroutine
GOTO :EOF

:END
pause