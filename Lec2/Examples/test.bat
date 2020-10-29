@echo off 
rem for loops
rem /L  			=> numerical values
rem %%i 			=> loop iterator
rem (1,1,5) 	=> star=1, step=1, end=5  
rem (5,-1,-1) => star=5, step=-1, end=-1  
for /L %%i in (5,-1,-1) do echo %%i 

rem /F            => for file contents
rem "tokens=1-3"  => numbered item to read from each line (default=1)
rem "delims= "    => delimeter character (default=space
for /F "tokens=1-3 delims= " %%i in (input.txt) do (
CALL helloWorld.bat %%i %%j %%k
)

rem copy command to copy any file to any folder or inside another file 
rem 1- copy file.txt file2.txt (will copy content of file1 to content of file2, if file2
rem    don't exist it will create it then copy the content to it) 
rem 2- copy file.txt /y TXT  (copy file.txt and overwrite if it already exists without asking)
rem    copy file.txt /-y TXT (copy file.txt and asks everytime if you want to overwrite a pre-existing one)
rem 3- xcopy /y /E TXT folders (copy the whole directories and sub directories of TXT to folders)
rem    xcopy not copy 
rem 4- copy /y TXT\*.txt file.txt (copy the contents of any .txt file present in TXT directory to file.txt)
rem 5- copy con output.txt (copy from the console directly to the file)