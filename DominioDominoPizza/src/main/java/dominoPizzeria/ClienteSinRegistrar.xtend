package dominoPizzeria

import java.util.ArrayList
import formaDeEnvioPedido.FormaDeEnvio
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors

//Eliminar este cliente
class ClienteSinRegistrar extends Cliente {

	override hacerPedido(ArrayList<Plato> platosPedidos, String aclaraciones, FormaDeEnvio unaFormaDeEnvio) {
		new Pedido(platosPedidos, this, aclaraciones, unaFormaDeEnvio)
	}

}
