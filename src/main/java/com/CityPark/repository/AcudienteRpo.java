package com.CityPark.repository;

import com.CityPark.model.Acudiente;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AcudienteRpo extends JpaRepository<Acudiente, Integer> {
}
