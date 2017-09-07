package dominoPizzeria

import dominoPizzeria.FormaDeEnvio
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Delivery extends FormaDeEnvio {
	
	int costo = 15
	
	
	
	override int costo(){
		costo
	}
	
	override avanzar(Pedido unPedido){
		
		unPedido.estadoDePedido = new ListoParaEnviar()
		
	}
	
}