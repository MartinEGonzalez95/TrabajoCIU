package estadosDePedido

import dominoPizzeria.Pedido

class ListoParaEnviar implements EstadoDePedido {
	
	override avanzarPedido(Pedido unPedido) {

		unPedido.estadoDePedido = new EnViaje()

	}
	
	override retrocederPedido(Pedido unPedido) {

		unPedido.estadoDePedido = new Preparando()

	}
	
	override cancelarPedido(Pedido unPedido) {
		
		unPedido.estadoDePedido = new Cerrado
		
	}
	
	
	
}
