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
		this.ingredientes = this.getRepoIngredientes.cargar
		this.pizzas = this.getRepoPizzas.cargar
	}

	new(){
		
	}
	def getRepoPizzas() {
		new RepoPizza
	}

	def getRepoIngredientes() {
		new RepoIngrediente
	}

}
