package com.example.Skill_bridge;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SkillBridgeApplication implements CommandLineRunner {

	public static void main(String[] args) {
		SpringApplication.run(SkillBridgeApplication.class, args);
	}
	

    public void run(String... args) throws Exception {
        System.out.println("The project is running on port 8080");
    }

}
