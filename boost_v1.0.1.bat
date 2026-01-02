@echo off
setlocal EnableExtensions EnableDelayedExpansion

echo ===============================
echo   Speedtest Runner
echo view project on GitHub: https://github.com/BihanDoo/ISP-SpeedBoost
echo ===============================
echo.

:: Ask user for interval
set /p INTERVAL=Run it every (seconds): 

:: Validate input (must be a number)
for /f "delims=0123456789" %%A in ("%INTERVAL%") do (
    echo.
    echo ERROR: Please enter a valid number.
    pause
    exit /b
)

if "%INTERVAL%"=="" (
    echo.
    echo ERROR: Interval cannot be empty.
    pause
    exit /b
)

:: Define exe in same folder
set "EXE=%~dp0speedtest.exe"

:: Check if exe exists
if not exist "%EXE%" (
    echo.
    echo ERROR: speedtest.exe not found in:
    echo %~dp0
    echo.
    echo Place this BAT file in the same folder as speedtest.exe
    pause
    exit /b
)

echo.
echo Running every %INTERVAL% seconds
echo Press CTRL+C to stop.
echo.

:: Main loop
:loop

echo --------------------------------
echo [%DATE% %TIME%] Running speedtest
echo --------------------------------

"%EXE%"

echo.

:: Calculate silent wait time
set /a SILENT=%INTERVAL%-30
if !SILENT! lss 0 set SILENT=0

if !SILENT! gtr 0 (
    timeout /t !SILENT! /nobreak >nul
)

:: Countdown length
set COUNTDOWN=30
if %INTERVAL% lss 30 set COUNTDOWN=%INTERVAL%

:: Countdown
for /L %%S in (!COUNTDOWN!,-1,1) do (

    cls
    echo ===============================
    echo   Speedtest Runner
    echo view project on GitHub: https://github.com/BihanDoo/ISP-SpeedBoost
    echo ===============================
    echo.
    echo   Running again in %%S seconds
    echo Press CTRL+C to stop.

    echo.
    timeout /t 1 /nobreak >nul
)
cls
echo ===============================
echo   Speedtest Runner
echo view project on GitHub: https://github.com/BihanDoo/ISP-SpeedBoost
echo ===============================
echo.
echo Press CTRL+C to stop.
goto loop
