package formaDeEnvioPedido

import org.eclipse.xtend.lib.annotations.Accessors
import estadosDePedido.ListoParaEnviar
import dominoPizzeria.Pedido
import org.uqbar.commons.model.annotations.Observable

@Observable
@Accessors
class Delivery extends FormaDeEnvio {
	
	int costo = 15 // pesos //
	
	String direccion

	override int costo()
	{
		
		costo
		
	}
	
	override avanzar(Pedido unPedido)
	{
		
		unPedido.estadoDePedido = new ListoParaEnviar()
		
	}
	
}
