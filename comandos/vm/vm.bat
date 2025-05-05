@echo off
echo arquivo de manipulação de VM do Virtual Box
echo nesse arquivo começamos a analisar o segundo parametro informado, sem contar o primeiro nome.
echo %2 segundo parametro
 
if "%2" == "init" (
  echo Iniciando VM........ 
  start "" "C:\Program Files\Oracle\VirtualBox\VirtualBox.exe"
  CALL :changeDicVm
  vagrant reload --provision
  GOTO :fim
)

if "%2" == "stop" (
  echo Encerrando VM.....
  CALL changeDicVm
  vagrant halt
  GOTO :fim
)

if "%2"=="enter" (
  echo Acessando ssh VM......
  CALL :changeDicVm
  vagrant ssh
  GOTO :fim
)

if "%2" == "help" (
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
echo ========================================
GOTO :EOF

:changeDicVm
cd /d "C:\Homestead\"
GOTO :EOF

:fim 
echo fim do programa
