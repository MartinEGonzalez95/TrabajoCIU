package estadosDePedido

import dominoPizzeria.Pedido

class ListoParaRetirar extends EstadoDePedido
{
	
	EntregadorDePedido entregadorDePedido = new EntregadorDePedido()
	
	override avanzarPedido(Pedido unPedido)
	{
	
		entregadorDePedido.entregarPedido(unPedido)
	
	}
	
	override retrocederPedido(Pedido unPedido)
	{

		unPedido.estadoDePedido = new Preparando

	}
	
	
}
