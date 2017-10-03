package arenaDesktop.arenaDesktop.model

import org.eclipse.xtend.lib.annotations.Accessors

import java.util.List
import dominoPizzeria.Ingrediente
import dominoPizzeria.Pizza
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import repositorios.RepoIngrediente
import repositorios.RepoPizza

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
		
		if (!ingredientesParaAgregar.contains(ingredienteSeleccionado)) {
			ingredientesParaAgregar.add(ingredienteSeleccionado)
		}
	}

	def quitarIngrediente() {
		ingredientesParaAgregar.remove(ingredienteSeleccionado)
	}

	def boolean pizzaTerminada() {
	
		pizzaSeleccionada.validar
	
	}
	
	def agregarPizza() {
		RepoPizza.getRepo.agregar(pizzaSeleccionada)
	}
	
	def modificarPromo() {
		RepoPizza.getRepo.modificar(pizzaSeleccionada)
	}

}
