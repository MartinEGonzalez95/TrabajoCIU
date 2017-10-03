package arenaDesktop.arenaDesktop.app

import arenaDesktop.arenaDesktop.model.ControladorPedido
import arenaDesktop.arenaDesktop.model.ControladorSistema
import arenaDesktop.arenaDesktop.ui.EditarPedidoWindow
import arenaDesktop.arenaDesktop.ui.MenuWindow
import arenaDesktop.arenaDesktop.ui.PedidosCerradosWindow

import dominoPizzeria.Pedido
import estadosDePedido.EstadoDePedido

import java.text.SimpleDateFormat
import java.util.Date

import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class DominosWindow extends SimpleWindow<ControladorSistema> {

	new(WindowOwner parent) {
		super(parent, new ControladorSistema)
		this.modelObject.cargar
	}

	override protected createFormPanel(Panel mainPanel) {
	this.iconImage = "src/main/resources/DominoLogo.png"
		this.title = "Domino's Pizzeria"

		new Label(mainPanel) => [
			text = "Pedidos abiertos"
			alignLeft
			fontSize = 12
		]
		val panelPedidos = new Panel(mainPanel).layout = new HorizontalLayout

		this.crearTablaDePedidos(panelPedidos)

		botonesDePedido(panelPedidos)
	}

	def protected crearTablaDePedidos(Panel panel) {

		val table = new Table<Pedido>(panel, typeof(Pedido)) => [
			items <=> "pedidosAbiertos"
			value <=> "pedidoSeleccionado"
			numberVisibleRows = 8
		]
		this.crearColumnasDeTablaPedidos(table)
	}

	def void crearColumnasDeTablaPedidos(Table<Pedido> table) {

		new Column<Pedido>(table) => [
			title = "Pedido"
			fixedSize = 200
			bindContentsToProperty("numero").transformer = [Integer numero|"Pedido " + numero]
		]

		new Column<Pedido>(table) => [
			title = "Estado"
			fixedSize = 200
			bindContentsToProperty("estadoDePedido").transformer = [ EstadoDePedido estadoDePedido |
				estadoDePedido.toString
			]
		]

		new Column<Pedido>(table) => [
			title = "Monto"
			fixedSize = 200
			bindContentsToProperty("montoFinal").transformer = [double montoFinal|"$" + montoFinal.toString]
		]

		new Column<Pedido>(table) => [

			title = "Hora"
			fixedSize = 200
			val sdf = new SimpleDateFormat("HH:mm:ss")
			bindContentsToProperty("fechaDeCreacion").transformer = [Date fechaDeCreacion|sdf.format(fechaDeCreacion)]

		]
	}

	protected def Button botonesDePedido(Panel mainPanel) {
		val elementSelected = new NotNullObservable("pedidoSeleccionado")

		val panelDeOpcionesDePedido = new Panel(mainPanel).layout = new VerticalLayout

		new Button(panelDeOpcionesDePedido) => [
			caption = "<<<<"
			onClick [|modelObject.retroceder]
			bindEnabled(elementSelected)
		]
		new Button(panelDeOpcionesDePedido) => [
			caption = ">>>>"
			onClick [|modelObject.avanzar]
			bindEnabled(elementSelected)
		]

		new Button(panelDeOpcionesDePedido) => [
			caption = "Cancelar"
			onClick [|modelObject.cancelar]
			bindEnabled(elementSelected)
		]
		new Button(panelDeOpcionesDePedido) => [
			caption = "Editar"
			onClick [|
				this.openDialog(new EditarPedidoWindow(this, new ControladorPedido(modelObject.pedidoSeleccionado)))
			]
			bindEnabled(elementSelected)
		]

	}

	def openDialog(Dialog<?> dialog) {
		dialog.onAccept([|modelObject.cargar])
		dialog.open
		modelObject.pedidoSeleccionado = null 
	}

	override protected addActions(Panel actionsPanel) {

		new Button(actionsPanel) => [
			caption = "Menu"
			onClick [|abrirMenu()]
		]

		new Button(actionsPanel) => [
			caption = "Pedidos Cerrados"
			onClick [|
				modelObject.pedidoSeleccionado = null
				new PedidosCerradosWindow(this, modelObject).open
			]
		]
		new Button(actionsPanel) => [
			caption = "Salir"
			onClick [|this.close]
		]

	}

	protected def void abrirMenu() {
		new MenuWindow(this).open
	}

}
