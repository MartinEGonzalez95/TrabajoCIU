package arenaDesktop.arenaDesktop.model

import java.util.ArrayList
import dominoPizzeria.Pedido
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import dominoPizzeria.ClienteRegistrado
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
	
	
	//Eliminar los mensajes de prueba y usar repo
	
	def setPedidosCerradosParaPrueba(){
		
		pedidosCerrados = newArrayList()
		pedidosCerrados = pedidos.filter[it.estadoDePedido.toString == "Cerrado" || it.estadoDePedido.toString == "Entregado"].toList
	}
	
	def setPedidosAbiertosParaPrueba(){
		pedidosAbiertos = newArrayList()

		pedidosAbiertos = pedidos.filter[it.estadoDePedido.toString != "Cerrado" && it.estadoDePedido.toString != "Entregado"].toList
	}
	
	def updatePedidos(){
		
		setPedidosAbiertosParaPrueba
		setPedidosCerradosParaPrueba
		
	}
		
	def cargar(){
		
		val repoPedido1 = repoPedido
		
		val pedido1 = new Pedido(newArrayList(), new ClienteRegistrado("Fran","2","3","2","3"), "Ninguna", new RetiroPorLocal())
		pedido1.numero = 1

		val pedido2 = new Pedido(newArrayList(), new ClienteRegistrado("Martin","2","3","fake@gmail.com","3"), "Ninguna", new Delivery("Calle falsa 123"))
		pedido2.numero = 2
		
		val pedido3 = new Pedido(newArrayList(), new ClienteRegistrado("Gaston","2","3","2","3"), "Ninguna", new RetiroPorLocal())
		pedido3.numero = 3
				
		repoPedido1.agregar(pedido1)
		repoPedido1.agregar(pedido2)
		repoPedido1.agregar(pedido3)
		
		
		pedidos = newArrayList()
		pedidos = repoPedido1.cargar
		
		this.setPedidosAbiertosParaPrueba
		this.setPedidosCerradosParaPrueba
		
	}

	def getRepoPedido(){
		
			new RepoPedido()
		
	}
	
}
