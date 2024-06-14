package com.CityPark.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import jakarta.persistence.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "acudiente")

public class Acudiente {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_Acudiente;

    @ManyToOne
    @JoinColumn(name = "id_Usu_Acu", referencedColumnName = "id_Usuario")
    private Usuario usuario;

    @Column(name = "cedula_Acu")
    private String cedula_Acu;

    @Column(name = "nombre_Acu")
    private String nombre_Acu;

    @Column(name = "apellido_Acu")
    private String apellido_Acu;

    @Column(name = "telefono")
    private String telefono;

    @Column(name = "direccion")
    private String direccion;

    @Column(name = "correo_elec_Acu")
    private String correo_elec_Acu;
}
