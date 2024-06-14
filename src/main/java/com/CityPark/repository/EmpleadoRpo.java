package com.CityPark.repository;

import com.CityPark.model.Empleado;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

public interface EmpleadoRpo extends JpaRepository<Empleado, Integer> {
/*
    default List<Empleado> getAllEmpleado(){
        return List<Empleado>;
    }

    public createEmpleado(@RequestBody Empleado empleado){
        //return EmpleadoRpo.save(empleado);
    }

    public ResponseEntity<Empleado> getEmpleadoById_Empleado(@PathVariable int id_Empleado) {
        //return ResponseEntity.ok(Empleado);
    }

    public ResponseEntity<Empleado> updateEmpleado(@PathVariable int id_Empleado, @RequestBody Empleado empleadoDetails){
        //return ResponseEntity.ok(empleadoDetails);
    }

    public ResponseEntity<Empleado> deleteEmpleado(@PathVariable int id_Empleado){
        //return ResponseEntity<>(Empleado);
    }
*/


}