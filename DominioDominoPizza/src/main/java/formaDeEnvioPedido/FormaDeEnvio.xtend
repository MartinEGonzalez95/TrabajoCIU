package formaDeEnvioPedido

import dominoPizzeria.Pedido
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class FormaDeEnvio {

	String nombre = class.simpleName

	new() {
	}

	def int costo()

	def void avanzar(Pedido unPedido)

}
