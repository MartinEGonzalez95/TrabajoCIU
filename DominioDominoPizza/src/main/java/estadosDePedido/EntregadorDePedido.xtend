package estadosDePedido

import dominoPizzeria.Pedido
import java.util.Date

class EntregadorDePedido
{
	
	def entregarPedido(Pedido unPedido)
	{
		
		unPedido.estadoDePedido = new Entregado
		
		unPedido.fechaDeEntrega = new Date()
		
		unPedido.setTiempoDeEspera
		
		if (unPedido.hayMasDe30MinDeDiferenciaEntre)
		{
			
			unPedido.enviarMailPorDemora()
			
		}
		
	}
	
}