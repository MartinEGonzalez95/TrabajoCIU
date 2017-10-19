package domino.APIREST

import dominoPizzeria.Cliente
import dominoPizzeria.Pedido
import dominoPizzeria.Tamanio
import java.util.ArrayList

import org.uqbar.commons.model.exceptions.UserException
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils

import repositorios.RepoCliente
import repositorios.RepoIngrediente
import repositorios.RepoPedido
import repositorios.RepoPizza
import estadosDePedido.EstadoDePedido
import org.uqbar.xtrest.api.annotation.Put

@Controller
class DominoRestAPI {

	extension JSONUtils = new JSONUtils
	
	Class<Object> Login

	private def getErrorJson(String message) {
		'{ "error": "' + message + '" }'
	}
	
	@Get("/promos")
	def getPromos() {

		response.contentType = ContentType.APPLICATION_JSON

		return ok(RepoPizza.getRepo.cargar().toJson)

	}
	
	@Get("/tamanios")
	def getTamanios(String nombre) {

		response.contentType = ContentType.APPLICATION_JSON

		val tamanios = new ArrayList<Tamanio>
		tamanios.add(new Tamanio("Porcion"))
		tamanios.add(new Tamanio("Chica"))
		tamanios.add(new Tamanio("Grande"))
		tamanios.add(new Tamanio("Familiar"))

		return ok(tamanios.toJson)
	}
	
	@Get("/ingredientes")
	def getIngredientes(String nombre) {

		response.contentType = ContentType.APPLICATION_JSON

		return ok(RepoIngrediente.getRepo.search(nombre).toJson)

	}

	@Post("/pedidos")
	def postPedido(@Body String bodyConPedido) {
		
		response.contentType = ContentType.APPLICATION_JSON
		
		val pedido = bodyConPedido.fromJson(Pedido)
		
		try {
			RepoPedido.getRepo.agregar(pedido)
			return ok()
		} catch (RuntimeException e) {
			return badRequest()
		}

	}

	@Get("/pedidos/:numero")
	def getPedidoConNumero() {

		response.contentType = ContentType.APPLICATION_JSON

		val pedido = RepoPedido.getRepo.search(numero)

		if (pedido === null) {

			return notFound()

		} else {

			return ok(pedido.toJson)

		}
	}
	
	@Get("/pedido")
	def getPedidoPorUsuario(String nick) {

		response.contentType = ContentType.APPLICATION_JSON

		return ok(RepoPedido.getRepo.buscarPorNick(nick).toJson)

	}
	
	@Get("/pedidos")
	def getPedidosPorEstado(String estado) {

		response.contentType = ContentType.APPLICATION_JSON

		return ok(RepoPedido.getRepo.buscarPorEstado(estado).toJson)

	}

	@Post("/pedidos/:numero/estado")
	def postCambiarEstadoPedido(@Body String bodyConEstadoNuevo) {
		
		response.contentType = ContentType.APPLICATION_JSON

		val pedido = RepoPedido.getRepo.buscar(Integer.valueOf(numero))
		
		val estadoNuevo = bodyConEstadoNuevo.fromJson(EstadoDePedido)
	
		pedido.estadoDePedido = estadoNuevo
		
		return ok()

	}

	@Get("/pedidos/:numero/estado")
	def getEstadoDePedidoPorNumero() {

		response.contentType = ContentType.APPLICATION_JSON

		val pedido = RepoPedido.getRepo.buscar(Integer.valueOf(numero))

		if (pedido === null) {

			return notFound()

		} else {

			return ok(pedido.estadoDePedido.toJson)

		}
	}
	
	@Get("/usuarios/:username")
	def getUsuarioConUsername() {

		response.contentType = ContentType.APPLICATION_JSON

		val usuario = RepoCliente.getRepo.search(username)

		if (usuario === null) {

			return notFound()

		} else {

			return ok(usuario.toJson)

		}
	}
	
	@Put("/usuarios/:username")
	def putEditarUsuario(@Body String bodyEditUsuario)
	{
		
		response.contentType = ContentType.APPLICATION_JSON
		
		val clienteEditado = RepoCliente.getRepo.buscar(username)
		
		if (clienteEditado === null)
		{
			
			return notFound()
			
		}
		
		val nombreNuevo = bodyEditUsuario.getPropertyValue("nombreDe")
		val emailNuevo = bodyEditUsuario.getPropertyValue("emailDe")
		val direccionNueva = bodyEditUsuario.getPropertyValue("direccionDe")
		
		clienteEditado.nombre = nombreNuevo
		clienteEditado.email = emailNuevo
		clienteEditado.direccion = direccionNueva
		
		RepoCliente.getRepo.modificar(clienteEditado)
		
		ok('{ "status" : "OK" }')

	}

	@Post("/usuarios")
	def createClientes(@Body String body) {
		response.contentType = ContentType.APPLICATION_JSON

		val Cliente cliente = body.fromJson(Cliente)
		try {

			RepoCliente.repo.agregar(cliente)
			return ok()

		} catch (UserException exception) {

			return badRequest(getErrorJson(exception.message))
		}

	}
	
	@Post("/login")
	def postLogin(@Body String bodyConLogin) {

		response.contentType = ContentType.APPLICATION_JSON
		
		val login = bodyConLogin.fromJson(Login)
		
		try {
			return ok()
		} catch (RuntimeException e) {
			return badRequest()
		}

	}

}
