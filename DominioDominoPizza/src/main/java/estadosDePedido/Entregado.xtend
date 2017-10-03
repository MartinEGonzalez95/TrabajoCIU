package estadosDePedido

import dominoPizzeria.Pedido

class Entregado extends EstadoDePedido
{
	
	override avanzarPedido(Pedido unPedido)
	{
		
		throw new PedidoException("¡El pedido ya fue entregado!")
		
	}
	
	override retrocederPedido(Pedido unPedido)
	{
		
		throw new PedidoException("¡El pedido ya fue entregado!")
		
	}
	
}
