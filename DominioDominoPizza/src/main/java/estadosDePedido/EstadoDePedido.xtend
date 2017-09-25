package estadosDePedido

import dominoPizzeria.Pedido

abstract class EstadoDePedido {
	
	def void avanzarPedido(Pedido unPedido)
	
	def void retrocederPedido(Pedido unPedido)
	
	def void cancelarPedido(Pedido unPedido)
	{
		
		unPedido.estadoDePedido = new Cerrado
		
		// Es raro tecnicamente //
		
		// unPedido.fechaDeEntrega = new Date()
		// unPedido.setTiempoDeEspera
		
	}
	
	override def toString()
	{
		
		class.simpleName
		
	}
	
}
