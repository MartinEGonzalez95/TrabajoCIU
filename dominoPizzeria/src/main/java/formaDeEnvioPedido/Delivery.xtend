package formaDeEnvioPedido

import org.eclipse.xtend.lib.annotations.Accessors
import estadosDePedido.ListoParaEnviar
import dominoPizzeria.Pedido

@Accessors
class Delivery extends FormaDeEnvio {
	
	int costo 
	
	new(){
		
		this.costo = 15
		
	}
	
	
	override int costo(){
		costo
	}
	
	override avanzar(Pedido unPedido){
		
		unPedido.estadoDePedido = new ListoParaEnviar()
		
	}
	
}
