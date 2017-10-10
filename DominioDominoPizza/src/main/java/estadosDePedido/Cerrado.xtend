package estadosDePedido

import dominoPizzeria.Pedido
import java.io.InputStream
import org.reflections.Reflections

class Cerrado extends EstadoDePedido {

	override avanzarPedido(Pedido unPedido) {

		throw new PedidoException("¡El pedido se encuentra cerrado!")

	}

	override retrocederPedido(Pedido unPedido) {

		throw new PedidoException("¡El pedido se encuentra cerrado!")

	}

}
