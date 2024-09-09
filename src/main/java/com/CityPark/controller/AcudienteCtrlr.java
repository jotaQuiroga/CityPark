package com.CityPark.controller;

import com.CityPark.exception.ResourceNotFoundException;
import com.CityPark.model.Acudiente;
import com.CityPark.repository.AcudienteRpo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/cityPark/acudiente")
public class AcudienteCtrlr {

    @Autowired
    private AcudienteRpo acudienteRpo;


    @GetMapping
    public List<Acudiente> getAllAcudiente() {
        return acudienteRpo.findAll();
    }


    @GetMapping("{id_Acudiente}")
    public ResponseEntity<Acudiente> getAcudienteById(@PathVariable int id_Acudiente) throws ResourceNotFoundException {
        Acudiente acudiente = acudienteRpo.findById(id_Acudiente)
                .orElseThrow(() -> new ResourceNotFoundException("Acudiente not exist with id_Acudiente:" + id_Acudiente));
        return ResponseEntity.ok(acudiente);
    }

   @PostMapping
    public Acudiente createAcudiente(@RequestBody Acudiente acudiente) {
        return acudienteRpo.save(acudiente);
    }

    @PutMapping("{id_acu}")
    public ResponseEntity<Acudiente> updateAcudiente(@PathVariable int id_acu,@RequestBody Acudiente acudienteDetails) throws ResourceNotFoundException {
        Acudiente updateAcudiente = acudienteRpo.findById(id_acu)
                .orElseThrow(() -> new ResourceNotFoundException("Usuario not exist with id_Usuario: " + id_acu));

        if (acudienteDetails.getUsuario()!= null)
            updateAcudiente.setUsuario(acudienteDetails.getUsuario());
        if (acudienteDetails.getCedula_Acu() != null)
            updateAcudiente.setCedula_Acu(acudienteDetails.getCedula_Acu());
        if (acudienteDetails.getNombre_Acu() != null)
            updateAcudiente.setNombre_Acu(acudienteDetails.getNombre_Acu());
        if (acudienteDetails.getApellido_Acu() != null)
            updateAcudiente.setApellido_Acu(acudienteDetails.getApellido_Acu());
        if (acudienteDetails.getTelefono() != null)
            updateAcudiente.setTelefono(acudienteDetails.getTelefono());
        if (acudienteDetails.getDireccion() != null)
            updateAcudiente.setDireccion(acudienteDetails.getDireccion());
        if (acudienteDetails.getCorreo_elec_Acu() != null)
            updateAcudiente.setCorreo_elec_Acu(acudienteDetails.getCorreo_elec_Acu());

        acudienteRpo.save(updateAcudiente);

        return ResponseEntity.ok(updateAcudiente);
    }

    @DeleteMapping("{id_Acu}")
    public ResponseEntity<HttpStatus> deleteAcudiente(@PathVariable int id_Acu) throws ResourceNotFoundException {
        Acudiente deleteAcudiente = acudienteRpo.findById(id_Acu)
                .orElseThrow(() -> new ResourceNotFoundException("Usuario not exist with id_Usuario: " + id_Acu));

        acudienteRpo.delete(deleteAcudiente);

        return new ResponseEntity<>(HttpStatus.NO_CONTENT);

    }
}
