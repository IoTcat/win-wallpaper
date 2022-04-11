%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit
@echo off

schtasks /delete /tn win-wallpaper /f

echo. 
echo.
echo. Your Wallpapers will no longer be updated!
echo. 
echo.                             IoTcat(http://iotcat.me)

pause
exit
