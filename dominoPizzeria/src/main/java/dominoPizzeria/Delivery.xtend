package dominoPizzeria

import dominoPizzeria.FormaDeEnvio

class Delivery extends FormaDeEnvio {
	
	override int costo(){
		15
	}
	
	override avanzar(Pedido unPedido){
		
		unPedido.estadoDePedido = new ListoParaEnviar()
		
	}
	
}