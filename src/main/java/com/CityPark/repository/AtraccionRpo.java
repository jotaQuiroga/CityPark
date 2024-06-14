package com.CityPark.repository;

import com.CityPark.model.Atraccion;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AtraccionRpo extends JpaRepository<Atraccion, Integer> {
}
