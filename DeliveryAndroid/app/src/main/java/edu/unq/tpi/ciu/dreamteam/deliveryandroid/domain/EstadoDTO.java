package edu.unq.tpi.ciu.dreamteam.deliveryandroid.domain;

/**
 * Created by Gunnark on 22/11/2017.
 */

public class EstadoDTO {

    private String nombre;

    public EstadoDTO() {

    }

    public EstadoDTO(String estadoDePedido) {
        nombre = estadoDePedido;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
