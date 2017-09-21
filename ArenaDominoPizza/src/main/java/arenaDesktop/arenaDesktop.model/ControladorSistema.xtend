package arenaDesktop.arenaDesktop.model

import java.util.ArrayList
import dominoPizzeria.Pedido
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import dominoPizzeria.ClienteRegistrado
import formaDeEnvioPedido.RetiroPorLocal
import org.uqbar.commons.model.annotations.Observable

@Accessors
@Observable
class ControladorSistema {
	
	Pedido example = new Pedido
	ArrayList<Pedido> pedidos
	Pedido pedidoSeleccionado 
	
	//Eliminar los mensajes de prueba y usar repo
	
 	def setPedidoParaPrueba(){
 		
 		pedidos = newArrayList()
 		
 		pedidos.add(pedidoParaPrueba)
 		
 	}
	
	def Pedido pedidoParaPrueba()
	{	
		
	 new Pedido(newArrayList(), new ClienteRegistrado("F","2","3","2","3"), "Ninguna", new RetiroPorLocal())
	
	}

	def getRepoPedidos(){
		
//		new RepoPedidos()
		
	}
	
}
