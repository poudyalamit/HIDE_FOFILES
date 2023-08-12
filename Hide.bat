cls

:hider
@echo off
title HIDER
echo 1. Show Folder/Files
echo 2. Hide Folder/Files
set/p "hj=>"
if %hj% ==  1 goto UNLOCK
if %hj% ==  2 goto LOCK
goto hider

:LOCK
echo Please enter the name of folder/file you want to hide
set/p "folder=>"
goto CONFIRM

:CONFIRM
echo Are you sure to lock this folder/file?(Y/N)
set/p "cop=>"

if %cop% == Y goto LOCKED

if %cop% == y goto LOCKED

if %cop% == n goto End

if %cop% == N goto End

echo Invalid Choice.

goto CONFIRM

:LOCKED
ren %folder% Hidden

echo Hidden Folder/File: %folder% >>Hidden.txt

attrib +h +s %folder%

echo Folder/File Locked

goto End

:UNLOCK

echo Enter Passsword to Unlock Your Secured Folder/File

set/p "pass=>"

if NOT %pass% ==3500 goto FAIL

echo Please enter the name of folder/file you want to unlock

set/p "folder=>"

attrib -h -s %folder%

del Hidden.txt

echo Folder/File Unlocked successfully

ren Hidden %folder% 

goto End

:FAIL

@echo off

color 02
@REM JUST RANDOM
echo Warning-Virus Initiated total hardrive corruption imminent

timeout /t 10 /nobreak >nul

set count= 0

:tricks

if %count% == 50 goto shutdown

echo %random% %random%

set/a count = %count%+1

goto tricks

:shutdown

cls

shutdown -s -t 45 /c "You have tried to acces a file that is not yours. Bye."

echo Enter password to start Abort Sequence

set/p "pass=>"

if NOT %pass% ==3500 goto shutdown

echo Abort Initiated 

goto Abort

:Abort

C:\Windows\System32\shutdown.exe -a

echo Abort Successful

timeout /t 3 /nobreak >nul

goto UNLOCK

goto End