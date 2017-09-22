package arenaDesktop.arenaDesktop.model


import dominoPizzeria.Pedido
import org.eclipse.xtend.lib.annotations.Accessors

import dominoPizzeria.Cliente
import formaDeEnvioPedido.RetiroPorLocal
import org.uqbar.commons.model.annotations.Observable
import repositorios.RepoPedido
import java.util.List
import formaDeEnvioPedido.Delivery


@Accessors
@Observable
class ControladorSistema {

	Pedido example = new Pedido
	List<Pedido> pedidos
	Pedido pedidoSeleccionado
	List<Pedido> pedidosAbiertos
	List<Pedido> pedidosCerrados

	// Eliminar los mensajes de prueba y usar repo
	def setPedidosCerradosParaPrueba() {

		pedidosCerrados = newArrayList()
		pedidosCerrados = pedidos.filter [
			it.estadoDePedido.toString == "Cerrado" || it.estadoDePedido.toString == "Entregado"
		].toList
	}

	def setPedidosAbiertosParaPrueba() {
		pedidosAbiertos = newArrayList()

		pedidosAbiertos = pedidos.filter [
			it.estadoDePedido.toString != "Cerrado" && it.estadoDePedido.toString != "Entregado"
		].toList
	}

	def updatePedidos() {

		setPedidosAbiertosParaPrueba
		setPedidosCerradosParaPrueba

	}

	def cargar() {

		val repoPedido1 = repoPedido

		val pedido1 = new Pedido => [

			cliente = new Cliente("Fran", "Fperez", "1234", "fake1@gmail.com", "falsa por mucho")
			formaDeEnvio = new RetiroPorLocal
			numero = 1
		]

		val pedido2 = new Pedido => [

			cliente = new Cliente("Martin", "martinG", "hackme", "fake@gmail.com", "not falsa")
			formaDeEnvio = new Delivery("Falsa 123")
			numero = 2
		]

		val pedido3 = new Pedido => [

			cliente = new Cliente("Gaston", "GTest", "dontHackme", "notFake@gmail.com", "not not not falsa")
			formaDeEnvio = new RetiroPorLocal
			numero = 3
		]

		repoPedido1.agregar(pedido1)
		repoPedido1.agregar(pedido2)
		repoPedido1.agregar(pedido3)

		pedidos = newArrayList()
		pedidos = repoPedido1.cargar

		this.setPedidosAbiertosParaPrueba
		this.setPedidosCerradosParaPrueba

	}

	def getRepoPedido() {

		new RepoPedido()

	}

}
