package formaDeEnvioPedido

import estadosDePedido.ListoParaRetirar
import dominoPizzeria.Pedido

class RetiroPorLocal extends FormaDeEnvio {

	override int costo()
	{
		
		0
		
	}
	
	override avanzar(Pedido unPedido)
	{
		
		unPedido.estadoDePedido = new ListoParaRetirar()
		
	}
}
