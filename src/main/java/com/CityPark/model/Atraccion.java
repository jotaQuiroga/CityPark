package com.CityPark.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import jakarta.persistence.*;

import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "atraccion")

public class Atraccion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_Atraccion;

    @Column(name = "nombre_Atrac")
    private String nombre_Atrac;

    @Column(name = "descripcion")
    private String descripcion;

    @Column(name = "clasificacion")
    private String clasificacion;

    @ManyToMany(fetch = FetchType.LAZY,
            cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH })
    @JoinTable(name = "atraccion_condicionuso_map", joinColumns = @JoinColumn(name = "id_atrac"),
            inverseJoinColumns = @JoinColumn(name = "id_cond_uso"))
    private Set<CondicionUso> condicionUsoSet;

    @Column(name = "estado")
    private Boolean estado;

    @Column(name = "mantenimiento")
    private Boolean mantenimiento;
}
