package com.dk.latmarine;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({ "com.dk.latmarine.*" })
public class LatitudeMarineApplication {

	public static void main(String[] args) {
		SpringApplication.run(LatitudeMarineApplication.class, args);
	}

}
