package estadosDePedido

import dominoPizzeria.Pedido
import java.util.Date

abstract class EstadoDePedido {
	
	def void avanzarPedido(Pedido unPedido)
	
	def void retrocederPedido(Pedido unPedido)
	
	def void cancelarPedido(Pedido unPedido){
		
		unPedido.estadoDePedido = new Cerrado
		
		unPedido.fechaDeEntrega = new Date()
		
	}
	
	override def toString()
	{
		
		class.simpleName
		
	}
	
}
