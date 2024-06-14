package com.CityPark;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class CityParkApplication {

	public static void main(String[] args) {
		SpringApplication.run(CityParkApplication.class, args);
	}

}
