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
@Table(name = "CONDICIONUSO")

public class CondicionUso {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_condicionUso;

    @Column(name = "descripcion")
    private String descripcion;

    @ManyToMany(fetch = FetchType.LAZY,
            cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.DETACH, CascadeType.REFRESH })
    @JoinTable(name = "atraccion_condicionuso_map", joinColumns = @JoinColumn(name = "id_cond_uso"),
            inverseJoinColumns = @JoinColumn(name = "id_atrac"))
    private Set<Atraccion> atraccionSet;

}
