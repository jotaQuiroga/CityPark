package com.CityPark.repository;

import com.CityPark.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UsuarioRpo extends JpaRepository<Usuario, Integer>   {

}
