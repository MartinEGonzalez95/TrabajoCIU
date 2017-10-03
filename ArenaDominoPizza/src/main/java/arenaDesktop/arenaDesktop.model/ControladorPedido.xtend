package arenaDesktop.arenaDesktop.model

import dominoPizzeria.Pedido
import dominoPizzeria.Plato

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import repositorios.RepoPedido
import org.uqbar.commons.model.annotations.Dependencies
import org.uqbar.commons.model.utils.ObservableUtils
import java.util.List
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@Accessors
@TransactionalAndObservable
class ControladorPedido {

	Plato platoSeleccionado = null

	Pedido pedido

	new(Pedido unPedido) {

		pedido = unPedido

	}

	def getPlatos() {
		pedido.platos
	}

	def cargar() {
		val id = pedido.numero
		RepoPedido.repo.modificar(pedido)

		pedido = null
		pedido = RepoPedido.repo.buscar(id)
		ObservableUtils.firePropertyChanged(this, "montoFinal")
		ObservableUtils.firePropertyChanged(pedido, "montoFinal")
	}

	
	def montoFinal() {
		"$ " + pedido.montoFinal.toString
	}

	def void eliminarPlato() {
		pedido.eliminarPlato(platoSeleccionado)
		ObservableUtils.firePropertyChanged(this, "montoFinal")
	}

//	def void agregarPlato(Plato unPlato) {
//		pedido.agregarPlato(unPlato)
//		ObservableUtils.firePropertyChanged(this, "montoFinal")
//	}
}
