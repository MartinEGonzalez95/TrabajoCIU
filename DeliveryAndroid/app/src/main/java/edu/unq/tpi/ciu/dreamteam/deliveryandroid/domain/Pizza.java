package edu.unq.tpi.ciu.dreamteam.deliveryandroid.domain;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Gunnark on 28/11/2017.
 */

public class Pizza {

    private String nombre;
    private List<Ingrediente> ingredientes = new ArrayList<>();
    private double precioBase = 0;


    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public List<Ingrediente> getIngredientes() {
        return ingredientes;
    }

    public void setIngredientes(List<Ingrediente> ingredientes) {
        this.ingredientes = ingredientes;
    }

    public double getPrecioBase() {
        return precioBase;
    }

    public void setPrecioBase(double precioBase) {
        this.precioBase = precioBase;
    }

    public double precioBase() {

        return precioBase;
    }
}
