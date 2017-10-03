package arenaDesktop.arenaDesktop.ui

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
import java.util.concurrent.TimeUnit
import java.awt.Color
import org.uqbar.arena.windows.Dialog
import arenaDesktop.arenaDesktop.model.ControladorPedido
import org.uqbar.arena.bindings.NotNullObservable

class PedidosCerradosWindow extends SimpleWindow<ControladorSistema> {

	new(WindowOwner parent, ControladorSistema model) {
		super(parent, model)
	
	}

	override protected createFormPanel(Panel mainPanel) {
		this.iconImage = "src/main/resources/DominoLogo.png"
		this.title = "Domino´s Pizza"
		mainPanel.layout = new VerticalLayout

		new Label(mainPanel) => [
			text =  "Pedidos cerrados"
			alignLeft
			fontSize = 12
		]

		this.createResultsGrid(mainPanel)
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

			bindBackground("estadoDePedido").transformer = [ EstadoDePedido estadoDePedido |
				if(estadoDePedido.toString == "Cerrado") Color.RED else Color.GREEN
			]

		]

		new Column<Pedido>(table) => [

			title = "Fecha"
			fixedSize = 200
			val sdf = new SimpleDateFormat("yyyy/MM/dd")
			bindContentsToProperty("fechaDeCreacion").transformer = [Date fechaDeCreacion|sdf.format(fechaDeCreacion)]

		]

		new Column<Pedido>(table) => [

			title = "Tiempo de espera"
			fixedSize = 200
			bindContentsToProperty("tiempoDeEspera").transformer = [ long tiempoDeEspera |
				String.format("%02d" + " mins", TimeUnit.MILLISECONDS.toMinutes(tiempoDeEspera) -
					TimeUnit.HOURS.toMinutes(TimeUnit.MILLISECONDS.toHours(tiempoDeEspera)));
			]
		]
	}

	def openDialog(Dialog<?> dialog) {
		dialog.open
	}

	override protected addActions(Panel actionsPanel) {
		
		new Button(actionsPanel) => [
			caption = "Volver"
			onClick [|this.close]
		]
		
		val elementSelected = new NotNullObservable("pedidoSeleccionado")
		new Button(actionsPanel) => [
			caption = "Ver"
			bindEnabled(elementSelected)
			onClick [|this.openDialog(new VerPedidoWindow(this, new ControladorPedido(modelObject.pedidoSeleccionado)))]
		]

	}

}
