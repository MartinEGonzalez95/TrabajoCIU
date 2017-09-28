package arenaDesktop.arenaDesktop.model

import dominoPizzeria.Pedido
import dominoPizzeria.Plato

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import java.util.List

@Accessors
@Observable
class ControladorPedido {

	Plato platoSeleccionado = null

	Pedido pedido

	new(Pedido unPedido) {
		
		pedido = unPedido

	}
	

}
