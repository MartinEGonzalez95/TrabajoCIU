package edu.unq.tpi.ciu.dreamteam.clientedominosandroid.domain;

import java.util.List;

/**
 * Created by franc on 23/11/2017.
 */

public class Plato {

    private Pizza pizzaBase;
    private List<Ingrediente> ingredienteExtras;
    private Tamanio tamanioPizza;


    public List<Ingrediente> getIngredienteExtras() {
        return ingredienteExtras;
    }

    public void setIngredienteExtras(List<Ingrediente> ingredienteExtras) {
        this.ingredienteExtras = ingredienteExtras;
    }

    public Pizza getPizzaNombre() {
        return pizzaBase;
    }

    public void setPizzaNombre(Pizza pizza) {
        this.pizzaBase = pizza;
    }

    public Tamanio getTamanioPizza() {
        return tamanioPizza;
    }

    public void setTamanioPizza(Tamanio tamanioPizza) {
        this.tamanioPizza = tamanioPizza;
    }


    public double precio() {

        return precioEnBaseAlTamaño() + precioIngredientesExtras();
    }

    private double precioEnBaseAlTamaño() {


        return pizzaBase.precioBase() * tamanioPizza.getValor();
    }

    private double precioIngredientesExtras() {
        double precioDeLosIngredientes = 0;
        for (Ingrediente ingrediente : this.ingredienteExtras) {
            precioDeLosIngredientes += ingrediente.getPrecio();
        }
        return precioDeLosIngredientes;

    }


}
