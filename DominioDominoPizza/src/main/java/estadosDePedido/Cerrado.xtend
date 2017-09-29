package estadosDePedido

import dominoPizzeria.Pedido
import org.uqbar.commons.model.exceptions.UserException


class Cerrado extends EstadoDePedido
{
	
	override avanzarPedido(Pedido unPedido)
	{
		
		throw new UserException("¡El pedido se encuentra cerrado!")
		
	}
	
	override retrocederPedido(Pedido unPedido)
	{
		
		throw new UserException("¡El pedido se encuentra cerrado!")
		
	}
	
}
