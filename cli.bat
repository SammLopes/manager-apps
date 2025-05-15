@echo off

set MeuDictCurr=%CD%

if "%1"=="phpstorm" (
  CALL "%~dp0hubl\phpstorm.bat" 
  GOTO :fim
) 

if "%1"=="webstorm" (
  CALL "%~dp0hubl\webstorm.bat"
  GOTO :fim
)

if "%1"=="pycharm" (
  CALL "%~dp0hubl\pycharm.bat""  
  GOTO :fim
)

if "%1"=="android" (
  CALL "%~dp0hubl\android\android.bat" %2 
  GOTO :fim
)

if "%1"=="dbeaver" (
  CALL "%~dp0hubl\dbeaver.bat"
  GOTO :fim
)

if "%1"=="vm" (
  CALL "%~dp0hubl\vm\vm.bat" %2
  CALL :changeDicCurrent
  GOTO :fim
)

if "%1"=="git" (
  CALL "%~dp0hubl\git\git.bat" %2 
  GOTO :fim
)

if "%1"=="exp" (
  start .
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
echo [exp] Abrir explorer de arquivos
echo ========================================
GOTO :EOF

:fim  
