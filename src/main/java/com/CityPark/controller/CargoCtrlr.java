package com.CityPark.controller;

import com.CityPark.exception.ResourceNotFoundException;
import com.CityPark.model.Cargo;
import com.CityPark.repository.CargoRpo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
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

    @PostMapping
    public Cargo createCargo(@RequestBody Cargo cargo) {
        return cargoRpo.save(cargo);
    }

    @PutMapping("{id_carg}")
    public ResponseEntity<Cargo> updateAcudiente(@PathVariable int id_carg,@RequestBody Cargo cargoDetails) throws ResourceNotFoundException {
        Cargo updateCargo = cargoRpo.findById(id_carg)
                .orElseThrow(() -> new ResourceNotFoundException("Usuario not exist with id_Usuario: " + id_carg));

        if (cargoDetails.getNombre_Cargo() != null)
            updateCargo.setNombre_Cargo(cargoDetails.getNombre_Cargo());
        if (cargoDetails.getSalario() > 0)
            updateCargo.setSalario(cargoDetails.getSalario());
        

        cargoRpo.save(updateCargo);

        return ResponseEntity.ok(updateCargo);
    }

    @DeleteMapping("{id_Carg}")
    public ResponseEntity<HttpStatus> deleteCargo(@PathVariable int id_Carg) throws ResourceNotFoundException {
        Cargo deleteCargo = cargoRpo.findById(id_Carg)
                .orElseThrow(() -> new ResourceNotFoundException("Usuario not exist with id_Usuario: " + id_Carg));

        cargoRpo.delete(deleteCargo);

        return new ResponseEntity<>(HttpStatus.NO_CONTENT);

    }
}
