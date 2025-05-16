@echo off

setlocal enabledelayedexpansion

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

set /p projectRoot=Copie o diretório do projeot andorid (Caminho Absoluto):
if "!projectRoot!"=="" (
    echo Nenhum diretório foi informado. Saindo...
    EXIT /B 1
)
:: Mudar para o diretório onde esta o projeto android
CALL :changeDicForRootProjectAndroid || EXIT /B 1
:: Executar o comando de clean e dependencies
if "%1"=="build" (
  ./gradlew clean
  CALL :verifyFail || EXIT /B 1
  ./gradlew dependencies
  CALL :verifyFail || EXIT /B 1
  GOTO :fim
)
:: Cria o app apk 
if "%1"=="apk" (

  set /p release=Deseja o apk release ? (S(Sim) ou N(Não)):
  set /p debug=Deseja o apk debug ? (S(Sim) ou N(Não)):

  if /i "!release!"=="S" (
   ./gradlew assembleRelease   
   CALL :verifyFail || EXIT /B 1
  )
 
  if /i "!debug!"=="S" (
   ./gradlew assembleDebug
   CALL :verifyFail || EXIT /B 1
  ) 
 
  GOTO :fim
)
:: Criar o app bundle
if "%1"=="bundle" (
  ./gradlew bundleRelease
  GOTO :fim
)
:: Executar a verificação se o app apk esta assinado
if "%1"=="singer" (
  set /p nomeApp=Digite o nome do App:
  set "apkPath=!projectRoot!\android\app\build\outputs\apk\release\!nomeApp!"

  if not exist "!apkPath!" (
      echo APK não encontrado: !apkPath!
      EXIT /B 1
  )
  jarsigner -verify -verbose -certs "%projectRoot%\android\app\build\outputs\apk\release\%nomeApp%"
  GOTO :fim
)

::OBS: adicionar comandos do adb (Android Debug Bridge)
:changeDicForRootProjectAndroid
cd /d "%projectRoot%"
GOTO :EOF

:verifyFail
  if !ERRORLEVEL! NEQ 0 (
    ECHO Erro: gradlew dependencies falhou com ERRORLEVEL !ERRORLEVEL!.
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

:fim

