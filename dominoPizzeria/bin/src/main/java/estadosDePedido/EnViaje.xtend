package estadosDePedido

import dominoPizzeria.Pedido
import java.util.Date

class EnViaje extends EstadoDePedido {
	
	override avanzarPedido(Pedido unPedido) {

		unPedido.estadoDePedido = new Entregado
		
		unPedido.fechaDeEntrega = new Date()

	}
	
	override retrocederPedido(Pedido unPedido) {
		
		unPedido.estadoDePedido = new ListoParaEnviar
		
	}
	
}
