@echo off
title ***Group核磁数据下载V4.2 By Kaisoku
echo 你好，%username%！
echo 本程序更新日期：2020/12/09
echo.
echo 使用说明：
echo 本程序会在桌面建立“NMR”文件夹，并按你的需要将Bruker服务器上以你名字缩写开头的核磁数据同步到以你名字缩写命名的文件夹里面。
echo 运行时间取决于数据量、网络质量和硬盘写入速度，通常在2-30分钟。
echo 只对***课题组有效，必须使用校园网（实验室和宿舍区均可使用）。
net use \\***.***.***.*** "***password" /user:"***username" >nul
set Way=***
set /a y=%date:~0,4%,m=1%date:~5,2%-100,d=1%date:~8,2%-100
set /a TempDate=%y%*10000+%m%*100+%d%
echo.
echo ================================================================================
set /p Name=请输入你的姓名缩写（不区分大小写）：
echo.
echo 好诶！现在我知道你是%Name%了！今天是 %TempDate% ！
echo 本程序可以同步
echo 1：全部核磁数据（速度慢，仅建议初次使用时运行）
echo 2：当月核磁数据
echo 3：今日核磁数据
echo 4：最近3日内的核磁数据………………………………也就是前天、昨天、今天啦~
echo 5：最近7日内的核磁数据………………………………也就是过去的一周啦~
echo 6：自定义最近几日内的核磁数据
echo 7：指定某一天的核磁数据
echo.
set /p Run=请选择一个功能（1~7）：
if “%Run%”==“1” goto 1
if “%Run%”==“2” goto 2
if “%Run%”==“2” goto 2
if “%Run%”==“3” goto 3
if “%Run%”==“4” goto 4
if “%Run%”==“5” goto 5
if “%Run%”==“6” goto 6
if “%Run%”==“7” goto 7
color 4F
echo 噫，你连1234567都不会输吗？
pause
exit

:1
for /d %%a in (%Way%\%Name%-*) do ( xcopy /d/e/h/k "%%~a" "%HOMEPATH%\Desktop\NMR\%Name%\%%~nxa\" && rd /s/q "%%~a" )
goto Finish
exit

:2
for /d %%a in (%Way%\%Name%-%DATE:~0,4%%DATE:~5,2%*) do ( xcopy /d/e/h/k "%%~a" "%HOMEPATH%\Desktop\NMR\%Name%\%%~nxa\" && rd /s/q "%%~a" )
goto Finish
exit

:3
for /d %%a in (%Way%\%Name%-%DATE:~0,4%%DATE:~5,2%%DATE:~8,2%-*) do ( xcopy /d/e/h/k "%%~a" "%HOMEPATH%\Desktop\NMR\%Name%\%%~nxa\" && rd /s/q "%%~a" )
goto Finish
exit

:4
set /a Days=2
goto Run
exit

:5
set /a Days=6
goto Run
exit

:6
echo.
set /p Days=你要同步最近几日内的核磁数据呢？（注意：今天为1，昨天为2，前天为3，依此类推，必须输入一个正整数）
set /a Days=Days-1
goto Run
exit

:Run
set /a TempDate=%y%*10000+%m%*100+%d%
for /d %%a in (%Way%\%Name%-%TempDate%-*) do ( xcopy /d/e/h/k "%%~a" "%HOMEPATH%\Desktop\NMR\%Name%\%%~nxa\" && rd /s/q "%%~a" )
if %Days% equ 0 goto Finish2
goto D

:D0
set /a d=d+31,m=m-1
if %m% equ 11 ( set /a Days=Days+1 && goto D )
if %m% equ 9 ( set /a Days=Days+1 && goto D )
if %m% equ 6 ( set /a Days=Days+1 && goto D )
if %m% equ 4 ( set /a Days=Days+1 && goto D )
if %m% equ 2 ( set /a Days=Days+3 && goto D )
if %m% equ 0 ( set /a m=m+12,y=y-1 && goto D )
goto Run

:D
set /a Days=Days-1,d=d-1
if %d% equ 0 goto D0
goto Run

:7
set Choose=Null
echo.
set /p SetDate=你要同步哪一天的核磁数据（YYYYMMDD，8位数字）：
for /d %%a in (%Way%\%Name%-%SetDate%-*) do ( xcopy /d/e/h/k "%%~a" "%HOMEPATH%\Desktop\NMR\%Name%\%%~nxa\" && rd /s/q "%%~a" )
cls
echo 同步了%SetDate%的核磁数据，还需要同步其他日期吗？
set /p Choose=输入→Y/y←以继续同步，或者按→回车键←直接退出本程序：
if “%Choose%”==“y” goto 7
if “%Choose%”==“Y” goto 7
exit

:Finish
cls
color 9F
echo.
echo 所有你要的核磁数据都已经同步至 桌面\NMR\%Name%\ 文件夹下面了！
echo.
echo 如果没找到，就说明下面还没传上来，请稍后再运行本程序。
echo.
echo 对本程序有任何问题，请及时向我反馈！
echo.
echo 感谢使用，祝你实验顺利！
echo.
pause
exit

:Finish2
cls
color 9F
echo.
echo 截止至 %TempDate% 的核磁数据都已经同步至 桌面\NMR\%Name%\ 文件夹下面了！
echo.
echo 如果上面显示的日期与你期望的不符，请重新运行本程序并输入适当的天数参数。
echo.
echo 对本程序有任何问题，请及时向我反馈！
echo.
echo 感谢使用，祝你实验顺利！
echo.
pause
exit