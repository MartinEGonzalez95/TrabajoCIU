package estadosDePedido

import dominoPizzeria.Pedido

class Preparando extends EstadoDePedido {
	
	override void avanzarPedido(Pedido unPedido)
	{
		
		unPedido.formaDeEnvio.avanzar(unPedido)
		
	}
	
	override void retrocederPedido(Pedido unPedido)
	{
		throw new PedidoException("¡No se puede retroceder un pedido en preparacion!")		
	}
	
		
}
