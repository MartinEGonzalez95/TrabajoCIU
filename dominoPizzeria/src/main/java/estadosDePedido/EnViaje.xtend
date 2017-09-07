package estadosDePedido

import dominoPizzeria.Pedido

class EnViaje implements EstadoDePedido {
	
	override avanzarPedido(Pedido unPedido) {

		unPedido.estadoDePedido = new Entregado

	}
	
	override retrocederPedido(Pedido unPedido) {
		
		unPedido.estadoDePedido = new ListoParaEnviar
		
	}
	
	override cancelarPedido(Pedido unPedido) {
		
		unPedido.estadoDePedido = new Cerrado
	
	}
	
}
