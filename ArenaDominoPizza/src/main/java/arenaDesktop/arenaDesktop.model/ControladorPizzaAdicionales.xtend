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

	List<Ingrediente> ingredientesParaAgregar = newArrayList()

	List<String> distribuciones = #["Izquierda", "Todo", "Derecha"]

	Pizza pizzaSeleccionada = null

	new(Pizza pizzaSeleccionada) {
		this.ingredientes = repoIngredientes.cargar()
		this.pizzaSeleccionada = pizzaSeleccionada
		this.ingredientesParaAgregar.addAll(pizzaSeleccionada.ingredientes)
	}

	def getRepoIngredientes() {
		RepoIngrediente.getRepo
	}

	def agregarIngrediente() {
		
		//Se "clona" el ingrediente para que no se pise la distribucion del ingrediente cada vez que se edite.
		val ingredienteClonado = new Ingrediente => [
			it.precio = ingredienteSeleccionado.precio
			it.nombre = ingredienteSeleccionado.nombre
			it.distribucion = ingredienteSeleccionado.distribucion
		]
		
		if (!ingredientesParaAgregar.contains(ingredienteSeleccionado)) {
			ingredientesParaAgregar.add(ingredienteClonado)
		}
	}

	def quitarIngrediente() {
		ingredientesParaAgregar.remove(ingredienteSeleccionado)
	}

}
