package dominio.DTO

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import com.fasterxml.jackson.annotation.JsonProperty
import dominoPizzeria.Cliente

@TransactionalAndObservable
@Accessors
class ClienteDTO {

	String nombre
	String nick
	String email
	String direccion
	String password
	new() {
	}

	new(Cliente cliente) {

		nombre = cliente.nombre
		nick = cliente.nick
		
		email = cliente.email
		direccion = cliente.direccion
	}

	def esValido() {
		!nick.nullOrEmpty && !email.nullOrEmpty
	}

	@JsonProperty("nombre")
	def getNombre()
	{
		nombre
	}

	@JsonProperty("nick")
	def getNick()
	{
		nick
	}

	@JsonProperty("password")
	def getPassword()
	{
		password
	}

	@JsonProperty("email")
	def getEmail()
	{
		email
	}

	@JsonProperty("direccion")
	def getDireccion()
	{
		direccion
	}
	
}