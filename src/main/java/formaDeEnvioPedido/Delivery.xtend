package formaDeEnvioPedido

import org.eclipse.xtend.lib.annotations.Accessors
import estadosDePedido.ListoParaEnviar
import dominoPizzeria.Pedido

@Accessors
class Delivery extends FormaDeEnvio {
	
	int costo = 15
	
	String direccion
	
	new(String direccionDeEnvio)
	{
		
		direccion = direccionDeEnvio
		
	}

	override int costo()
	{
		
		costo
		
	}
	
	override avanzar(Pedido unPedido)
	{
		
		unPedido.estadoDePedido = new ListoParaEnviar()
		
	}
	
}
