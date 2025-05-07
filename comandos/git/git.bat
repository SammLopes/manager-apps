@echo off
echo Arquivo de facildiade do git

:: Integraçaõ com os comandos de configurações :
:: git config --list 
:: git config --global user.name <nome>
:: git config --global user.email <email>
:: Adicionar reporitórios 
:: git remote add origin <url>
if "%1"=="rep-add" (

):: Lista reporitóriosstórios 
:: git remote -v
if "%1"=="rep-list" (
  git remote -v  
  GOTO :fim
)

:fim
