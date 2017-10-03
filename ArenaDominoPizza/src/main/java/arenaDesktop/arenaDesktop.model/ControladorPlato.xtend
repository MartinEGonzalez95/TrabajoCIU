package arenaDesktop.arenaDesktop.model

import dominoPizzeria.Ingrediente
import dominoPizzeria.Pedido
import dominoPizzeria.Pizza
import dominoPizzeria.Plato
import dominoPizzeria.Tamanio

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.utils.ObservableUtils
import repositorios.RepoPedido

@Accessors
@TransactionalAndObservable
class ControladorPlato extends ControladorMenu {

	Plato platoSeleccionado = null
	Pizza pizza = null
	Tamanio tamanio = null
	Pedido pedido = null
	List<String> distribuciones = #["Izquierda", "Todo", "Derecha"]
	List<Ingrediente> ingredientesParaAgregar = newArrayList()

	new(Plato unPlato) {

		platoSeleccionado = unPlato // Este unPlato existe, no necesito agregarlo
		pizza = unPlato.pizzaBase

		tamanio = unPlato.tamañoPizza

		ingredientesParaAgregar.addAll(platoSeleccionado.ingredientesExtras)

	}

	new(Plato unPlato, Pedido unPedido) {

		// Siempre Plato esta vacio pq lo usa agregar
		platoSeleccionado = unPlato // new Plato
		pedido = unPedido // Pedido al que hay que agregar unPlato 
	}

	def getPrecio() {

		if (platoTerminado) {
			return "$ " + platoSeleccionado.precio.toString
		} else {
			return "$" + 0.toString
		}

	}

	def getPizzaBase() {
		platoSeleccionado.pizzaBase
	}

	def setPizzaBase(Pizza unaPizza) {
		platoSeleccionado.pizzaBase = unaPizza
		ObservableUtils.firePropertyChanged(this, "precio")
	}

	def getTamanio() {
		platoSeleccionado.tamañoPizza
	}

	def setTamanio(Tamanio unTamaño) {

		platoSeleccionado.tamañoPizza = unTamaño
		ObservableUtils.firePropertyChanged(this, "precio")

	}

	def List<Tamanio> getTamaños() {

		val List<Tamanio> listaDeTamaños = newArrayList

		listaDeTamaños.add(new Tamanio("Porcion"))
		listaDeTamaños.add(new Tamanio("Chica"))
		listaDeTamaños.add(new Tamanio("Grande"))
		listaDeTamaños.add(new Tamanio("Familiar"))

		listaDeTamaños

	}

	def getIngredientesExtras() {
		platoSeleccionado.ingredientesExtras
	}

	def void agregarIngrediente() {
		if (!platoSeleccionado.ingredientesExtras.contains(ingredienteSeleccionado)) {
			platoSeleccionado.agregarAdicional(ingredienteSeleccionado)
			ObservableUtils.firePropertyChanged(this, "precio")
			ObservableUtils.firePropertyChanged(platoSeleccionado, "ingredientesExtras")
		}
	}

	def void quitarIngrediente() {
		platoSeleccionado.eliminarAdicional(ingredienteSeleccionado)
		ObservableUtils.firePropertyChanged(this, "precio")
		ObservableUtils.firePropertyChanged(platoSeleccionado, "ingredientesExtras")
	}

	def platoTerminado() {
		platoSeleccionado.pizzaBase !== null && platoSeleccionado.tamañoPizza !== null
	}
	
	def agregarPlato() {
			pedido.agregarPlato(platoSeleccionado)
			RepoPedido.repo.modificar(pedido)
	}



}

