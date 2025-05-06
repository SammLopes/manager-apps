@echo off

set MeuDictCurr=%CD%

if "%1"=="phpstorm" (
  CALL "%~dp0comandos\phpstorm.bat" 
  GOTO :fim
) 

if "%1"=="webstorm" (
  CALL "%~dp0comandos\webstorm.bat"
  GOTO :fim
)

if "%1"=="pycharm" (
  CALL "%~dp0comandos\pycharm.bat""  
  GOTO :fim
)

if "%1"=="android" (
  CALL "%~dp0comandos\android.bat"
  GOTO :fim
)

if "%1"=="vm" (
  CALL "%~dp0comandos\vm\vm.bat" %2
  CALL :changeDicCurrent
  GOTO :fim
)

if "%1"=="help" (
  GOTO :help 
  GOTO :fim
)

:changeDicCurrent
cd /d %MeuDictCurr%
GOTO :EOF

:help 
echo ========================================
echo       MENU DE PROGRAMAS DO SAMUEL
echo ========================================
echo [webstorm] Abrir WebStorm
echo [phpstorm] Abrir PhpStorm
echo [android] Android Studio 
echo [pycharm] PyCharm 
echo [vm] Acessar VM cmd
echo ========================================
GOTO :EOF

:fim  
