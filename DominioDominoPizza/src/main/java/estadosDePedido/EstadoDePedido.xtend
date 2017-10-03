package estadosDePedido

import dominoPizzeria.Pedido

abstract class EstadoDePedido {
	
	def void avanzarPedido(Pedido unPedido)
	
	def void retrocederPedido(Pedido unPedido)
	
	def void cancelarPedido(Pedido unPedido)
	{
		
		unPedido.estadoDePedido = new Cerrado
		

		
	}
	
	override def toString()
	{
		
		class.simpleName
		
	}
	
}
