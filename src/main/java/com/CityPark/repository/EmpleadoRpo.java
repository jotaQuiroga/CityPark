package com.CityPark.repository;

import com.CityPark.model.Empleado;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EmpleadoRpo extends JpaRepository<Empleado, Integer> {
}