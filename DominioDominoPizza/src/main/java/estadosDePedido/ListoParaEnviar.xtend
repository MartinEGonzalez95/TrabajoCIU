package estadosDePedido

import dominoPizzeria.Pedido

class ListoParaEnviar extends EstadoDePedido {
	
	override avanzarPedido(Pedido unPedido) {

		unPedido.estadoDePedido = new EnViaje()
	
		unPedido.mailSender.enviarMail(unPedido.cliente.email, "Pedido en viaje", "Estimado "+ unPedido.cliente.nombre + ", su pedido ya se encuentra en viaje, XOXO Domino's Pizza")
		
	}
	
	override retrocederPedido(Pedido unPedido) {

		unPedido.estadoDePedido = new Preparando()

	}
	
	
}
