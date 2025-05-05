@echo off
echo Arquivo cli.bat 

//Redirecionar para phpstorm.bat
if "%1" == "phpstorm" (
  CALL comandos\phpstorm.bat 
  GOTO :fim
)
//Redirecionar para websotorm.bat
if "%1" == "webstorm"(
  CALL comandos\webstorm.bat
  GOTO :fim
)
//Redirecionar para pycharm.bat
if "%1" == "pycharm" (
  CALL comandos\pycharm.bat  
  GOTO :fim
)
//Redicerionar para android-studio.bat 
if "%1" == "andoroid" (
  CALL comandos\android.bat
  GOTO :fim
)
//Redirecionar para vm.bat
if "%1" == "vm" (
  CALL comandos\vm\vm.bat
  GOTO :fim
)
//Caso não seja nenhum deles mostramos a tela de help
if "%1" == "help" (
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
echo ========================================
GOTO :EOF

:fim 
echo fim do programa
