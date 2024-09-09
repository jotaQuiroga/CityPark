package com.CityPark.controller;

import com.CityPark.exception.ResourceNotFoundException;
import com.CityPark.model.Empleado;
import com.CityPark.repository.EmpleadoRpo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/cityPark/empleado")
public class EmpleadoCtrlr {

    @Autowired
    private EmpleadoRpo empleadoRpo;

    @GetMapping
    public List<Empleado> getAllEmpleado() {
        return empleadoRpo.findAll();
    }


    @GetMapping("{id_Emple}")
    public ResponseEntity<Empleado> getEmpleadoById(@PathVariable int id_Emple) throws ResourceNotFoundException {
        Empleado empleado = empleadoRpo.findById(id_Emple)
                .orElseThrow(() -> new ResourceNotFoundException("Empleado no existe con id_Empleado:" + id_Emple));
        return ResponseEntity.ok(empleado);
    }

    @PostMapping
    public Empleado createEmpleado(@RequestBody Empleado empleado) throws ResourceNotFoundException {
        return empleadoRpo.save(empleado);
    }

    @PutMapping("{id_Emple}")
    public ResponseEntity<Empleado> upDateEmpleado(@PathVariable int id_Emple,@RequestBody Empleado empleadoDetails) throws ResourceNotFoundException {
        Empleado upDateEmpleado = empleadoRpo.findById(id_Emple)
                .orElseThrow(() -> new ResourceNotFoundException("Empleado no existe con id_Empleado: " + id_Emple));

        if (empleadoDetails.getNombre()!= null)
            upDateEmpleado.setNombre(empleadoDetails.getNombre());
        if (empleadoDetails.getApellido()!= null)
            upDateEmpleado.setApellido(empleadoDetails.getApellido());
        if (empleadoDetails.getCedula()!= null)
            upDateEmpleado.setCedula(empleadoDetails.getCedula());
        if (empleadoDetails.getDireccion()!= null)
            upDateEmpleado.setDireccion(empleadoDetails.getDireccion());
        if (empleadoDetails.getTelefono()!= null)
            upDateEmpleado.setTelefono(empleadoDetails.getTelefono());
        if (empleadoDetails.getCorreo_electronico()!= null)
            upDateEmpleado.setCorreo_electronico(empleadoDetails.getCorreo_electronico());
        if (empleadoDetails.getCargo().getId_cargo() > 0)
            upDateEmpleado.setCargo(empleadoDetails.getCargo());

        empleadoRpo.save(upDateEmpleado);

        return ResponseEntity.ok(upDateEmpleado);
    }

    @DeleteMapping("{id_Emple}")
    public ResponseEntity<HttpStatus> deleteEmpleado(@PathVariable int id_Emple) throws ResourceNotFoundException {
        Empleado empleado = empleadoRpo.findById(id_Emple)
                .orElseThrow(() -> new ResourceNotFoundException("Employee not exist with id_Emple: " + id_Emple));

        empleadoRpo.delete(empleado);

        return new ResponseEntity<>(HttpStatus.NO_CONTENT);

    }
}
