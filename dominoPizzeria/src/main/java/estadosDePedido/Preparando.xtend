package estadosDePedido

import dominoPizzeria.Pedido

class Preparando implements EstadoDePedido {
	
	override void avanzarPedido(Pedido unPedido){
		
		unPedido.formaDeEnvio.avanzar(unPedido)
		
	}
	
	override void retrocederPedido(Pedido unPedido){}
	
	override void cancelarPedido(Pedido unPedido){}
	
}
