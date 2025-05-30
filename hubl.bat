@echo off

title Menu de Programas

if "%1" NEQ "" (
  call "%~dp0cli.bat" %1 %2 
  GOTO :fim
)

echo ========================================
echo    [HUBLOCAL]   MENU DE PROGRAMAS DO SAMUEL
echo ========================================
echo [1] Abrir WebStorm
echo [2] Abrir PhpStorm
echo [3] Android Studio 
echo [4] PyCharm 
echo [5] Iniciar VM 
echo [6] Encerrar VM 
echo [7] Iniciar DBeaver 
echo [8] Acessar VM via ssh 
echo [0] Sair
echo ========================================
echo Qual programa vai abrir hj Samuel?
echo ========================================
set /p soft=Digite um Numero: 

if "%soft%"=="1" (
  call hubl\webstorm.bat 
  GOTO :fim
)

if "%soft%"=="2" (
  call hubl\webstorm\phpstorm.bat
  GOTO :fim
)

if "%soft%"=="3" (
  call hubl\android.bat
  GOTO :fim
)

if "%soft%"=="4" (
  call hubl\pycharm.bat
  GOTO :fim
)

if "%soft%"=="5" (
  echo Iniciando VM........ 
  start "" "C:\Program Files\Oracle\VirtualBox\VirtualBox.exe"
  CALL :changeDicVm
  vagrant reload --provision
  GOTO :fim
)

if "%soft%"=="6" (
  echo Encerrando VM.....
  CALL :changeDicVm
  vagrant halt
  GOTO :fim
)

if "%soft%"=="7" (
  CALL hubl\dbeaver.bat
  GOTO :fim
)

if "%soft%"=="8" (
  echo Acessando ssh VM......
  CALL :changeDicVm
  vagrant ssh
  GOTO :fim
)

if "%soft%"=="0" (
  GOTO :fim
)

echo Opcao invalida
pause
GOTO :fim

:changeDicVm
cd /d "C:\Homestead\"
GOTO :EOF

:fim 
echo Fim do Programa
