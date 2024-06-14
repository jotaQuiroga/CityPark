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
@Table(name = "CARGO")

public class Cargo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_cargo;

    @Column(name = "nombre_Cargo"/*, updatable=false*/)
    private String nombre_Cargo;

    @Column(name = "salario"/*, updatable=false*/)
    private int salario;

}
