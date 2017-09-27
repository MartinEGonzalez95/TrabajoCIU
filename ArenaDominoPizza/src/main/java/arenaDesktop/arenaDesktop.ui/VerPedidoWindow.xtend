package arenaDesktop.arenaDesktop.ui

import arenaDesktop.arenaDesktop.model.ControladorPedido
import dominoPizzeria.Pizza
import dominoPizzeria.Plato
import dominoPizzeria.Tamanio
import java.text.SimpleDateFormat
import java.util.concurrent.TimeUnit
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.*
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.WindowOwner
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class VerPedidoWindow extends TransactionalDialog<ControladorPedido> {

	new(WindowOwner owner, ControladorPedido controladorPedidoModel) {

		super(owner, controladorPedidoModel)
		title = "Ver Pedido"

	}

	override protected createFormPanel(Panel mainPanel) {

		panelEstado(mainPanel)

		new Label(mainPanel) => [
			text = "Platos"
			alignLeft
		]

		panelTablaPlatos(mainPanel)

		panelAclaraciones(mainPanel)

		panelInformacionPedido(mainPanel)

	}

	def panelTablaPlatos(Panel mainPanel) {

		val panelPlatos = new Panel(mainPanel).layout = new HorizontalLayout

		val tablaPlatos = new Table<Plato>(panelPlatos, typeof(Plato)) => [
			items <=> "pedido.platos"
			value <=> "platoSeleccionado"
			numberVisibleRows = 4
		]
		ordenarTablaPlatos(tablaPlatos)
	}

	def panelEstado(Panel panelEstado) {

		val panel = new Panel(panelEstado)

		panel.layout = new ColumnLayout(2)

		val panelIzq = new Panel(panel)

		new Label(panelIzq) => [
			text = "Estado: "
		]

		val panelDer = new Panel(panel)

		new Label(panelDer) => [
			value <=> "pedido.estadoDePedido"
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

		val panelInfo = new Panel(informacionPanel)

		panelInfo.layout = new ColumnLayout(2)

		new Label(panelInfo) => [
			text = "Cliente"
			alignLeft
		]
		new Label(panelInfo) => [
			value <=> "pedido.cliente.nombre"
			alignLeft
		]

		new Label(panelInfo) => [
			text = "Costo de envio"
			alignLeft
		]
		new Label(panelInfo) => [
			value <=> "pedido.formaDeEnvio.costo"
			alignLeft
		]

		new Label(panelInfo) => [
			text = "Monto total"
			alignLeft
		]
		new Label(panelInfo) => [
			text = this.montoFinalToString()
			alignLeft
		]

		new Label(panelInfo) => [
			text = "Fecha"
			alignLeft
		]
		new Label(panelInfo) => [
			text = this.fechaCreacionPedido()
			alignLeft
		]
	}

	def montoFinalToString() {
		"$" + modelObject.pedido.montoFinal.toString
	}

	def fechaCreacionPedido() {

		val fechaDeCreacion = modelObject.pedido.fechaDeCreacion

		val hora = fechaDeCreacion.hours

		val min = fechaDeCreacion.minutes

		val sdf = new SimpleDateFormat("yyyy/MM/dd - ")

		sdf.format(fechaDeCreacion) + hora + "." + min

	}

	override protected void addActions(Panel actionsPanel) {

		new Button(actionsPanel) => [
			caption = "Salir"
			onClick [|this.close]
		]
	}

}
