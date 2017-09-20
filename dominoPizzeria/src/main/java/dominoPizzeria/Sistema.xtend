package dominoPizzeria

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@TransactionalAndObservable
@Accessors

// no deberia existir
class Sistema {

	ArrayList<Pedido> pedidos
	ArrayList<ClienteRegistrado> clientes
	
	new(){
		
		pedidos = newArrayList
		clientes = newArrayList
	}

	def registrarCliente(ClienteRegistrado unNuevoCliente) {

		if (existeUnClienteConInformacionDe(unNuevoCliente)) {

			throw new RuntimeException("Nick o Mail ya utilizado!")

		} else {

			clientes.add(unNuevoCliente)

		}

	}

	def private existeUnClienteConInformacionDe(ClienteRegistrado unNuevoCliente) {

		for (ClienteRegistrado clienteYaRegistrado : clientes) {

			if (clienteYaRegistrado.nick == unNuevoCliente.nick || clienteYaRegistrado.email == unNuevoCliente.email) {

				return true
			}
		}

		return false

	}
	
	def registrarPedido(Pedido pedido){
		
		pedidos.add(pedido)
		
	}

}
