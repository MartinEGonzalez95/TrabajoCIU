package arenaDesktop.arenaDesktop.model

import dominoPizzeria.Plato
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import dominoPizzeria.Tamanio
import java.util.List
import org.uqbar.commons.model.annotations.Dependencies
import dominoPizzeria.Pedido

@Accessors
@Observable
class ControladorPlato extends ControladorMenu {

	Plato platoSeleccionado = null
	Pedido pedido = null

	def getPrecio() {
		if (platoSeleccionado.pizzaBase !== null) {
			return platoSeleccionado.precio
		} else {
			return 0
		}

	}

	new(Plato unPlato) {

		platoSeleccionado = unPlato

	}

	new(Plato plato, Pedido pedido) {
		this.platoSeleccionado = plato
		this.pedido = pedido
	}

	def List<Tamanio> getTamaños() {

		val List<Tamanio> listaDeTamaños = newArrayList

		listaDeTamaños.add(new Tamanio("Porcion"))
		listaDeTamaños.add(new Tamanio("Chica"))
		listaDeTamaños.add(new Tamanio("Grande"))
		listaDeTamaños.add(new Tamanio("Familiar"))

		listaDeTamaños

	}
	
	def agregarPlato(){
		pedido.agregarPlato(platoSeleccionado)
	}
	

}
