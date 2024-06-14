package com.CityPark.controller;

import com.CityPark.exception.ResourceNotFoundException;
import com.CityPark.model.Usuario;
import com.CityPark.repository.UsuarioRpo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/cityPark/usuario")
public class UsuarioCtrlr {

    @Autowired
    private UsuarioRpo usuarioRpo;


    @GetMapping
    public List<Usuario> getAllUsuario() {
        return usuarioRpo.findAll();
    }


    @GetMapping("{id_Usu}")
    public ResponseEntity<Usuario> getUsuarioById(@PathVariable int id_Usuario) throws ResourceNotFoundException {
        Usuario usuario = usuarioRpo.findById(id_Usuario)
                .orElseThrow(() -> new ResourceNotFoundException("Usuario no existe con id_Usuario:" + id_Usuario));
        return ResponseEntity.ok(usuario);
    }

    @PostMapping
    public Usuario createUsuario(@RequestBody Usuario usuario) {
        return usuarioRpo.save(usuario);
    }

    @PutMapping("{id_Usu}")
    public ResponseEntity<Usuario> updateUsuario(@PathVariable int id_Usuario,@RequestBody Usuario usuarioDetails) throws ResourceNotFoundException {
        Usuario updateUsuario = usuarioRpo.findById(id_Usuario)
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

    }
}
