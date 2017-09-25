package formaDeEnvioPedido

import estadosDePedido.ListoParaRetirar
import dominoPizzeria.Pedido

class RetiroPorLocal extends FormaDeEnvio {

	int costo = 0 // pesos //
	
	override int costo()
	{
		
		costo
		
	}
	
	override avanzar(Pedido unPedido)
	{
		
		unPedido.estadoDePedido = new ListoParaRetirar()
		
	}
}
