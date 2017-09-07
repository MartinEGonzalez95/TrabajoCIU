package estadosDePedido

import dominoPizzeria.Pedido

class ListoParaEnviar extends EstadoDePedido {
	
	override avanzarPedido(Pedido unPedido) {

		unPedido.estadoDePedido = new EnViaje()
		
	}
	
	override retrocederPedido(Pedido unPedido) {

		unPedido.estadoDePedido = new Preparando()

	}
	
	
}
