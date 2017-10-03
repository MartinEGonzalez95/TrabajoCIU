package arenaDesktop.arenaDesktop.model

import dominoPizzeria.Pedido
import dominoPizzeria.Plato
import repositorios.RepoPedido

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.utils.ObservableUtils

@Accessors
@Observable
class ControladorPedido {

	Plato platoSeleccionado = null

	Pedido pedido

	new(Pedido unPedido) {

		pedido = unPedido

	}

	def getPlatos() {
		pedido.platos
	}

	def montoFinal() {
		"$ " + pedido.montoFinal.toString
	}

	def void eliminarPlato() {
		pedido.eliminarPlato(platoSeleccionado)
		ObservableUtils.firePropertyChanged(this, "montoFinal")
	}

	def void agregarPlato()
	{
		
		ObservableUtils.firePropertyChanged(this, "montoFinal")
		
	}
	
	def editarPlato(Plato plato)
	{
		
		pedido.eliminarPlato(plato)
		pedido.agregarPlato(plato)
		ObservableUtils.firePropertyChanged(this, "montoFinal")
		
	}
	
}
