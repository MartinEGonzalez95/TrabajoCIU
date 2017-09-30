package estadosDePedido

import dominoPizzeria.Pedido

class Cerrado extends EstadoDePedido {

	override avanzarPedido(Pedido unPedido) {

		throw new RuntimeException("¡El pedido se encuentra cerrado!")

	}

	override retrocederPedido(Pedido unPedido) {

		throw new RuntimeException("¡El pedido se encuentra cerrado!")

	}

}
