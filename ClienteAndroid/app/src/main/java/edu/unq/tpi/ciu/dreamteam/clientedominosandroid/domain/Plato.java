package edu.unq.tpi.ciu.dreamteam.clientedominosandroid.domain;

import java.util.List;

public class Plato {

    private String pizzaNombre;
    private List<String> ingrediente;

    public List<String> getIngrediente() {
        return ingrediente;
    }

    public void setIngrediente(List<String> ingrediente) {
        this.ingrediente = ingrediente;
    }

    public String getPizzaNombre() {
        return pizzaNombre;
    }

    public void setPizzaNombre(String pizzaNombre) {
        this.pizzaNombre = pizzaNombre;
    }
}
