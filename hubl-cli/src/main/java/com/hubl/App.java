package com.hubl;

import java.util.concurrent.Callable;

import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Option;

import com.hubl.hubl.PhpStorm;
import com.hubl.hubl.WebStorm;
import com.hubl.hubl.PyCharm;
import com.hubl.hubl.DBeaver;
import com.hubl.hubl.Exp;

import com.hubl.hubl.android.Android;
import com.hubl.hubl.vm.VM;
import com.hubl.hubl.git.Git;


@Command(
		name="hubl",
		mixinStandardHelpOptions = true,
		version = "hubl 1.0",
		description = "CLI para abrir softwares e gerenciar VMs",
		subcommands = {
				PhpStorm.class,
				WebStorm.class,
				PyCharm.class,
				Android.class,
				DBeaver.class,
				VM.class,
				Exp.class
})
public class App implements Callable<Integer>
{
    public static void main( String[] args )
    {
    		int exitCode = new CommandLine(new App()).execute(args);
    		System.exit(exitCode);
    }

	@Override
	public Integer call() throws Exception {
		 System.out.println("Use um dos subcomandos. Ex: `hubl phpstorm` ou `hubl vm start`.");
	     return 0;
	}	
    
	
}
