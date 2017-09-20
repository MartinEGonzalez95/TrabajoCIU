package formaDeEnvioPedido

import dominoPizzeria.Pedido

abstract class FormaDeEnvio {

	def int costo()
	
	def void avanzar(Pedido unPedido)
	
}
