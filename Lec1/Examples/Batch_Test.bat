@echo off
rem @echo off 3shan ma5lesh el command
rem yezhar m3 el o/p.

echo 3yz eh ?

rem hena 3yz a3rf variable
rem hast5dm command set
set x=40
echo The Variable x = %x%

rem lw 3yz a5od i/p mel user
set /p y=please enter a value for y: 
echo The Variable y = %y%

rem to calculate an arthmetic op
set /a z=%x%-%y%
echo x - y = %z%

rem save shwyt kalam fe file
rem (>) by overwrite el file kolo
rem (>>) by append 3al file 
set output=test da ya m3lm
echo %output% > test.txt

rem (=<) lw 3yz te2ra mel text file bs
rem by2ra one line bs
set/p x=<test.txt
echo %x%

rem create a .txt file w ekteb feeh
set text_value=Hello Yasta
set output_file=out.txt
echo %text_value% > %output_file%

rem attrib -r removes the read only attribute
rem attrib +r adds the read only attribute
attrib -r %output_file%
echo %text_value% > %output_file%
attrib +r %output_file%

rem mkdir to create a directory 
set out_dir=test_dir
mkdir %out_dir%
rem cd to change current directory
cd %out_dir%
set text_value=3yz eh ??
set output_file_2=out_2.txt
echo %text_value% > %output_file_2%
cd ..

pause