@echo off
if [%1]==[] goto Invalid_Input
if [%2]==[] goto Invalid_Input
rem or we can just check on the 3rd parameter
rem if doesn't exist then certainly there is a missing
rem parameter (which is the third)
if [%3]==[] goto Invalid_Input
set text_value=%1
set output_folder=%2
set output_file=%3
if exist TXT (
goto AfterTXTDirectory
)
mkdir TXT
:AfterTXTDirectory
cd TXT
if exist %output_folder% (
goto AfterO/PFolderDirectory
)
mkdir %output_folder%
:AfterO/PFolderDirectory
cd %output_folder%
if exist %output_file% (
cd ../../
goto end
)
echo %text_value% > %output_file%
cd ../../
goto end
:Invalid_Input
echo INVALID INPUT !
:end
pause