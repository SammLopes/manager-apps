package com.hubl.hubl;

import java.util.concurrent.Callable;

import com.hubl.util.Launcher;

import picocli.CommandLine.Command;

@Command(name="phpstorm", description="Abrir PhpStorm")
public class PhpStorm implements Callable<Integer>{

	@Override
	public Integer call() throws Exception {
		Launcher.launch("C:\\Program Files\\JetBrains\\PhpStorm 2024.3.4\\bin\\phpstorm64.exe");
		return 0;
	}
	
}	
