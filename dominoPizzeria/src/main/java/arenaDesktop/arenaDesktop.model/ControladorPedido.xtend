package arenaDesktop.arenaDesktop.model

import dominoPizzeria.Pedido
import dominoPizzeria.Plato

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class ControladorPedido
{
	
	Pedido pedidoSeleccionado
	Plato platoSeleccionado
	
	new(Pedido pedidoSeleccionado)
	{
		
		this.pedidoSeleccionado = pedidoSeleccionado
		
	}
	
	new(){}
	
}
