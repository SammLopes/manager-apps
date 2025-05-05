@echo off
echo Meu cli primitivo

if "%1"=="phpstorm" (
  CALL comandos\phpstorm.bat 
  GOTO :fim
) 

if "%1"=="webstorm" (
  echo Teste dentor do webstorm
  CALL comandos\webstorm.bat
  GOTO :fim
)

if "%1"=="pycharm" (
  CALL comandos\pycharm.bat  
  GOTO :fim
)

if "%1"=="android" (
  CALL comandos\android.bat
  GOTO :fim
)

if "%1"=="vm" (
  CALL comandos\vm\vm.bat %2
  GOTO :fim
)

if "%1"=="help" (
  GOTO :help 
  GOTO :fim
)

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
