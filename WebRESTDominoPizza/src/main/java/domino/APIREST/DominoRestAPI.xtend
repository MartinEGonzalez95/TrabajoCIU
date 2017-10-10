package domino.APIREST

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
import repositorios.RepoIngrediente
import repositorios.RepoPedido

@Controller
class DominoRestAPI {
	extension JSONUtils = new JSONUtils

	private def getErrorJson(String message) {
		'{ "error": "' + message + '" }'
	}

	@Get("/ingredientes")
	def getIngredientes(String nombre) {
		response.contentType = ContentType.APPLICATION_JSON

		return ok(RepoIngrediente.getRepo.search(nombre).toJson)
	}

	@Get('/pedidos/:numero')
	def getPedidos() {
		
		val claveNumerica = Integer.valueOf(numero);
		response.contentType = ContentType.APPLICATION_JSON
		try {
			val pedido = RepoPedido.repo.buscar(claveNumerica)

			if (pedido === null) {
				return notFound(getErrorJson("No existe el pedido con ese numero"))
			} else {
				return ok(pedido.toJson)
			}

		} catch (NumberFormatException exception) {
			return badRequest(getErrorJson("El numero debe ser un entero"))
		}
	}

}
