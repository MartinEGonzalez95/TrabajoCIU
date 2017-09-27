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
import arenaDesktop.arenaDesktop.model.ControladorPlato
import org.uqbar.arena.windows.Dialog

class EditarPedidoWindow extends VerPedidoWindow {

	new(WindowOwner owner, ControladorPedido controladorPedidoModel) {

		super(owner, controladorPedidoModel)

	}

	override protected createFormPanel(Panel mainPanel) {

		title = "Editar pedido"

		panelEstado(mainPanel)

		new Label(mainPanel) => [
			text = "Platos"
			alignLeft
		]

		val panelPlatos = new Panel(mainPanel)

		panelPlatos.layout = new HorizontalLayout

		panelTablaPlatos(panelPlatos)

		botonesDePedido(panelPlatos)

		panelAclaraciones(mainPanel)

		panelInformacionPedido(mainPanel)

	}

	protected def Button botonesDePedido(Panel panelPlatos) {

		val panelBotones = new Panel(panelPlatos)

		val elementSelected = new NotNullObservable("platoSeleccionado")

		new Button(panelBotones) => [
			caption = "Agregar"
			onClick([|new AgregarPlatoWindow(this, this.modelObject.pedido).open])

		]

		new Button(panelBotones) => [
			caption = "Editar"
			onClick([openDialog(new EditarPlatoWindow(this, new ControladorPlato(modelObject.platoSeleccionado)))])
			bindEnabled(elementSelected)
		]

		new Button(panelBotones) => [
			caption = "Eliminar"
			onClick [|modelObject.pedido.eliminarPlato(modelObject.platoSeleccionado)]
			bindEnabled(elementSelected)
		]

	}

	def openDialog(Dialog<?> dialog) {

		dialog.open
	}

}
