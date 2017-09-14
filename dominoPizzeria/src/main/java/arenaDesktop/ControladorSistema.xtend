package arenaDesktop

import dominoPizzeria.Sistema
import java.util.ArrayList
import dominoPizzeria.Pedido
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import java.util.Date

@Accessors
@Observable
class ControladorSistema {
	
	Pedido example = new Pedido
	ArrayList<Pedido> pedidos
	Pedido pedidoSeleccionado
	
	def getRepoPedidos(){
		
//		new RepoPedidos()
		
	}
	
	
}