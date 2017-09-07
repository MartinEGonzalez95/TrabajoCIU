package estadosDePedido

import dominoPizzeria.Pedido

class ListoParaRetirar implements EstadoDePedido {
	
	override avanzarPedido(Pedido unPedido) {
	
		unPedido.estadoDePedido = new Entregado
	
	}
	
	override retrocederPedido(Pedido unPedido) {

		unPedido.estadoDePedido = new Preparando

	}
	
	override cancelarPedido(Pedido unPedido) {
		
		unPedido.estadoDePedido = new Cerrado		

	}
	
}
