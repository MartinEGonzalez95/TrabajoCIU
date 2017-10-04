package arenaDesktop.arenaDesktop.model

import dominoPizzeria.Pedido
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import repositorios.RepoPedido
import org.uqbar.commons.model.exceptions.UserException
import estadosDePedido.PedidoException

@Accessors
@Observable
class ControladorSistema {

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
		pedidos = RepoPedido.getRepo.cargar

		updatePedidos

		if (!pedidos.isEmpty) {
			pedidoSeleccionado = pedidos.get(pedidos.length - 1)
		}

	}

	def avanzar() {
		try {
			pedidoSeleccionado.avanzar
			updatePedidos
		} catch (PedidoException e) {

			throw new UserException(e.message)
		}
	}

	def retroceder() {
		try {
			pedidoSeleccionado.retroceder
			updatePedidos
		} catch (PedidoException e) {

			throw new UserException(e.message)
		}
	}

	def cancelar() {
		try {
			pedidoSeleccionado.cancelar
			updatePedidos
		} catch (PedidoException e) {

			throw new UserException(e.message)
		}
	}

}
