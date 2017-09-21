package arenaDesktop

import arenaDesktop.arenaDesktop.model.ControladorSistema
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.tables.Table
import dominoPizzeria.Pedido
import org.uqbar.arena.widgets.tables.Column
import estadosDePedido.EstadoDePedido
import java.text.SimpleDateFormat
import java.util.Date
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import dominoPizzeria.Cliente

class PedidosCerradosWindow extends SimpleWindow<ControladorSistema> {

	new(WindowOwner parent, ControladorSistema model) {
		super(parent, model)
	}

	override createContents(Panel mainPanel) {

		this.title = "Domino´s Pizza (XTend)"
		mainPanel.layout = new VerticalLayout

		new Label(mainPanel).text = "Pedidos cerrados"
		
		this.createResultsGrid(mainPanel)
		
		new Button(mainPanel) => [
			caption = "Ver"
			//onClick [|this.openDialog(new VerEditarPedidoCerradoMainWindow(this, new ControladorPedido(modelObject.pedidoSeleccionado)))]
		]
		new Button(mainPanel) => [
			caption = "Volver"
			onClick [|this.close]
		]

	}
	
	def protected createResultsGrid(Panel panel) {
		val table = new Table<Pedido>(panel, typeof(Pedido)) => [
			items <=> "pedidosCerrados"
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
			bindContentsToProperty("estadoDePedido").transformer = [EstadoDePedido estadoDePedido | estadoDePedido.toString]
		]

		new Column<Pedido>(table) => [
	
			title = "Fecha"
			fixedSize = 200
			val sdf = new SimpleDateFormat("yyyy-MM-dd")
			bindContentsToProperty("fechaDeCreacion").transformer = [Date fechaDeCreacion | sdf.format(fechaDeCreacion)]

		]
		
//		new Column<Pedido>(table) => [
//			
//			title = "Tiempo de espera"
//			fixedSize = 200
//			bindContentsToProperty("").transformer = []
//			
//		]
	}

	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}
