package domino.APIREST

import dominoPizzeria.Pedido
import dominoPizzeria.Tamanio
import java.util.ArrayList
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
import repositorios.RepoIngrediente
import repositorios.RepoPizza
import repositorios.RepoPedido
import repositorios.RepoCliente
import dominoPizzeria.Cliente
import org.uqbar.commons.model.exceptions.UserException
import com.fasterxml.jackson.databind.exc.UnrecognizedPropertyException

@Controller
class DominoRestAPI {

	extension JSONUtils = new JSONUtils

	private def getErrorJson(String message) {
		'{ "error": "' + message + '" }'
	}

	/** PEDIDOS REST */
	@Get("/pedidos")
	def getPedidos() {

		response.contentType = ContentType.APPLICATION_JSON

		return ok(RepoPedido.getRepo.cargar().toJson)

	}

	@Post("/pedidos")
	def postPedido(@Body String bodyConPedido) {

		response.contentType = ContentType.APPLICATION_JSON

		val pedido = bodyConPedido.fromJson(Pedido)

		if (pedido === null) {

			return badRequest()

		} else {
			RepoPedido.repo.agregar(pedido)
			return ok()
		}

	}

	@Get("/pedidos/:numero")
	def getPedidoConNumero() {

		response.contentType = ContentType.APPLICATION_JSON

		val pedido = RepoPedido.repo.search(numero)

		if (pedido === null) {

			return notFound()

		} else {

			return ok(pedido.toJson)

		}
	}

	@Get("/pedidos/:estadoDePedido")
	def getPedidoConEstado() {

		response.contentType = ContentType.APPLICATION_JSON

		val pedido = RepoPedido.repo.searchPorPedido(estadoDePedido)

		if (pedido === null) {

			return notFound()

		} else {

			return ok(pedido.toJson)

		}
	}

	/** PROMOCIONES E INGREDIENTES */
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

	/** USUARIOS  */
	@Get("/usuarios")
	def getClientes(String username) {
		response.contentType = ContentType.APPLICATION_JSON

		return ok(RepoCliente.getRepo.search(username).toJson)

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

	@Get("/usuarios/:username")
	def getUsuarioConUsername() {

		response.contentType = ContentType.APPLICATION_JSON

		val usuario = RepoCliente.repo.search(username)

		if (usuario === null) {

			return notFound()

		} else {

			return ok(usuario.toJson)

		}
	}

}
