package estadosDePedido

import dominoPizzeria.Pedido

class Entregado extends EstadoDePedido {
	
	override avanzarPedido(Pedido unPedido) {
		throw new Exception("No se puede avanzar")
	}
	
	override retrocederPedido(Pedido unPedido) {
	}
	
}
