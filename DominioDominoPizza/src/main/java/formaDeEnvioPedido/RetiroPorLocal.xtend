package formaDeEnvioPedido

import estadosDePedido.ListoParaRetirar
import dominoPizzeria.Pedido
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Observable
@Accessors
class RetiroPorLocal extends FormaDeEnvio {

	int costo = 0 // pesos //
	new() {
	}
	override int costo()
	{
		
		costo
		
	}
	
	override avanzar(Pedido unPedido)
	{
		
		unPedido.estadoDePedido = new ListoParaRetirar()
		
	}
}
