package arenaDesktop.arenaDesktop.model

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import java.util.List

import repositorios.RepoIngrediente
import repositorios.RepoPizza
import dominoPizzeria.Pizza
import dominoPizzeria.Ingrediente

@Accessors
@Observable
class ControladorMenu {

	List<Pizza> pizzas = newArrayList()
	List<Ingrediente> ingredientes = newArrayList()
	Ingrediente ingredienteSeleccionado
	Pizza pizzaSeleccionada

	new(List<Pizza> pizzas, List<Ingrediente> adicionales) {
		this.ingredientes = this.getRepoIngredientes.cargar
		this.pizzas = this.getRepoPizzas.cargar
	}

	new() {

		this.cargar

	}

	def getRepoPizzas() {
		new RepoPizza
	}

	def getRepoIngredientes() {
		new RepoIngrediente
	}

	def cargar() { // mensaje de prueba
		val repoIngrediente = repoIngredientes

		repoIngrediente.agregar(new Ingrediente => 
			[nombre = "muzza" distribucion = "todo" precio = 15]
		)

		ingredientes = repoIngrediente.cargar
	}

	def updateIngredientes() {
		
	}

}
