package arenaDesktop.arenaDesktop.model

import dominoPizzeria.Ingrediente
import dominoPizzeria.Pizza
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import repositorios.RepoIngrediente
import repositorios.RepoPizza
import org.uqbar.commons.model.annotations.Dependencies

@Accessors
@Observable
class ControladorMenu {

	List<Pizza> pizzas = newArrayList()
	List<Ingrediente> ingredientes = newArrayList()
	Ingrediente ingredienteSeleccionado = null
	Pizza pizzaSeleccionada = null

	new() {
		this.cargar
	}

	def getRepoPizzas() {
		return RepoPizza.getRepo
	}

	def getRepoIngredientes() {
		return RepoIngrediente.getRepo
	}

	def void cargar() {

		cargarIngredientes()
		cargarPizzas()

		if (!pizzas.empty || !ingredientes.empty) {

			pizzaSeleccionada = pizzas.get(0)
			ingredienteSeleccionado = ingredientes.get(0)

		}

	}

	def List<Pizza> cargarPizzas() {
		pizzas = null
		pizzas = getRepoPizzas.cargar
	}

	def List<Ingrediente> cargarIngredientes() {
		ingredientes = null
		ingredientes = getRepoIngredientes.cargar
	}

	def eliminarIngrediente() {
		this.repoIngredientes.eliminar(ingredienteSeleccionado)
		this.cargarIngredientes
		this.ingredienteSeleccionado = null

	}

	def void eliminarPizza() {
		this.repoPizzas.eliminar(pizzaSeleccionada)
		this.cargarPizzas
		this.pizzaSeleccionada = null
	}

}
