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
import org.uqbar.arena.layout.ColumnLayout

class EditarIngredienteDialogT extends TransactionalDialog<Ingrediente> {

	new(WindowOwner laVentanaMenu, Ingrediente ingredienteSeleccionado) {
		super(laVentanaMenu, ingredienteSeleccionado)
	}

	def titulo(){
		
		title = "Editar ingrediente"
		
	}

	override createFormPanel(Panel mainPanel) {

		titulo

		val panel = new Panel(mainPanel).layout = new ColumnLayout(2)

		new Label(panel).text = "Nombre"

		new TextBox(panel).withFilter(new FiltroSoloDeLetras) => [
			value <=> "nombre"
		]

		new Label(panel).text = "Precio"

		new NumericField(panel) => [
			value <=> "precio"
		]
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

	def getRepoIngredientes() {

		RepoIngrediente.getRepo
	}

	override executeTask() {
		repoIngredientes.modificar(modelObject)
		super.executeTask()
	}

	def void aceptar() {

		if (modelObject.completo) {
			this.accept
		} else {
			super.showInfo("¡No dejes el ingrediente vacío che!")
		}
	}


}
