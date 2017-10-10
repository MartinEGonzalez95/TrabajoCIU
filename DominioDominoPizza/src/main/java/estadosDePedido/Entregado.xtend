package estadosDePedido

import dominoPizzeria.Pedido
import java.io.InputStream
import org.reflections.Reflections

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
