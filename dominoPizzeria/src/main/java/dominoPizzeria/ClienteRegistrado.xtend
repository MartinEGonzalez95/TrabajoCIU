package dominoPizzeria

import formaDeEnvioPedido.FormaDeEnvio
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ClienteRegistrado extends Cliente {

	String nick
	String contraseña
	String direccion


	new(String nombreCliente, String nickCliente, String contraseñaCliente, String emailCliente,
		String direccionCliente) {

		super(nombreCliente, emailCliente)
		nick = nickCliente
		contraseña = contraseñaCliente
		direccion = direccionCliente

	}

	//Modelo vs Realidad, no deberia hacer el pedido
	override hacerPedido(ArrayList<Plato> platosPedidos, String aclaraciones, FormaDeEnvio unaFormaDeEnvio) {

		new Pedido(platosPedidos, this, aclaraciones, unaFormaDeEnvio)
	}

}	
