@echo off
REM	goto asadmin
	color 0a
	chcp 1251
TIMEOUT /T 1 /NOBREAK
goto menu

REM java -version 
REM if errorlevel 1 goto javaerror
if exist %~dp0 goto menu


:menu
echo ========================================
echo    ��� ��������������� �������� �����
echo ----------------------------------------
echo             Ai-Bolit Menu
echo ----------------------------------------
echo 1 : �������� � ������� ������ (start.bat)
echo 2 : �������� � �������������� ������ (start_paranoic.bat)
echo 3 : �������� � �������� AI-QUARANTINE-XXXXX.zip (scan_and_quarantine.bat)
REM echo 4 : 
echo ----------------------------------------
echo x : Exit
echo i : Info
echo ========================================
set /p NUM="Choice :"
if "%NUM%"=="1" goto normal
if "%NUM%"=="2" goto paranoic
if "%NUM%"=="3" goto quarantine

if "%NUM%"=="x" goto quit
if "%NUM%"=="i" goto info


:normal
cls
REM  KOD
cmd /k ".\start_default.bat"
pause
cls
goto menu


:paranoic
cls
REM  KOD
.\start_paranoic.bat
pause
cls
goto menu


:quarantine
cls
REM  KOD
scan_and_quarantine.bat
pause
cls
goto menu

REM cmd\7za a -tzip deodex_install.zip system


:info
cls
echo ======================== INFO =======================
echo �����! �� ������������� ������ ����� � ������� � �������� �������.
echo ��������:
echo C:\Documents and Settings\������\��������\aibolit-for-windows\ - �� ����� ��������
echo 
echo C:\aibolit\ai-bolit-for-windows\
echo ��� 
echo d:\mysites\aibolit-for-windows\ - ����� �������� 
echo 
echo 
echo ....
echo === ��� ��������������� �������� �����  ===
echo 
echo 1. ���������� ����� ��������� ����� ������ ����� ��� 
echo �����, ������� �� ������ ���������, � ����� site
echo ...
echo 2. ��������� start.bat (�������� � ������� ������) ��� 
echo start_paranoic.bat (�������� � �������������� ������) 
echo ��� ���� ����� ��������� ���� �� ������ � ��������� �������
echo ...
echo 3. �� ���������� �������� �������� ���� AI-BOLIT-REPORT.html
echo ...
echo 
echo ��� �������� ������ ������������� 
echo 
echo 1. ���������� ����� ��������� ����� ������ ����� ��� �����,
echo ������� �� ������ ���������, � ����� site
echo ...
echo 2. ��������� scan_and_quarantine.bat 
echo ...
echo 3. �� ���������� �������� �������� ���� AI-QUARANTINE-XXXXX.zip
echo � ����� AI-BOLIT-REPORT (������ XXXXX ����� �����)
echo 
echo 4. ��������� ����� AI-QUARANTINE-XXXXX.zip �� ��.����� 
echo �� ai@revisium.com � ����� ������ "��������� �����". 
echo � ������ ����� ��� �����������, ������� �����.
echo 
echo =====================================================
pause
cls
goto menu


:quit
echo ===== END KOD ======
TIMEOUT /T 10 /NOBREAK
exit
pause>nul
exit /b

:asadmin {
	reg.exe query "HKU\S-1-5-19">nul 2>&1
	if %errorlevel% equ 1 goto UACPrompt
	color 0a
	chcp 1251
}


:UACPrompt
mshta "vbscript:CreateObject("Shell.Application").ShellExecute("%~fs0", "", "", "runas", 1) & Close()"
exit /b
cmd /K goto menu
goto menu