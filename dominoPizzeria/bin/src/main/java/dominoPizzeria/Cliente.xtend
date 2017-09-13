package dominoPizzeria

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Cliente {

	String nombre
	String direccion
	String email
	String contraseña
	String nick

	new(String nombre) {
		this.nombre = nombre
	}

	new(String nombre, String nick, String contraseña, String email, String direccion) {

		this(nombre)
		this.nick = nick
		this.contraseña = contraseña
		this.email = email
		this.direccion = direccion

	}

	def boolean esIgual(Cliente cliente){
		
		
		true
	}
	



}
