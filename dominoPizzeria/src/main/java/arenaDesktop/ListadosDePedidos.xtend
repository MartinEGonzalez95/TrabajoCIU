package arenaDesktop

import dominoPizzeria.Cliente
import dominoPizzeria.Pedido
import dominoPizzeria.Sistema
import estadosDePedido.EstadoDePedido
import org.uqbar.arena.bindings.DateTransformer
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.HorizontalLayout
import java.util.Date

class ListadosDePedidos extends SimpleWindow<ControladorSistema> {
	
	new(WindowOwner parent) {
		super(parent, new ControladorSistema)
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
			bindContentsToProperty("estadoDePedido").transformer = [EstadoDePedido estadoDePedido | ]
		]
		
		
		new Column<Pedido>(table) => [
			title = "Monto"
			fixedSize = 200
			bindContentsToProperty("montoFinal")
		]

		new Column<Pedido>(table) => [
	
			title = "Hora"
			fixedSize = 200
			//bindContentsToProperty("fechaDeCreacion").transformer = new DateTransformer
			bindContentsToProperty("fechaDeCreacion").transformer = [Date fechaDeCreacion | fechaDeCreacion.toString]
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
			//onClick [|this.openDialog(new MenuWindow(this))]
		]

		new Button(panelIzquierdo) => [
			caption = "Pedidos Cerrados"
			//onClick [|this.openDialog(new PedidosCerradosWindow(this))]
		]

		val panelDeOpcionsDePedido = new Panel(mainPanel)

	
		botonesDePedido(panelDeOpcionsDePedido)

	}
	
	protected def Button botonesDePedido(Panel panelDeOpcionsDePedido) {
		
		val elementSelected = new NotNullObservable("pedidoSeleccionado")
		
		val actionsPanel = new Panel(panelDeOpcionsDePedido).layout = new HorizontalLayout
		
		new Button(panelDeOpcionsDePedido) => [
			caption = "<<<<"
			onClick [|this.modelObject.pedidoSeleccionado.retroceder]
		]
		new Button(panelDeOpcionsDePedido) => [
			caption = ">>>>"
			onClick [|this.modelObject.pedidoSeleccionado.avanzar]
		]
		new Button(panelDeOpcionsDePedido) => [
			caption = "Cancelar"
			onClick [|this.modelObject.pedidoSeleccionado.cancelar]
		]
		new Button(panelDeOpcionsDePedido) => [
			caption = "Editar"
			//onClick [|this.openDialog(new VerEditarPedidoAbiertoWindow(this, new ControladorPedido(modelObject.pedidoSeleccionado)))]
		]
		new Button(panelDeOpcionsDePedido) => [
			caption = "Salir"
			onClick [|]
		]
	}
	
	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
//	override protected addActions(Panel actionsPanel) {
//		throw new UnsupportedOperationException("TODO: auto-generated method stub")
//	}
//	
//	override protected createFormPanel(Panel mainPanel) {
//		throw new UnsupportedOperationException("TODO: auto-generated method stub")
//	}

}
