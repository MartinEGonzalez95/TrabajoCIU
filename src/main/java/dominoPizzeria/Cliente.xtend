package dominoPizzeria

import java.util.ArrayList
import formaDeEnvioPedido.FormaDeEnvio
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@TransactionalAndObservable
@Accessors
abstract class Cliente
{

	String nombre
	String email

	new(String nombreCliente, String emailCliente) {
		email = emailCliente
		nombre = nombreCliente
	}

	def Pedido hacerPedido(ArrayList<Plato> platos, String string, FormaDeEnvio envio)

}
