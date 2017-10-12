package dominoPizzeria

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@TransactionalAndObservable
@Accessors
class Cliente {

	String nombre
	String nick
	String password
	String email
	String direccion

	new() {
	}

	new(String nombreCliente, String nickCliente, String passwordCliente, String emailCliente,
		String direccionCliente) {

		nombre = nombreCliente
		nick = nickCliente
		password = passwordCliente
		email = emailCliente
		direccion = direccionCliente

	}

	def esValido() {
		!nick.nullOrEmpty && !email.nullOrEmpty
	}

}
