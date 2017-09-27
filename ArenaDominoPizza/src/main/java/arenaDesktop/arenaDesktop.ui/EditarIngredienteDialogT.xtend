package arenaDesktop.arenaDesktop.ui

import dominoPizzeria.Ingrediente
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.NumericField

import org.uqbar.arena.widgets.Button

import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.windows.WindowOwner
import repositorios.RepoIngrediente
import arenaDesktop.arenaDesktop.model.FiltroSoloDeLetras

class EditarIngredienteDialogT extends TransactionalDialog<Ingrediente> {

	new(WindowOwner laVentanaMenu, Ingrediente ingredienteSeleccionado) {
		super(laVentanaMenu, ingredienteSeleccionado)
	}

	override createFormPanel(Panel mainPanel) {

		this.title = "Editar Ingrediente"

		val panelIzquierdo = new Panel(mainPanel)

		new Label(panelIzquierdo).text = "Nombre"
		new Label(panelIzquierdo).text = "Precio"

		val panelDerecho = new Panel(mainPanel)

		new TextBox(panelDerecho).withFilter(new FiltroSoloDeLetras) => [

			value <=> "nombre"
		]
		new NumericField(panelDerecho) => [
			value <=> "precio"

		]
	}

	def getRepoIngredientes() {

		RepoIngrediente.getRepo
	}

	override executeTask() {
		getRepoIngredientes.modificar(modelObject)

		super.executeTask()
	}

	override protected void addActions(Panel actions) {
		new Button(actions) => [
			caption = "Aceptar"
			onClick [|this.aceptar]

			disableOnError
		]

		new Button(actions) => [
			caption = "Cancelar"
			onClick [|this.cancel]
		]
	}

	def void aceptar() {

		if (!this.ingredienteSinTerminar) {
			this.accept
		} else {
			super.showInfo("¡No dejes el ingrediente vacío che!")
		}
	}

	def ingredienteSinTerminar() {

		modelObject.nombre.nullOrEmpty
	}

}
