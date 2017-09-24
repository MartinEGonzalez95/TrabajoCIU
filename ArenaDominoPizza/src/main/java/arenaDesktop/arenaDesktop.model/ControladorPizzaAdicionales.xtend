package arenaDesktop.arenaDesktop.model

import org.eclipse.xtend.lib.annotations.Accessors

import java.util.List
import dominoPizzeria.Ingrediente
import dominoPizzeria.Pizza
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import repositorios.RepoIngrediente

@Accessors
@TransactionalAndObservable
class ControladorPizzaAdicionales {

	List<Ingrediente> ingredientes = newArrayList()
	Ingrediente ingredienteSeleccionado = null

	List<String> distribuciones = #["Izquierda", "Todo", "Derecha"]

	Pizza pizzaSeleccionada = null

	new(Pizza pizzaSeleccionada) {
		this.ingredientes = getRepoIngredientes.cargar()
		this.pizzaSeleccionada = pizzaSeleccionada

	}

	def getRepoIngredientes() {
		RepoIngrediente.getRepo
	}

	new() {

		pizzaSeleccionada = new Pizza
	}

	def agregarIngrediente(Ingrediente ingrediente) {
		pizzaSeleccionada.agregarIngrediente(ingrediente)
	}

	def quitarIngrediente(dominoPizzeria.Ingrediente ingrediente) {
		pizzaSeleccionada.eliminarIngrediente(ingrediente)
	}

}
