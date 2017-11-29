package edu.unq.tpi.ciu.dreamteam.deliveryandroid.domain;

import java.util.List;

/**
 * Created by franc on 23/11/2017.
 */

public class Plato {

    private Pizza pizzaBase;
    private List<Ingrediente> ingredientesExtras;
    private Tamanio tamanioPizza;


    public List<Ingrediente> getIngredientesExtras() {
        return ingredientesExtras;
    }

    public void setIngredientesExtras(List<Ingrediente> ingredientesExtras) {
        this.ingredientesExtras = ingredientesExtras;
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
        for (Ingrediente ingrediente : this.ingredientesExtras) {
            precioDeLosIngredientes += ingrediente.getPrecio();
        }
        return precioDeLosIngredientes;

    }


}
