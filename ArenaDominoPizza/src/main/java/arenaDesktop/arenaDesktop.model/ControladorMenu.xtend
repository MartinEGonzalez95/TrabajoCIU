package arenaDesktop.arenaDesktop.model

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import java.util.List

import dominoPizzeria.Pizza
import dominoPizzeria.Ingrediente
import repositorios.RepoIngrediente
import repositorios.RepoPizza

@Accessors
@Observable
class ControladorMenu {

	List<Pizza> pizzas = newArrayList()
	List<Ingrediente> ingredientes = newArrayList()
	Ingrediente ingredienteSeleccionado
	Pizza pizzaSeleccionada

	new(List<Pizza> pizzas, List<Ingrediente> adicionales) {
		this.ingredientes = adicionales
		this.pizzas = pizzas
	}

	new() {
		this.cargar
	}

	def getRepoPizzas() {
		return RepoPizza.getRepo
	}

	def getRepoIngredientes() {
		return RepoIngrediente.getRepo
	}

	def cargar() {

		ingredientes = getRepoIngredientes.cargar
		pizzas = getRepoPizzas.cargar
		
		ingredienteSeleccionado = ingredientes.get(0)
		pizzaSeleccionada = pizzas.get(0)
		
		
	}

}
