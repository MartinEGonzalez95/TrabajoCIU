package arenaDesktop.arenaDesktop.model

import dominoPizzeria.Ingrediente
import dominoPizzeria.Pizza

import repositorios.RepoIngrediente
import repositorios.RepoPizza

import java.util.List

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class ControladorMenu {

	List<Pizza> pizzas = newArrayList()
	List<Ingrediente> ingredientes = newArrayList()
	Ingrediente ingredienteSeleccionado = null
	Pizza pizzaSeleccionada = null

	new()
	{
		cargar
	}

	def void cargar()
	{

		cargarIngredientes()
		cargarPizzas()

		if (!pizzas.empty) {pizzaSeleccionada = pizzas.get(pizzas.length-1)}
		
		if (!ingredientes.empty) {ingredienteSeleccionado = ingredientes.get(ingredientes.length-1)}


	}

	def List<Pizza> cargarPizzas() {
		pizzas = null
		pizzas = RepoPizza.getRepo.cargar
	}

	def List<Ingrediente> cargarIngredientes() {
		ingredientes = null
		ingredientes = RepoIngrediente.getRepo.cargar
	}

	def eliminarIngrediente() {
		RepoIngrediente.getRepo.eliminar(ingredienteSeleccionado)
		cargarIngredientes
		ingredienteSeleccionado = null

	}

	def void eliminarPizza() {
		RepoPizza.getRepo.eliminar(pizzaSeleccionada)
		cargarPizzas
		pizzaSeleccionada = null
	}

}
