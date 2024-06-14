package com.CityPark.controller;

import com.CityPark.exception.ResourceNotFoundException;
import com.CityPark.model.Acudiente;
import com.CityPark.model.Usuario;
import com.CityPark.repository.AcudienteRpo;
import com.CityPark.repository.UsuarioRpo;
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


    @GetMapping("{id_Acu}")
    public ResponseEntity<Acudiente> getAcudienteById(@PathVariable int id_Acudiente) throws ResourceNotFoundException {
        Acudiente acudiente = acudienteRpo.findById(id_Acudiente)
                .orElseThrow(() -> new ResourceNotFoundException("Acudiente not exist with id_Acudiente:" + id_Acudiente));
        return ResponseEntity.ok(acudiente);
    }

   @PostMapping
    public Acudiente createAcudiente(@RequestBody Acudiente acudiente) {
        return acudienteRpo.save(acudiente);
    }
/*
    @PutMapping("{id_acu}")
    public ResponseEntity<Usuario> updateAcudiente(@PathVariable int id_acu,@RequestBody Usuario usuarioDetails) throws ResourceNotFoundException {
        Usuario updateUsuario = acudienteRpo.findById(id_Usuario)
                .orElseThrow(() -> new ResourceNotFoundException("Usuario not exist with id_Usuario: " + id_Usuario));

        updateUsuario.setNombre(usuarioDetails.getNombre());
        updateUsuario.setApellido(usuarioDetails.getApellido());
        updateUsuario.setCedula(usuarioDetails.getCedula());
        updateUsuario.setEdad(usuarioDetails.getEdad());
        updateUsuario.setEstatura(usuarioDetails.getEstatura());
        updateUsuario.setDireccion(usuarioDetails.getDireccion());
        updateUsuario.setTelefono(usuarioDetails.getTelefono());
        updateUsuario.setCorreo_electronico(usuarioDetails.getCorreo_electronico());
        updateUsuario.setNumero_visitas(usuarioDetails.getNumero_visitas());

        usuarioRpo.save(updateUsuario);

        return ResponseEntity.ok(updateUsuario);
    }

    @DeleteMapping("{id_Usu}")
    public ResponseEntity<HttpStatus> deleteUsuario(@PathVariable int id_Usuario) throws ResourceNotFoundException {
        Usuario usuario = usuarioRpo.findById(id_Usuario)
                .orElseThrow(() -> new ResourceNotFoundException("Usuario not exist with id_Usuario: " + id_Usuario));

        usuarioRpo.delete(usuario);

        return new ResponseEntity<>(HttpStatus.NO_CONTENT);

    }*/
}
