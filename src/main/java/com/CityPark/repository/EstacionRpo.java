package com.CityPark.repository;

import com.CityPark.model.Estacion;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EstacionRpo extends JpaRepository<Estacion, Integer> {
}
