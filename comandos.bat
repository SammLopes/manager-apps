@echo off

title Menu de Programas
color 0A

echo ========================================
echo       MENU DE PROGRAMAS DO SAMUEL
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
  echo Segundo argumento: %1
  call comandos\webstorm.bat 
  GOTO :fim
)

if "%soft%"=="2" (
  echo Abrindo PhpStorm...
  start "" "C:\Program Files\JetBrains\PhpStorm 2024.3.4\bin\phpstorm64.exe"
  GOTO :fim
)

if "%soft%"=="3" (
  echo Abrindo Android Studio...
  start "" "C:\Program Files\Android\Android Studio\bin\studio64.exe"
  GOTO :fim
)

if "%soft%"=="4" (
  echo Abrindo PyCharm...
  start "" "C:\Program Files\JetBrains\PyCharm 2024.3.5\bin\pycharm64.exe"
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
  echo Abrindo DBeaver....
  start "" "C:\Users\mp_so\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\DBeaver Community\DBeaver.lnk"  
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
echo fim do programa
