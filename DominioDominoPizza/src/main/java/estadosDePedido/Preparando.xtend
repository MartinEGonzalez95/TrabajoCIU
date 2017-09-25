package estadosDePedido

import dominoPizzeria.Pedido

class Preparando extends EstadoDePedido {
	
	override void avanzarPedido(Pedido unPedido)
	{
		
		unPedido.formaDeEnvio.avanzar(unPedido)
		
	}
	
	override void retrocederPedido(Pedido unPedido)
	{
		
		throw new RuntimeException("No Se Puede Retroceder Un Pedido En Preparacion!")
			
	}
	
		
}
