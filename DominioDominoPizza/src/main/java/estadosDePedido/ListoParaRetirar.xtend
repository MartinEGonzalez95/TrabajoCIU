package estadosDePedido

import dominoPizzeria.Pedido
import java.util.Date

class ListoParaRetirar extends EstadoDePedido {
	
	override avanzarPedido(Pedido unPedido)
	{
	
		unPedido.estadoDePedido = new Entregado
		
		unPedido.fechaDeEntrega = new Date()
		
		unPedido.setTiempoDeEspera
	
		if (unPedido.hayMasDe30MinDeDiferenciaEntre)
		{
			
			unPedido.enviarMailPorDemora()
			
		}
	
	}
	
	override retrocederPedido(Pedido unPedido)
	{

		unPedido.estadoDePedido = new Preparando

	}
	
	
}
