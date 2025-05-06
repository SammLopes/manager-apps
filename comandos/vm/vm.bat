@echo off

if "%1" == "init" (
  echo Iniciando VM........ 
  start "" "C:\Program Files\Oracle\VirtualBox\VirtualBox.exe"
  CALL :changeDicVm
  vagrant reload --provision
  GOTO :fim
)

if "%1" == "stop" (
  echo Encerrando VM.....
  CALL :changeDicVm
  vagrant halt
  GOTO :fim
)

if "%1"=="enter" (
  echo Acessando ssh VM......
  CALL :changeDicVm
  vagrant ssh
  GOTO :fim
)

if "%1"=="status" (
  echo Status...
  CALL :changeDicVm
  vagrant status 
  GOTO :fim
)

if "%1" == "help" (
  CALL :help
  GOTO :fim
)

:help 
echo ========================================
echo       MENU DE PROGRAMAS DO SAMUEL
echo ========================================
echo [init] Iniciar VM 
echo [stop] Para VM
echo [enter] Acessar VM via SSH 
echo [status] Verificar Status VM
echo ========================================
GOTO :EOF

:changeDicVm
cd /d "C:\Homestead\"
GOTO :EOF

:fim 
