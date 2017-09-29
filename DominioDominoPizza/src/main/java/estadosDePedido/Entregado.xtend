package estadosDePedido

import dominoPizzeria.Pedido
import org.uqbar.commons.model.exceptions.UserException

class Entregado extends EstadoDePedido
{
	
	override avanzarPedido(Pedido unPedido)
	{
		
		throw new UserException("¡El pedido ya fue entregado!")
		
	}
	
	override retrocederPedido(Pedido unPedido)
	{
		
		throw new UserException("¡El pedido ya fue entregado!")
		
	}
	
}
