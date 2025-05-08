@echo off
echo Arquivo de facildiade do git

:: Integraçaõ com os comandos de configurações :
:: git config --global --list 
if "%1"=="config-g-list" (
  echo Configuracoes globais do git 
  git config --global --list
  GOTO :fim
)
:: git config --list
if "%1"=="config-sys-list" (
  echo Configuracoes locais + sistema
  git config --list
  GOTO :fim
)
:: git config --local --list
if "%1"=="config-local-list" (
  echo Configuracoes locais do repositório
  git config --local --list
  GOTO :fim
)
:: git config --global user.name <nome>
:: git config --global user.email <email>
if "%1"=="config-g" (
  echo Adicionado configuracoes globais do git
  set /p nome=Digite seu nome:
  set /p email=Digite seu email:

  git config --global user.name %nome%
  git config --global user.email %email%
  GOTO :fim
) 
:: Adicionar reporitórios 
:: git remote add <alias> <url>
if "%1"=="rep-add" (
 
  set /p alias=Alias do repositório:
  set /p url=URL do repositório:

  if "%alias%"=="" (
    set alias="origin"
  )

   if "%url%"=="" (
    echo Informe a url do repositório
    GOTO  :fim
  )
  
  echo Alias: %alias%
  echo URL: %url%

  git remote add %alias% %urlRepo%
  GOTO :fim
)
:: git remote remove <nome-repo>
if "%1"=="rep-remove" (
  set /p alias=Alias do repositório:
  git remote remove %alias%
  GOTO :fim
)
:: Lista reporitóriosstórios 
:: git remote -v
if "%1"=="rep-list" (
  git remote -v  
  GOTO :fim
)

:help
echo ========================================
echo       MENU DE PROGRAMAS DO SAMUEL [GIT]
echo ========================================
echo [config-g-list] Listagem de configurações Globais(usuario)
echo [config-sys-list] Lista as configurações locais e do sistema
echo [config-local-list] Lista as configurações local do repositório
echo [config-g] Seta as configurações globalmente 
echo [rep-add] Adiciona repositório local 
echo [rep-list] Lista reporitórios
echo ========================================
GOTO :EOF

:fim
