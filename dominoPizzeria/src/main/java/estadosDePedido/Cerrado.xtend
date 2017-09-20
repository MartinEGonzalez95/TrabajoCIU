package estadosDePedido

import dominoPizzeria.Pedido

class Cerrado extends EstadoDePedido {
	
	override avanzarPedido(Pedido unPedido) {
		throw new Exception("No se puede avanzar")
	}
	
	override retrocederPedido(Pedido unPedido) {
		throw new Exception("No se puede retroceder")
	}
	
}
