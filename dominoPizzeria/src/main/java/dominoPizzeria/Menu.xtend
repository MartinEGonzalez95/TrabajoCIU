package dominoPizzeria

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Menu {

	List<Pizza> pizzas

	List<Ingrediente> ingredientesAdicionales

	new(ArrayList<Pizza> pizzas, ArrayList<Ingrediente> adicionales) {

		this.pizzas = pizzas
		this.ingredientesAdicionales = adicionales

	}

	def agregarAdicional(Ingrediente ingrediente) {
		ingredientesAdicionales.add(ingrediente)
	}

	def agregarPizza(Pizza pizza) {
		pizzas.add(pizza)
	}

	def eliminarPizza(Pizza pizza) {
		pizzas.remove(pizza)
	}

	def eliminarAdicional(Ingrediente ingrediente) {
		ingredientesAdicionales.remove(ingrediente)
	}

}
