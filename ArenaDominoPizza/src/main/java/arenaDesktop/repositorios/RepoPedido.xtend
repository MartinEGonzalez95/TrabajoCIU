package arenaDesktop.repositorios

import dominoPizzeria.Pedido
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@TransactionalAndObservable
@Accessors
class RepoPedido implements Repo<Pedido> {
	
	ArrayList<Pedido> pedidos = new ArrayList<Pedido>

	override agregar(Pedido pedido) {
		this.pedidos.add(pedido)
	}

	override eliminar(Pedido pedido) {
		this.pedidos.remove(pedido)
	}

	override buscar(String email) {
		this.pedidos.filter[it.cliente.email == email].head
	}
	
}
