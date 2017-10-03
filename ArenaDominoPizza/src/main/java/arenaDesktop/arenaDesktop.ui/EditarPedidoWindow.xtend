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
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.TextBox
import dominoPizzeria.Plato

class EditarPedidoWindow extends VerPedidoWindow {

	new(WindowOwner owner, ControladorPedido controladorPedidoModel) {

		super(owner, controladorPedidoModel)

	}

	override titulo() {

		title = "Editar pedido"

	}

	override panelAclaraciones(Panel aclaracionPanel) {

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

	override protected createFormPanel(Panel mainPanel) {

		titulo

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
			onClick([new AgregarPlatoWindow(this, new ControladorPlato(new Plato, modelObject.pedido)).open
					 modelObject.agregarPlato()
					])
		]

		new Button(panelBotones) => [
			caption = "Editar"
			onClick([new EditarPlatoWindow(this, new ControladorPlato(modelObject.platoSeleccionado)).open
					 modelObject.editarPlato(modelObject.platoSeleccionado)
					])
			bindEnabled(elementSelected)
		]

		new Button(panelBotones) => [
			caption = "Eliminar"
			onClick [|modelObject.eliminarPlato()]
			bindEnabled(elementSelected)
		]

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
