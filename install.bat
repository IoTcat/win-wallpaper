%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
@echo off
setlocal enabledelayedexpansion
cd /d "%~dp0"

rem check_dir
if not exist %appdata%\win-wallpaper call :mv_dir

schtasks /create /tn win-wallpaper /tr %appdata%\win-wallpaper\win-wallpaper.vbs /sc ONLOGON /delay 0000:30 /f
wscript %appdata%\win-wallpaper\win-wallpaper.vbs

echo. 
echo.
echo. Please find Wallpapers at %userprofile%\Pictures\win-wallpaper
echo. Wallpapers will be auto-updated when your system is IDLE!
echo. 
echo.                             IoTcat(http://iotcat.me)

pause
exit

:mv_dir
md %appdata%\win-wallpaper
xcopy /Y /Q /E . %appdata%\win-wallpaper