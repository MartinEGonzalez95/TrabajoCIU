package arenaDesktop.arenaDesktop.ui

import arenaDesktop.arenaDesktop.model.ControladorPedido
import dominoPizzeria.Plato
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.*
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import dominoPizzeria.Pizza
import dominoPizzeria.Tamanio
import org.uqbar.arena.bindings.NotNullObservable

class VerEditarPedidoAbiertoWindow extends TransactionalDialog<ControladorPedido> {

	new(WindowOwner owner, ControladorPedido controladorPedidoModel) {

		super(owner, controladorPedidoModel)

	}

	override protected createFormPanel(Panel mainPanel) {

		title = "Editar pedido"

		panelEstado(mainPanel)

		panelTablaPlatos(mainPanel)

		botonesDePedido(mainPanel)

		panelAclaraciones(mainPanel)

		panelInformacionPedido(mainPanel)

		addActions(mainPanel)

	}

	def panelTablaPlatos(Panel panelPlatos) {

		new Label(panelPlatos) => [
			text = "Platos"
			alignLeft
		]

		val tablaPlatos = new Table<Plato>(panelPlatos, typeof(Plato)) => [
			items <=> "platos"
			value <=> "platoSeleccionado"
			numberVisibleRows = 2
		]
		ordenarTablaPlatos(tablaPlatos)
	}

	def panelEstado(Panel panelEstado) {
		
///// NO FUNCA
//		panelEstado.layout = new ColumnLayout(2)
//		
//		val panelIzquierdo = new Panel(panelEstado)
		
		new Label(panelEstado) => [
			text = "Estado"
			alignLeft
		]
		new TextBox(panelEstado) => [
			value <=> "pedido.estadoDePedido"
			width = 200
			alignRight
		]
	}

	protected def Button botonesDePedido(Panel panelPlatos) {

		val elementSelected = new NotNullObservable("platoSeleccionado")

		new Button(panelPlatos) => [
			caption = "Agregar"
			// onClick([|new AgregarPlatoWindow(this, new Plato)])
			bindEnabled(elementSelected)
		]

		new Button(panelPlatos) => [
			caption = "Editar"
			// onClick([|new EditarPlatoWindow(this, modelObject.platoSeleccionado)])
			bindEnabled(elementSelected)
		]

		new Button(panelPlatos) => [
			caption = "Eliminar"
			onClick [|modelObject.eliminarPlato(modelObject.platoSeleccionado)]
			bindEnabled(elementSelected)
		]

	}

	def void ordenarTablaPlatos(Table<Plato> table) {

		new Column<Plato>(table) => [
			title = "Nombre"
			bindContentsToProperty("pizzaBase").transformer = [Pizza pizzaBase|pizzaBase.nombre]
			fixedSize = 200
		]

		new Column<Plato>(table) => [
			title = "Tamaño"
			bindContentsToProperty("tamañoPizza").transformer = [Tamanio tamanio|tamanio.nombre]
			fixedSize = 100
		]

		new Column<Plato>(table) => [
			title = "Precio"
			bindContentsToProperty("precio").transformer = [double precio|"$" + precio.toString]
			fixedSize = 50
		]
	}

	def void panelAclaraciones(Panel aclaracionPanel) {

		new Label(aclaracionPanel) => [
			text = "Aclaraciones"
			alignLeft
		]

		new TextBox(aclaracionPanel) => [
			value <=> "pedido.aclaraciones"
			width = 200
			alignLeft
		]
	}

	def void panelInformacionPedido(Panel informacionPanel) {

		new Label(informacionPanel) => [
			text = "Cliente"
			alignLeft
		]
		new Label(informacionPanel) => [
			text = "Costo de envio"
			alignLeft
		]
		new Label(informacionPanel) => [
			text = "Monto total"
			alignLeft
		]
		new Label(informacionPanel) => [
			text = "Fecha"
			alignLeft
		]
	}

	override protected void addActions(Panel actionsPanel) {

///////// error doble aceptar/cancelar
	
		new Button(actionsPanel) => [
			caption = "Aceptar"
			onClick [|this.accept]
			setAsDefault
			disableOnError	
		]

		new Button(actionsPanel) => [
			caption = "Cancelar"	
			onClick [|this.cancel]	
		]
	}

}
