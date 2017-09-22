package arenaDesktop.arenaDesktop.ui

import arenaDesktop.arenaDesktop.model.ControladorPizzaAdicionales
import dominoPizzeria.Ingrediente
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.NumericField
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.windows.ErrorsPanel
import org.uqbar.arena.widgets.Selector

class EditarPromoVentana extends TransactionalDialog<ControladorPizzaAdicionales> {

	new(WindowOwner owner, ControladorPizzaAdicionales controladorDePizzaEIngredientes) {
		super(owner, controladorDePizzaEIngredientes)
		this.title = "Editar Promocion"

	}

//	override ErrorsPanel createErrorsPanel(Panel mainPanel) {
//		return new ErrorsPanel(mainPanel, "Listo para modificar la pizza", 2);
//	}
	override protected createFormPanel(Panel mainPanel) {

		this.crearPanelDePizzas(mainPanel)
		this.crearPanelDeIngredientes(mainPanel)
	

	}

	private def void crearPanelDeIngredientes(Panel mainPanel) {

		val panelDeIngredientes = new Panel(mainPanel)

		val tablaDeIngredientes = new Table<Ingrediente>(panelDeIngredientes, typeof(Ingrediente)) => [
			items <=> "ingredientes"
			value <=> "ingredienteSeleccionado"
		]

		creacionTablaDeIngredientes(tablaDeIngredientes)
		new Selector<Ingrediente>(panelDeIngredientes) => [
//			allowNull(false)
			value <=> "ingredienteSeleccionado.distribucion"
			items <=> "distribuciones"
			
		]

		accionesDelPanelIngredientes(panelDeIngredientes)

	}

	private def void creacionTablaDeIngredientes(Table<Ingrediente> tablaDeIngredientes) {
		new Column<Ingrediente>(tablaDeIngredientes) => [
			title = "Nombre"
			fixedSize = 100
			bindContentsToProperty("nombre")
		]

		// a ver si bindea 
		new Column<Ingrediente>(tablaDeIngredientes) => [
			title = "distribucion"
			fixedSize = 100
			bindContentsToProperty("distribucion")
		]

	}

	private def void accionesDelPanelIngredientes(Panel panelDeIngredientes) {
		// Deshabilitar los botones si no hay ningún elemento seleccionado en la grilla.
		val elementSelected = new NotNullObservable("ingredienteSeleccionado")

		val actionsPanel = new Panel(panelDeIngredientes).layout = new HorizontalLayout

		// boton para agregar el adicional seleccionado a la pizza
		new Button(actionsPanel) => [
			caption = "Agregar Adicional"
			onClick [|modelObject.agregarIngrediente(modelObject.ingredienteSeleccionado)]
			bindEnabled(elementSelected)
		]

		// boton para quitar el adicional seleccionado a la pizza
		new Button(actionsPanel) => [
			caption = "Quitar Adicional"
			onClick [|modelObject.quitarIngrediente(modelObject.ingredienteSeleccionado)]
			bindEnabled(elementSelected)
		]
	}

	protected def void crearPanelDePizzas(Panel mainPanel) {

		val panelDePizzas = new Panel(mainPanel)
		panelDePizzas.layout = new ColumnLayout(2)

		val panelIzquierdo = new Panel(panelDePizzas)

		new Label(panelIzquierdo).text = "Nombre"
		new Label(panelIzquierdo).text = "Precio"

		val panelDerecho = new Panel(panelDePizzas)
		new TextBox(panelDerecho) => [
			value <=> "pizzaSeleccionada.nombre"

		]

		new NumericField(panelDerecho) => [
			value <=> "pizzaSeleccionada.precio"

		]

	}

	override protected void addActions(Panel actions) {
		new Button(actions) => [
			caption = "Aceptar"
			onClick [|this.accept]

		]

		new Button(actions) => [
			caption = "Cancelar"
			onClick [|this.cancel]
			setAsDefault
		]
	}

}
