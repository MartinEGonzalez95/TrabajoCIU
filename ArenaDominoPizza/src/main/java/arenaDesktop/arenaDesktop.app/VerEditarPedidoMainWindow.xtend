// ----------------------------------------------------------------------------------------------------//
// 									¡¡¡BORRAR CUANDO JUNTEMOS!!!									   //
// ----------------------------------------------------------------------------------------------------//
package arenaDesktop.arenaDesktop.app

import arenaDesktop.arenaDesktop.model.ControladorPedido
import arenaDesktop.arenaDesktop.ui.VerEditarPedidoAbiertoWindow
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import dominoPizzeria.Pedido
import dominoPizzeria.Cliente
import formaDeEnvioPedido.RetiroPorLocal
import org.uqbar.arena.windows.Dialog
import dominoPizzeria.Tamanio
import dominoPizzeria.Plato
import dominoPizzeria.Pizza

class VerEditarPedidoMainWindow extends SimpleWindow<ControladorPedido> {

	new(WindowOwner parent) {

		super(parent, new ControladorPedido())

	}

	override protected addActions(Panel actionsPanel) {
	}

	override protected createFormPanel(Panel mainPanel) {

		new Button(mainPanel) => [

			caption = "Prueba"
			onClick([|this.probarVentana])

		]

	}

	def void probarVentana() {

		this.openDialog(new VerEditarPedidoAbiertoWindow(this, this.controladorDePedidoParaPrueba))

	}

	def openDialog(Dialog<?> dialog) {
		dialog.open
	}

	Pedido unPedidoParaPrueba
	Tamanio grande
	Plato muzzaGrande
	Pizza pizzaDeMuzarella

	def ControladorPedido controladorDePedidoParaPrueba() {

		new ControladorPedido(this.pedidoParaPrueba)

	}

	def Pedido pedidoParaPrueba() {

		unPedidoParaPrueba = new Pedido()

		unPedidoParaPrueba.setAclaraciones("Ninguna")
		unPedidoParaPrueba.setCliente(new Cliente("fulano", "nickfulano", "1234", "fake@gmail.com", "calle falsa"))
		unPedidoParaPrueba.setFormaDeEnvio(new RetiroPorLocal())

		grande = new Tamanio("Grande")

		pizzaDeMuzarella = new Pizza => [nombre = "Pizza de Muzarella" precioBase = 10 ingredientes = newArrayList]

		muzzaGrande = new Plato => [pizzaBase = pizzaDeMuzarella tamañoPizza = grande ingredientesExtras = newArrayList]

		unPedidoParaPrueba.platos.add(muzzaGrande)

		unPedidoParaPrueba

	}

}
