package com.CityPark.repository;

import com.CityPark.model.Tiquete;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TiqueteRpo extends JpaRepository<Tiquete, Integer> {
}
