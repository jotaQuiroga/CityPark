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
@Table(name = "tiquete")

public class Tiquete {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_Tiquete;

    @Column(name = "tipo_Tiquete")
    private String tipoTiquete;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "id_Atrac_Tiq", referencedColumnName = "id_atraccion")
    private Atraccion atraccion;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "id_Usu_Tiq", referencedColumnName = "id_usuario")
    private Usuario usuario;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "id_Emp_Tiq", referencedColumnName = "id_empleado")
    private Empleado empleado;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "id_Est_Tiq", referencedColumnName = "id_estacion")
    private Estacion estacion;
}
