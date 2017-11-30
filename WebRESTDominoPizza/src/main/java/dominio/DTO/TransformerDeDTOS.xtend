package dominio.DTO

import estadosDePedido.Cerrado
import estadosDePedido.Entregado
import estadosDePedido.EnViaje
import estadosDePedido.ListoParaEnviar
import estadosDePedido.ListoParaRetirar
import estadosDePedido.Preparando
import formaDeEnvioPedido.RetiroPorLocal
import formaDeEnvioPedido.Delivery
import dominoPizzeria.Cliente
import dominoPizzeria.Pedido
import repositorios.RepoCliente

import domino.APIREST.FormaDeEnvioDTO
import java.util.List
import estadosDePedido.EstadoDePedido
import domino.APIREST.EstadoDePedidoDTO

class TransformerDeDTOS {

	def EstadoDePedido transformarEstadoDePedido(String estado) {
		switch (estado) {
			case "Cerrado": return new Cerrado()
			,
			case "EnViaje": return new EnViaje()
			,
			case "Entregado": return new Entregado()
			,
			case "ListoParaEnviar": return new ListoParaEnviar()
			,
			case "ListoParaRetirar": return new ListoParaRetirar()
			,
			case "Preparando": return new Preparando()
		}
	}

	def transfomarFormaDeEnvio(FormaDeEnvioDTO formaDeEnvio) {
		switch (formaDeEnvio.nombre) {
			case "RetiroPorLocal":
				return new RetiroPorLocal()
			,
			case "Delivery":
				return new Delivery() => [
					it.direccion = formaDeEnvio.direccion

				]
		}
	}

	def parsearClienteDTOACliente(ClienteDTO dto) {
		new Cliente() => [
			it.nick = dto.nick
			it.nombre = dto.nombre
			it.direccion = dto.direccion
			it.password = dto.password
			it.email = dto.email
		]
	}

	def armarPedido(PedidoDTO dto) {

		new Pedido() => [
			it.platos = dto.platos
			it.cliente = RepoCliente.repo.buscar(dto.cliente)
			it.fechaDeCreacion = dto.fechaDeCreacion
			it.aclaraciones = dto.aclaraciones
			it.estadoDePedido = dto.estadoDePedido
			it.numero = dto.numero
			it.estadoDePedido = new Preparando
			it.formaDeEnvio = transfomarFormaDeEnvio(dto.formaDeEnvio)
		]
	}

	def List<PedidoDTO> parsearPedidos(List<Pedido> pedidos) {
		return pedidos.map[it|new PedidoDTO(it)].toList
	}

	def cambiarEstadoDelPedido(Pedido pedido, EstadoDePedidoDTO dto) {
		if (dto.nombre == "Cerrado") {
			pedido.cancelar();
		} else {
			pedido.avanzar();
		}

	}

}
