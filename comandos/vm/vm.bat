@echo off
echo arquivo de manipulação de VM do Virtual Box
echo nesse arquivo começamos a analisar o segundo parametro informado, sem contar o primeiro nome.

//Se o parametro for init - Iniciar VM 

//Se o parametro for stop - Encerrar VM

//Se o parametro for enter - Acessar VM Via ssh


:changeDicVm
cd /d "C:\Homestead\"
GOTO :EOF
