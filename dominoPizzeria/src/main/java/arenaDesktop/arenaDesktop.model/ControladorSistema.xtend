package arenaDesktop.arenaDesktop.model

import java.util.ArrayList
import dominoPizzeria.Pedido
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@Accessors
@TransactionalAndObservable
class ControladorSistema {
	
	Pedido example = new Pedido
	ArrayList<Pedido> pedidos
	Pedido pedidoSeleccionado
	
	def getRepoPedidos(){
		
//		new RepoPedidos()
		
	}
	

	
}
