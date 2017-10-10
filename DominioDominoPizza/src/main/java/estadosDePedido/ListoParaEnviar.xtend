package estadosDePedido

import dominoPizzeria.Pedido
import java.io.InputStream
import org.reflections.Reflections

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
