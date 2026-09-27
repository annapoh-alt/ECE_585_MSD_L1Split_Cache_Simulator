@echo off
setlocal

rem 
set TRACE_FILE=inputs\tests\scenario_s2_rw_snoop_stepdump.txt
set MODE=0
set DEBUG=0

rem Usage:
rem   run.bat
rem   run.bat <mode>
rem   run.bat <mode> <trace_file>
if not "%~1"=="" set MODE=%~1
if not "%~2"=="" set TRACE_FILE=%~2

set EXE_DIR=app
set EXE_NAME=%EXE_DIR%\cache_sim.exe
set SOURCES=src\Main.c src\simulator.c src\cache.c

echo [1/2] Compiling...
set CFLAGS=-std=c11 -Wall -Wextra -pedantic -Iincludes
if "%DEBUG%"=="1" (
    set CFLAGS=%CFLAGS% -DDEBUG=1
)

if not exist %EXE_DIR% mkdir %EXE_DIR%

gcc %CFLAGS% %SOURCES% -o %EXE_NAME%
if errorlevel 1 (
    echo Compile failed.
    exit /b 1
)

echo [2/2] Running...
.\%EXE_NAME% %TRACE_FILE% %MODE%
exit /b %ERRORLEVEL%
