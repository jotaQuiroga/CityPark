package com.CityPark.controller;

import com.CityPark.exception.ResourceNotFoundException;
import com.CityPark.model.Cargo;
import com.CityPark.repository.CargoRpo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/cityPark/cargo")
public class CargoCtrlr {
    @Autowired
    private CargoRpo cargoRpo;

    @GetMapping
    public List<Cargo> getAllCargo() {
        return cargoRpo.findAll();
    }

    @GetMapping("{id_cargo}")
    public ResponseEntity <Cargo> getCargoById(@PathVariable int id_cargo) throws ResourceNotFoundException {
        Cargo cargo = cargoRpo.findById(id_cargo)
                .orElseThrow(() -> new ResourceNotFoundException("Cargo no existe con id_Cargo:" + id_cargo));
        return ResponseEntity.ok(cargo);
    }

}
