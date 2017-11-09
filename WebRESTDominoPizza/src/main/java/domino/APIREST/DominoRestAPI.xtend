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
import org.eclipse.xtend.lib.annotations.Accessors
import estadosDePedido.Cerrado
import estadosDePedido.Entregado
import estadosDePedido.EnViaje
import estadosDePedido.ListoParaEnviar
import estadosDePedido.ListoParaRetirar
import estadosDePedido.Preparando
import dominio.DTO.PedidoDTO
import java.util.List
import formaDeEnvioPedido.RetiroPorLocal
import formaDeEnvioPedido.Delivery

@Controller
class DominoRestAPI {

	extension JSONUtils = new JSONUtils

	// Class<Object> Login
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
		tamanios.add(new Tamanio("Porcion",0.125))
		tamanios.add(new Tamanio("Chica",0.5))
		tamanios.add(new Tamanio("Grande",1))
		tamanios.add(new Tamanio("Familiar",1.25))

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

		val pedidoDTO = bodyConPedido.fromJson(PedidoDTO)

		try {
			var pedido = this.armarPedido(pedidoDTO)

			RepoPedido.getRepo.agregar(pedido)
			return ok()
		} catch (RuntimeException e) {
			return badRequest()
		}

	}

	def armarPedido(PedidoDTO dto) {

		new Pedido() => [
			it.platos = dto.platos
			it.cliente = RepoCliente.repo.buscar(dto.cliente)
			it.fechaDeCreacion = dto.fechaDeCreacion
			it.aclaraciones = dto.aclaraciones
			it.estadoDePedido = dto.estadoDePedido
			it.numero = dto.numero
		]
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
		return pedidos.map[it|new PedidoDTO(it)]
	}

	@Post("/pedidos/:numero/estado")
	def postCambiarEstadoPedido(@Body String bodyConEstadoNuevo) {

		response.contentType = ContentType.APPLICATION_JSON

		val pedido = RepoPedido.getRepo.buscar(Integer.valueOf(numero))

		val estadoNuevo = bodyConEstadoNuevo.fromJson(EstadoDePedidoDTO)

		pedido.estadoDePedido = transformarEstadoDePedido(estadoNuevo.nombre)

		return ok()

	}

	def transformarEstadoDePedido(String estado) {
		switch (estado) {
			case "Cerrado": return new Cerrado()
			,
			case "Entregado": return new Entregado()
			,
			case "EnViaje": return new EnViaje()
			,
			case "ListoParaEnviar": return new ListoParaEnviar()
			,
			case "ListoParaRetirar": return new ListoParaRetirar()
			,
			case "Preparando": return new Preparando()
		}
	}

	def transfomarFormaDeEnvio(String formaDeEnvio) {
		switch (formaDeEnvio) {
			case "RetiroPorLocal": return new RetiroPorLocal()
			,
			case "Delivery": return new Delivery()
		}
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
	def putEditarUsuario(@Body String bodyEditUsuario) {

		response.contentType = ContentType.APPLICATION_JSON

		val clienteEditado = RepoCliente.getRepo.buscar(username)

		if (clienteEditado === null) {

			return notFound()

		}

		val nombreNuevo = bodyEditUsuario.getPropertyValue("nombre")
		val emailNuevo = bodyEditUsuario.getPropertyValue("email")
		val direccionNueva = bodyEditUsuario.getPropertyValue("direccion")

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
	def postLogin(@Body String usrData) {

		response.contentType = ContentType.APPLICATION_JSON

		val cliente = RepoCliente.getRepo.buscar(getPropertyValue(usrData, "nick"))

		try {
			if (cliente.password == getPropertyValue(usrData, "password")) {
				return ok(cliente.toJson)
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
}











