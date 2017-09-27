package arenaDesktop.arenaDesktop.ui

import arenaDesktop.arenaDesktop.model.ControladorPedido
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import arenaDesktop.arenaDesktop.model.ControladorPlato
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.layout.HorizontalLayout

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
			onClick([openDialog(new AgregarPlatoWindow(this, this.modelObject.pedido))])
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

	override protected void addActions(Panel actionsPanel) {

		new Button(actionsPanel) => [
			caption = "Aceptar"
			onClick [|this.accept]
		]
		new Button(actionsPanel) => [
			caption = "Cerrar"
			onClick [|this.close]
		]
	}
}
