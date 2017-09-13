package arenaDesktop

import org.uqbar.arena.windows.MainWindow
import dominoPizzeria.Sistema
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import dominoPizzeria.Pedido
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import dominoPizzeria.Cliente
import estadosDePedido.EstadoDePedido
import org.uqbar.arena.bindings.DateTransformer
import org.uqbar.arena.widgets.Button

class ListadosDePedidos extends MainWindow<Sistema> {
	new() {
		super(new Sistema)
	}

	override createContents(Panel mainPanel) {

		this.title = "Domino's Pizzeria (XTend)"

		mainPanel.layout = new ColumnLayout(2)

		val panelIzquierdo = new Panel(mainPanel)

		new Label(panelIzquierdo).text = "Pedido abiertos"

		val table = new Table<Pedido>(panelIzquierdo, typeof(Pedido)) => [
			items <=> "pedidos"
			value <=> "celularSeleccionado"
		]

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
			bindContentsToProperty("getMontoPedido").transformer = [Pedido pedido|pedido.getMontoFinal]
		]

		new Column<Pedido>(table) => [
	
			title = "Hora"
			fixedSize = 200
			bindContentsToProperty("fechaDeCreacion").transformer = new DateTransformer
			
		]

		new Button(panelIzquierdo) => [
			caption = "Menu"
			onClick [|this.modelObject.]
		]

		new Button(panelIzquierdo) => [
			caption = "Pedidos Cerrados"
			onClick [|this.modelObject.]
		]

		val panelDerecho = new Panel(mainPanel)

		new Button(panelDerecho) => [
			caption = "<<<<"
			onClick [|this.modelObject.]
		]
		new Button(panelDerecho) => [
			caption = ">>>>"
			onClick [|this.modelObject.]
		]
		new Button(panelDerecho) => [
			caption = "Cancelar"
			onClick [|this.modelObject.]
		]
		new Button(panelDerecho) => [
			caption = "Ediar"
			onClick [|this.modelObject.]
		]
		new Button(panelDerecho) => [
			caption = "Salir"
			onClick [|this.modelObject.]
		]

	}

	def static main(String[] args) {
		new ListadosDePedidos().startApplication
	}

}
