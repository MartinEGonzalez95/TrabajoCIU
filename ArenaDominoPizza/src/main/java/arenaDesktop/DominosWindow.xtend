package arenaDesktop

import dominoPizzeria.Cliente
import dominoPizzeria.Pedido
import estadosDePedido.EstadoDePedido
import org.uqbar.arena.bindings.DateTransformer
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.HorizontalLayout
import java.util.Date
import arenaDesktop.arenaDesktop.model.ControladorSistema
import org.uqbar.arena.windows.Dialog

import arenaDesktop.arenaDesktop.ui.MenuWindow
import arenaDesktop.arenaDesktop.model.ControladorMenu

class DominosWindow extends SimpleWindow<ControladorSistema> {

	new(WindowOwner parent) {

		super(parent, new ControladorSistema)
		this.modelObject.setPedidoParaPrueba
	}

	def protected createResultsGrid(Panel panelDeOpcionsDePedido) {
		val table = new Table<Pedido>(panelDeOpcionsDePedido, typeof(Pedido)) => [
			items <=> "pedidos"
			value <=> "pedidoSeleccionado"
			numberVisibleRows = 8
		]
		this.describeResultsGrid(table)
	}

	def void describeResultsGrid(Table<Pedido> table) {

		new Column<Pedido>(table) => [
			title = "Pedido de"
			fixedSize = 200
			bindContentsToProperty("cliente").transformer = [Cliente cliente|cliente.nombre]
		]

		new Column<Pedido>(table) => [
			title = "Estado"
			fixedSize = 200
			bindContentsToProperty("estadoDePedido").transformer = [EstadoDePedido estadoDePedido |
				estadoDePedido.toString
			]
		]

		new Column<Pedido>(table) => [
			title = "Monto"
			fixedSize = 200
			bindContentsToProperty("montoFinal")
		]

		new Column<Pedido>(table) => [

			title = "Hora"
			fixedSize = 200
			// bindContentsToProperty("fechaDeCreacion").transformer = new DateTransformer
			bindContentsToProperty("fechaDeCreacion").transformer = [Date fechaDeCreacion|fechaDeCreacion.toString]
		]
	}

	override createContents(Panel mainPanel) {

		this.title = "Domino's Pizzeria (XTend)"

		mainPanel.layout = new ColumnLayout(2)

		val panelIzquierdo = new Panel(mainPanel)

		new Label(panelIzquierdo).text = "Pedidos abiertos"

		this.createResultsGrid(panelIzquierdo)

		new Button(panelIzquierdo) => [
			caption = "Menu"
			onClick [|(new MenuWindow(this, new ControladorMenu())).open]
		]

		new Button(panelIzquierdo) => [
			caption = "Pedidos Cerrados"
		// onClick [|this.openDialog(new PedidosCerradosWindow(this))]
		]

		val panelDeOpcionsDePedido = new Panel(mainPanel)

		botonesDePedido(panelDeOpcionsDePedido)

	}

	def intentarAvanzar() {

		try {
			this.modelObject.pedidoSeleccionado.avanzar
		} catch (Exception e) {
			taskDescription = "No se puede avanzar"
		}

	}

	protected def Button botonesDePedido(Panel panelDeOpcionsDePedido) {

		val elementSelected = new NotNullObservable("pedidoSeleccionado")

		val actionsPanel = new Panel(panelDeOpcionsDePedido).layout = new HorizontalLayout

		new Button(panelDeOpcionsDePedido) => [
			caption = "<<<<"
			onClick [|this.modelObject.pedidoSeleccionado.retroceder]
			bindEnabled(elementSelected)
		]
		new Button(panelDeOpcionsDePedido) => [
			caption = ">>>>"
			onClick [|this.intentarAvanzar]
			bindEnabled(elementSelected)
		]
		new Button(panelDeOpcionsDePedido) => [
			caption = "Cancelar"
			onClick [|this.modelObject.pedidoSeleccionado.cancelar]
			bindEnabled(elementSelected)
		]
		new Button(panelDeOpcionsDePedido) => [
			caption = "Editar"
			// onClick [|this.openDialog(new VerEditarPedidoMainWindow(this, new ControladorPedido(modelObject.pedidoSeleccionado)))]
			bindEnabled(elementSelected)
		]
		new Button(panelDeOpcionsDePedido) => [
			caption = "Salir"
			onClick [|this.close]
		]
	}

	def openDialog(Dialog<?> dialog) {
		dialog.open
	}

	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}
