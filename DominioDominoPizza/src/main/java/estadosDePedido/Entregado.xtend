package estadosDePedido

import dominoPizzeria.Pedido

class Entregado extends EstadoDePedido
{
	
	override avanzarPedido(Pedido unPedido)
	{
		
		throw new RuntimeException("El Pedido Ya Fue Entregado!")
		
	}
	
	override retrocederPedido(Pedido unPedido)
	{
		
		throw new RuntimeException("El Pedido Ya Fue Entregado!")
		
	}
	
}
