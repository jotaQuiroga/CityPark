package com.CityPark.repository;

import com.CityPark.model.Cargo;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CargoRpo extends JpaRepository<Cargo, Integer> {
}
