@echo off
title ***Group�˴���������V4.2 By Kaisoku
echo ��ã�%username%��
echo ������������ڣ�2020/12/09
echo.
echo ʹ��˵����
echo ������������潨����NMR���ļ��У����������Ҫ��Bruker������������������д��ͷ�ĺ˴�����ͬ��������������д�������ļ������档
echo ����ʱ��ȡ����������������������Ӳ��д���ٶȣ�ͨ����2-30���ӡ�
echo ֻ��***��������Ч������ʹ��У԰����ʵ���Һ�����������ʹ�ã���
net use \\***.***.***.*** "***password" /user:"***username" >nul
set Way=***
set /a y=%date:~0,4%,m=1%date:~5,2%-100,d=1%date:~8,2%-100
set /a TempDate=%y%*10000+%m%*100+%d%
echo.
echo ================================================================================
set /p Name=���������������д�������ִ�Сд����
echo.
echo ������������֪������%Name%�ˣ������� %TempDate% ��
echo ���������ͬ��
echo 1��ȫ���˴����ݣ��ٶ��������������ʹ��ʱ���У�
echo 2�����º˴�����
echo 3�����պ˴�����
echo 4�����3���ڵĺ˴����ݡ�����������������������Ҳ����ǰ�졢���졢������~
echo 5�����7���ڵĺ˴����ݡ�����������������������Ҳ���ǹ�ȥ��һ����~
echo 6���Զ�����������ڵĺ˴�����
echo 7��ָ��ĳһ��ĺ˴�����
echo.
set /p Run=��ѡ��һ�����ܣ�1~7����
if ��%Run%��==��1�� goto 1
if ��%Run%��==��2�� goto 2
if ��%Run%��==��2�� goto 2
if ��%Run%��==��3�� goto 3
if ��%Run%��==��4�� goto 4
if ��%Run%��==��5�� goto 5
if ��%Run%��==��6�� goto 6
if ��%Run%��==��7�� goto 7
color 4F
echo �棬����1234567����������
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
set /p Days=��Ҫͬ����������ڵĺ˴������أ���ע�⣺����Ϊ1������Ϊ2��ǰ��Ϊ3���������ƣ���������һ����������
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
set /p SetDate=��Ҫͬ����һ��ĺ˴����ݣ�YYYYMMDD��8λ���֣���
for /d %%a in (%Way%\%Name%-%SetDate%-*) do ( xcopy /d/e/h/k "%%~a" "%HOMEPATH%\Desktop\NMR\%Name%\%%~nxa\" && rd /s/q "%%~a" )
cls
echo ͬ����%SetDate%�ĺ˴����ݣ�����Ҫͬ������������
set /p Choose=�����Y/y���Լ���ͬ�������߰����س�����ֱ���˳�������
if ��%Choose%��==��y�� goto 7
if ��%Choose%��==��Y�� goto 7
exit

:Finish
cls
color 9F
echo.
echo ������Ҫ�ĺ˴����ݶ��Ѿ�ͬ���� ����\NMR\%Name%\ �ļ��������ˣ�
echo.
echo ���û�ҵ�����˵�����滹û�����������Ժ������б�����
echo.
echo �Ա��������κ����⣬�뼰ʱ���ҷ�����
echo.
echo ��лʹ�ã�ף��ʵ��˳����
echo.
pause
exit

:Finish2
cls
color 9F
echo.
echo ��ֹ�� %TempDate% �ĺ˴����ݶ��Ѿ�ͬ���� ����\NMR\%Name%\ �ļ��������ˣ�
echo.
echo ���������ʾ���������������Ĳ��������������б����������ʵ�������������
echo.
echo �Ա��������κ����⣬�뼰ʱ���ҷ�����
echo.
echo ��лʹ�ã�ף��ʵ��˳����
echo.
pause
exit