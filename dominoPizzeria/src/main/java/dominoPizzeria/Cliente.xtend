package dominoPizzeria

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import formaDeEnvioPedido.FormaDeEnvio

@Accessors
class Cliente {

	String nombre
	String nick
	String contraseña
	String email
	String direccion
	ArrayList<Pedido> historialDePedidos

	new(String nombreCliente, String nickCliente, String contraseñaCliente, String emailCliente,
		String direccionCliente) {

		nombre = nombreCliente
		nick = nickCliente
		contraseña = contraseñaCliente
		email = emailCliente
		direccion = direccionCliente
		historialDePedidos = new ArrayList<Pedido>

	}

	def hacerPedidoConRetiroPorElLocal(ArrayList<Plato> platosPedidos, String aclaraciones) {

		val FormaDeEnvio formaDeEnvioRetiroPorElLocal = new RetiroPorLocal()

		val Pedido nuevoPedido = new Pedido(platosPedidos, this, aclaraciones, formaDeEnvioRetiroPorElLocal)

		historialDePedidos.add(nuevoPedido)

		return nuevoPedido

	}

	def hacerPedidoConDelivery(ArrayList<Plato> platosPedidos, String aclaraciones) {

		val FormaDeEnvio formaDeEnvioDelivery = new Delivery()

		val Pedido nuevoPedido = new Pedido(platosPedidos, this, aclaraciones, formaDeEnvioDelivery)

		historialDePedidos.add(nuevoPedido)

		return nuevoPedido

	}

}
