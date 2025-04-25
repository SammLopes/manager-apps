@echo off
echo Qual programa vai abrir hj Samuel?
echo WebStorm - 1
echo PhpStorm - 2
echo Android Studio - 3
echo PyCharm - 4
echo Iniciar VM -5
echo Encerrar VM -6
echo Iniciar DBeaver -7
echo Acessar VM via ssh -8
echo Sair - 0

set /p soft=Digite um Numero: 

if "%soft%"=="1" (
  echo Abrindo WebStorm...
  start "" "C:\Program Files\JetBrains\WebStorm 2025.1\bin\webstorm64.exe"
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
