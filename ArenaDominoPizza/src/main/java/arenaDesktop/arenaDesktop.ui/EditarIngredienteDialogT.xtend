package arenaDesktop.arenaDesktop.ui

import dominoPizzeria.Ingrediente
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.NumericField

import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.windows.WindowOwner


class EditarIngredienteDialogT extends TransactionalDialog<Ingrediente> {

	new(WindowOwner laVentanaMenu, Ingrediente ingredienteSeleccionado) {
		super(laVentanaMenu, ingredienteSeleccionado)
	}

	override createFormPanel(Panel mainPanel) {

//		mainPanel.layout = new ColumnLayout(2)

		this.title = "Editar Ingrediente"

		val panelIzquierdo = new Panel(mainPanel)

		new Label(panelIzquierdo).text = "Nombre"
		new Label(panelIzquierdo).text = "Precio"

		val panelDerecho = new Panel(mainPanel)

		new TextBox(panelDerecho) => [
			value <=> "nombre"

		]

		new NumericField(panelDerecho) => [
			value <=> "precio"
		]
	}

	override protected void addActions(Panel actions) {
		new Button(actions) => [
			caption = "Aceptar"
			onClick [|this.aceptar]
			setAsDefault

		]

		new Button(actions) => [
			caption = "Cancelar"
			onClick [|this.cancel]
		]
	}
	
	def aceptar() {
		
		
		this.accept
	}

}
