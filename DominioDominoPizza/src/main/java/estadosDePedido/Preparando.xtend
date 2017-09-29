package estadosDePedido

import dominoPizzeria.Pedido
import org.uqbar.commons.model.exceptions.UserException

class Preparando extends EstadoDePedido {
	
	override void avanzarPedido(Pedido unPedido)
	{
		
		unPedido.formaDeEnvio.avanzar(unPedido)
		
	}
	
	override void retrocederPedido(Pedido unPedido)
	{
		throw new UserException("¡No se puede retroceder un pedido en preparacion!")		
	}
	
		
}
