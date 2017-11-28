package domino.APIREST

import dominio.DTO.ClienteDTO
import dominio.DTO.PedidoDTO
import dominio.DTO.TransformerDeDTOS
import dominoPizzeria.Pedido
import dominoPizzeria.Tamanio
import formaDeEnvioPedido.FormaDeEnvio
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.exceptions.UserException
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.api.annotation.Put
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
import repositorios.RepoCliente
import repositorios.RepoIngrediente
import repositorios.RepoPedido
import repositorios.RepoPizza
import repositorios.RepoTamanio

@Controller
class DominoRestAPI {

	extension JSONUtils = new JSONUtils
	TransformerDeDTOS transformer = new TransformerDeDTOS

	val repoClientes = RepoCliente.repo

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

		return ok(RepoTamanio.repo.cargar.toJson)
	}

	@Get("/ingredientes")
	def getIngredientes(String nombre) {

		response.contentType = ContentType.APPLICATION_JSON

		return ok(RepoIngrediente.getRepo.search(nombre).toJson)

	}

	@Post("/pedidos")
	def postPedido(@Body String bodyConPedido) {

		response.contentType = ContentType.APPLICATION_JSON

		val pedidoDTO = bodyConPedido.fromJson(PedidoDTO)
		try {
			var pedido = transformer.armarPedido(pedidoDTO)

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

	@Get("/pedidos")
	def getPedidosPorEstado(String estado, String nick) {

		response.contentType = ContentType.APPLICATION_JSON

		if (estado.nullOrEmpty) {

			var pedidos = RepoPedido.getRepo.buscarPorNick(nick)
			return ok(parsearPedidos(pedidos).toJson)
		} else {

			var pedidos = RepoPedido.getRepo.buscarPorEstado(estado)
			return ok(parsearPedidos(pedidos).toJson)
		}

	}

	def parsearPedidos(List<Pedido> pedidos) {

		return this.transformer.parsearPedidos(pedidos)
	}

	@Post("/pedidos/:numero/estado")
	def postCambiarEstadoPedido(@Body String bodyConEstadoNuevo) {

		response.contentType = ContentType.APPLICATION_JSON

		val pedido = RepoPedido.getRepo.buscar(Integer.valueOf(numero))

		val estadoNuevo = bodyConEstadoNuevo.fromJson(EstadoDePedidoDTO)

		pedido.estadoDePedido = transformer.transformarEstadoDePedido(estadoNuevo.nombre)

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

		val usuario = repoClientes.search(username)

		if (usuario === null) {

			return notFound()

		} else {
			return ok(
				usuario.map[it|new ClienteDTO(it)].toJson
			)

		}
	}

	@Put("/usuarios/:username")
	def putEditarUsuario(@Body String bodyEditUsuario) {

		response.contentType = ContentType.APPLICATION_JSON

		var clienteEditado = repoClientes.buscar(username)

		if (clienteEditado === null) {

			return notFound()

		}
		try {
			var clienteDTO = bodyEditUsuario.fromJson(ClienteDTO)

			clienteEditado.nombre = clienteDTO.nombre
			clienteEditado.email = clienteDTO.email
			clienteEditado.direccion = clienteDTO.direccion

			repoClientes.modificar(clienteEditado)
			clienteDTO = new ClienteDTO(clienteEditado)

			return ok(clienteDTO.toJson)
		} catch (UserException exception) {

			return badRequest(getErrorJson(exception.message))
		}

	}

	@Post("/usuarios")
	def createClientes(@Body String body) {
		response.contentType = ContentType.APPLICATION_JSON

		val ClienteDTO clienteDTO = body.fromJson(ClienteDTO)
		try {

			val unCliente = transformer.parsearClienteDTOACliente(clienteDTO);

			repoClientes.agregar(unCliente)
			return ok()

		} catch (UserException exception) {

			return badRequest(getErrorJson(exception.message))
		}

	}

	@Post("/login")
	def postLogin(@Body String usrData) {

		response.contentType = ContentType.APPLICATION_JSON
		val clienteDTO = usrData.fromJson(ClienteDTO)

		val cliente = repoClientes.buscar(clienteDTO.nick)
		try {
			if (cliente.password == clienteDTO.password) {

				return ok(new ClienteDTO(cliente).toJson)
			} else {

				return badRequest("Usuario o password erroneos, Por favor vuelva a intentarlo")
			}
		} catch (RuntimeException e) {
			return badRequest("Usuario o password erroneos, Por favor vuelva a intentarlo")
		}
	}

}

@Accessors
class EstadoDePedidoDTO {
	String nombre
}

@Accessors
class FormaDeEnvioDTO {
	String nombre
	int costo = 0;
	String direccion = "RetiroPorLocal";

}
