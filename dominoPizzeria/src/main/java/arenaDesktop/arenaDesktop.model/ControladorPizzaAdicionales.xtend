package arenaDesktop.arenaDesktop.model

import org.eclipse.xtend.lib.annotations.Accessors

import java.util.List
import dominoPizzeria.Ingrediente
import dominoPizzeria.Pizza
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@Accessors
@TransactionalAndObservable
class ControladorPizzaAdicionales {

	List<Ingrediente> ingredientes
	Ingrediente ingredienteSeleccionado = null

	List<String> distribuciones = #["Izquierda", "Todo", "Derecha"]

	Pizza pizzaSeleccionada = null

	new(Pizza pizzaSeleccionada, List<Ingrediente> adicionales) {
		this.ingredientes = adicionales
		this.pizzaSeleccionada = pizzaSeleccionada

	}

	new() {
	}

	def agregarIngrediente(Ingrediente ingrediente) {

		pizzaSeleccionada.agregarIngrediente(ingrediente)

	}
	
	def quitarIngrediente(dominoPizzeria.Ingrediente ingrediente) {
			pizzaSeleccionada.eliminarIngrediente(ingrediente)
	}

}
