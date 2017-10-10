package estadosDePedido

import dominoPizzeria.Pedido
import org.reflections.serializers.Serializer
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class EstadoDePedido{
	
	String nombre = class.simpleName
	
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
