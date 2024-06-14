package com.CityPark.controller;

import com.CityPark.exception.ResourceNotFoundException;
import com.CityPark.model.Atraccion;
import com.CityPark.repository.AtraccionRpo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/citypark/Atraccion")
public class AtraccionCtrlr {

    @Autowired
    private AtraccionRpo atraccionRpo;

    @GetMapping
    public List<Atraccion> getAllAtraccions() { return atraccionRpo.findAll();}

    @GetMapping("{id_atrac}")
    public ResponseEntity<Atraccion> getAtraccionById(@PathVariable int id_atrac) throws ResourceNotFoundException {
        Atraccion atraccion = atraccionRpo.findById(id_atrac)
                .orElseThrow(()-> new ResourceNotFoundException("Atracción no exixte con id_Atraccion: " + id_atrac));
        return ResponseEntity.ok(atraccion);
    }

    @PostMapping
    public Atraccion createAtraccion(@RequestBody Atraccion atraccion) throws ResourceNotFoundException {
        return atraccionRpo.save(atraccion);

    }

    @PutMapping("¨{id_atrac}")
    public ResponseEntity<Atraccion> upDateAtraccion (@PathVariable int id_atrac, @RequestBody Atraccion atraccionDetails) throws ResourceNotFoundException {
        Atraccion upDateAtraccion = atraccionRpo.findById(id_atrac)
                .orElseThrow(()-> new ResourceNotFoundException("Atracción no exixte con id_Atraccion" + id_atrac));

        if (atraccionDetails.getNombre_Atrac()!= null)
            upDateAtraccion.setNombre_Atrac(atraccionDetails.getNombre_Atrac());
        if (atraccionDetails.getDescripcion()!= null)
            upDateAtraccion.setDescripcion(atraccionDetails.getDescripcion());
        if (atraccionDetails.getClasificacion()!= null)
            upDateAtraccion.setClasificacion(atraccionDetails.getClasificacion());

        //aquí va algo de cascada? según entidad atracción

        if (atraccionDetails.getEstado()!= null)
            upDateAtraccion.setEstado(atraccionDetails.getEstado());
        if (atraccionDetails.getMantenimiento()!= null)
            upDateAtraccion.setMantenimiento(atraccionDetails.getMantenimiento());


        atraccionRpo.save(upDateAtraccion);

        return ResponseEntity.ok(upDateAtraccion);
    }
}





