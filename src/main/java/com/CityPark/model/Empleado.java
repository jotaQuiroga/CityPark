package com.CityPark.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import jakarta.persistence.*;
import org.springframework.data.annotation.ReadOnlyProperty;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "EMPLEADO")


public class Empleado {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_Empleado;

    @Column(name = "cedula")
    private String cedula;

    @Column(name = "nombre")
    private String nombre;

    @Column(name = "apellido")
    private String apellido;

    @Column(name = "telefono")
    private String telefono;

    @Column(name = "direccion")
    private String direccion;

    @Column(name = "correo_electronico")
    private String correo_electronico;

    @ManyToOne(fetch= FetchType.LAZY, cascade={CascadeType.DETACH,CascadeType.REFRESH}/*cascade = CascadeType.ALL*/)
    @JoinColumn(name = "id_emple_cargo", referencedColumnName = "id_cargo")
    private Cargo cargo;

}
