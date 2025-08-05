<?php 

$dirPhp = "C:\\php";

$itens = scandir($dirPhp);

$pastasPhp = array_filter($itens, function ($item) use ($dirPhp) {
  return $item !== '.' && $item != '..' && is_dir($dirPhp.DIRECTORY_SEPARATOR.$item);
}); 

if( empty($pastasPhp)){
  echo "Nenhuma versão encontrada em {$basePath}\n";
  exit(1);
}

$pastas = array_values($pastasPhp);

echo "Versões disponíveis\n";
foreach ($pastas as $index => $pasta){
  echo "[$index] $pasta\n";
}

echo "Escolha o número da versão desejada: ";
$opcao = trim(fgets(STDIN));

if(!isset($pasta[$opcao])){
  echo "Opção inválida!\n";
  exit(1);
}

print_r($pasta[$opcao]);

$versaoEscolhida = $pastas[$opcao];
$newPath = $dirPhp."\\".$versaoEscolhida;

exec("setx PATH \"$newPath;%PATH%\"");

echo "PATH atualizado para $newPath. Reinicie o terminal para aplicar.";