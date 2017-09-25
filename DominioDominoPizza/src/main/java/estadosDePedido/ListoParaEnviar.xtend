package estadosDePedido

import dominoPizzeria.Pedido

class ListoParaEnviar extends EstadoDePedido
{
	
	override avanzarPedido(Pedido unPedido)
	{

		unPedido.estadoDePedido = new EnViaje()
	
		unPedido.enviarMailPorPedidoEnViaje
		
	}
	
	override retrocederPedido(Pedido unPedido)
	{

		unPedido.estadoDePedido = new Preparando()

	}
	
	
}
