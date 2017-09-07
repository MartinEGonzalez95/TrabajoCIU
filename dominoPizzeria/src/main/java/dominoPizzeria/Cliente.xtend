package dominoPizzeria

import formaDeEnvioPedido.FormaDeEnvio
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Cliente {

	String nombre
	String nick
	String contraseña
	String email
	String direccion

	new(String nombreCliente, String nickCliente, String contraseñaCliente, String emailCliente,
		String direccionCliente) {

		nombre = nombreCliente
		nick = nickCliente
		contraseña = contraseñaCliente
		email = emailCliente
		direccion = direccionCliente

	}

	def hacerPedido(ArrayList<Plato> platosPedidos, String aclaraciones, FormaDeEnvio unaFormaDeEnvio)
	{

		val Pedido nuevoPedido = new Pedido(platosPedidos, this, aclaraciones, unaFormaDeEnvio)

		return nuevoPedido

	}

}
