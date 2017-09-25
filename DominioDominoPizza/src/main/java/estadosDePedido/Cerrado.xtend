package estadosDePedido

import dominoPizzeria.Pedido

class Cerrado extends EstadoDePedido
{
	
	override avanzarPedido(Pedido unPedido)
	{
		
		throw new RuntimeException("El Pedido Se Encuentra Cerrado!")
		
	}
	
	override retrocederPedido(Pedido unPedido)
	{
		
		throw new RuntimeException("El Pedido Se Encuentra Cerrado!")
		
	}
	
}
