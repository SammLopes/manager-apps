@echo off
chcp 65001 >nul
:: >>> PONTO DE ENTRADA <<< 
GOTO :main
:: ======== Funções ========
:changeDicForRootProjectAndroid
cd /d "%projectRoot%"
if not exist gradlew (
  echo [Erro] gradlew não encontrado no diretório informado.
  EXIT /B 1
)
GOTO :EOF

:help
echo ========================================
echo   MENU DE PROGRAMAS DO SAMUEL [Android]
echo ========================================
echo [build] Faz o build do aplicativo
echo [apk] Cria os apk's tando Release quanto Debug
echo [bundle] Cria o bundle em formato .aab  
echo [singer] Verifica se o apk ou o bundle esta assinado
echo ========================================
GOTO :EOF

:verifyFail
IF ERRORLEVEL 1 (
    echo Erro: gradlew dependencies falhou com ERRORLEVEL %ERRORLEVEL%.
    EXIT /B 1
)
GOTO :EOF

:bundle
gradlew bundleRelease
GOTO :EOF

:clean
gradlew clean  
GOTO :EOF

:dependencies
gradlew dependencies
GOTO :EOF

:build
gradlew clean  
IF ERRORLEVEL 1 (
    echo Erro: gradlew dependencies falhou com ERRORLEVEL %ERRORLEVEL%.
    EXIT /B 1
)
gradlew dependencies 
IF ERRORLEVEL 1 (
    echo Erro: gradlew dependencies falhou com ERRORLEVEL %ERRORLEVEL%.
    EXIT /B 1
)


:: ======== Inico da lógica ========
:main
if "%1"=="" (
  echo Abrindo Android Studio...
  start "" "C:\Program Files\Android\Android Studio\bin\studio64.exe"
  timeout /t 8  >nul
  GOTO :fim
)

if "%1"=="help" (
  CALL :help
  GOTO :fim
)

set /p projectRoot=Copie o diretório do projeto andorid (Caminho Absoluto):
if "%projectRoot%"=="" (
    echo Nenhum diretório foi informado. Saindo...
    EXIT /B 1
)
:: Mudar para o diretório onde esta o projeto android
CALL :changeDicForRootProjectAndroid || EXIT /B 1
:: Executar o comando de clean e dependencies
if "%1"=="build" GOTO :build

::OBS: adicionar comandos do adb (Android Debug Bridge)

:fim
EXIT /B
