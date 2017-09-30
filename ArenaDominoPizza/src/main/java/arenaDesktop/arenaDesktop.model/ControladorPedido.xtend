package arenaDesktop.arenaDesktop.model

import dominoPizzeria.Pedido
import dominoPizzeria.Plato

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import repositorios.RepoPedido
import org.uqbar.commons.model.annotations.Dependencies
import org.uqbar.commons.model.utils.ObservableUtils


@Accessors
@Observable
class ControladorPedido {

	Plato platoSeleccionado = null

	Pedido pedido

	new(Pedido unPedido) {

		pedido = unPedido

	}

	def cargar() {
		RepoPedido.repo.modificar(pedido)
		val id = pedido.numero
		pedido = null
		pedido = RepoPedido.repo.buscar(id)
		ObservableUtils.firePropertyChanged(this, "montoFinal")
	}

	def getMontoFinal() {
		"$ " + pedido.montoFinal.toString
	}

	def void eliminarPlato() {
		pedido.eliminarPlato(platoSeleccionado)
		ObservableUtils.firePropertyChanged(this, "montoFinal")
	}

	def void agregarPlato(Plato unPlato) {
		pedido.agregarPlato(unPlato)
		ObservableUtils.firePropertyChanged(this, "montoFinal")
	}



}
