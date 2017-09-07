package estadosDePedido

import dominoPizzeria.Pedido
import java.util.Date

class ListoParaRetirar extends EstadoDePedido {
	
	override avanzarPedido(Pedido unPedido) {
	
		unPedido.estadoDePedido = new Entregado
		
		unPedido.fechaDeEntrega = new Date()
	
		if (unPedido.hayMasDe30MinDeDiferenciaEntre){
			
			unPedido.mailSender.enviarMail(unPedido.cliente.email, "Disculpe por la demora", "Estimado cliente, le pedimos disculpas por la demora en su pedido, XOXO Domino's Pizza")
			
		}
	
	}
	
	override retrocederPedido(Pedido unPedido) {

		unPedido.estadoDePedido = new Preparando

	}
	
	
}
