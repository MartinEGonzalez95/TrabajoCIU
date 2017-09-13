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

	def modificarPrecioDePizza(Pizza pizza, int precioModificado) {

		this.buscarPizza(pizza).precio = precioModificado

	}

	def Pizza buscarPizza(Pizza pizzaABuscar) {

		pizzas.filter[it.nombre == pizzaABuscar.nombre].head

	}

	def modificarPrecioDeAdicional(Ingrediente adicional, int precioModificado) {

		this.buscarAdicional(adicional).precio = precioModificado
	}

	def Ingrediente buscarAdicional(Ingrediente adicionalABuscar) {

		ingredientesAdicionales.filter[it.nombre == adicionalABuscar.nombre].head
	}

}
