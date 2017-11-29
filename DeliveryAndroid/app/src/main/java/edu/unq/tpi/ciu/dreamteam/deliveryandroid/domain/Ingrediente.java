package edu.unq.tpi.ciu.dreamteam.deliveryandroid.domain;

/**
 * Created by Gunnark on 28/11/2017.
 */

public class Ingrediente {

    private String nombre;
    private String distribucion;
    private int precio;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDistribucion() {
        return distribucion;
    }

    public void setDistribucion(String distribucion) {
        this.distribucion = distribucion;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }
}

