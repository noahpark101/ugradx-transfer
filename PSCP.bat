::============================================================
:: Script to transfer files from UGrad server to local drive
::============================================================
@echo off

::============================================================
:: Change your JHED and user folder (C:\Users\???) here
:: Set Website to 'exit' if you don't want a website to open
:: Add extra flags on the pscp command line in ExtraFlags
::	like -pw [PASSWORD]
::============================================================
set JHED=npark11
set UserFolder=noahp
set Website=https://www.gradescope.com/courses/351319
set ExtraFlags=

title Getting zip file from UGrad server
cd C:\Users\%UserFolder%
echo If not using custom option, zip file must be same name as the folder it's in 
echo and only works with my220repo folder. File goes to your Downloads folder.

set /p DIR1="Type e for exercises, h for homework, or c for custom: "
if /i "%DIR1%"=="e" (set DIR1=exercises& goto FINAL)
if /i "%DIR1%"=="h" (set DIR1=homework& goto FINAL)

:: Custom Option
set /p DIR1="Finish the file path: home/%JHED%/"
echo Executing the line: pscp %ExtraFlags% %JHED%@ugradx.cs.jhu.edu:%DIR1% Downloads
pscp %ExtraFlags% %JHED%@ugradx.cs.jhu.edu:%DIR1% Downloads
start "" %Website%
exit

:FINAL
set /p DIR2="Enter folder with file of same name: "
echo Executing the line: pscp %ExtraFlags% %JHED%@ugradx.cs.jhu.edu:my220repo/%DIR1%/%DIR2%/%DIR2%.zip Downloads
pscp %ExtraFlags% %JHED%@ugradx.cs.jhu.edu:my220repo/%DIR1%/%DIR2%/%DIR2%.zip Downloads
start "" %Website%
exit