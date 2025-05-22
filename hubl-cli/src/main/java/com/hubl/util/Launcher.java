package com.hubl.util;

public class Launcher {
	
	public static void launch (String path) {
		tryLaunch(path);
	}

	private static void tryLaunch( String path ) {
		try {
			new ProcessBuilder(path).start();
		} catch (Exception e) {
			System.err.printf("Erro ao iniciar \"%s\": %s%n", path, e.getMessage());
		}
	}
}
