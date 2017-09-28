package arenaDesktop.arenaDesktop.model

import dominoPizzeria.Pedido
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import repositorios.RepoPedido

@Accessors
@Observable
class ControladorSistema {

//	Pedido example = new Pedido()
	List<Pedido> pedidos = newArrayList()
	Pedido pedidoSeleccionado
	List<Pedido> pedidosAbiertos
	List<Pedido> pedidosCerrados

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

		pedidos = null
		pedidos = repoPedido.cargar

		updatePedidos

	}

	def getRepoPedido() {

		 RepoPedido.getRepo

	}

}
