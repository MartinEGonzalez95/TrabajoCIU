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

class TransformerDeDTOS {
	
	
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
	
		def parsearClienteDTOACliente(ClienteDTO dto) {
		new Cliente()=>[
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
		]
	}
	
	
}