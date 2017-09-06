package dominoPizzeria

import dominoPizzeria.FormaDeEnvio

class RetiroPorLocal extends FormaDeEnvio {

	override int costo(){
		0
	}
	
	override avanzar(Pedido unPedido){
		
		unPedido.estadoDePedido = new ListoParaRetirar()
		
	}
}