package arenaDesktop.arenaDesktop.ui

import arenaDesktop.arenaDesktop.model.ControladorPizzaAdicionales
import arenaDesktop.arenaDesktop.model.FiltroSoloDeLetras
import dominoPizzeria.Ingrediente
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.NumericField
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.WindowOwner
import repositorios.RepoPizza

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class EditarPromoDialogT extends TransactionalDialog<ControladorPizzaAdicionales> {

	new(WindowOwner owner, ControladorPizzaAdicionales controladorDePizzaEIngredientes) {
		super(owner, controladorDePizzaEIngredientes)
	}

	def titulo(){
		
		title = "Editar Promocion"
		
	}

	def getRepoPizza() {

		RepoPizza.getRepo
	}

	override executeTask() {
		modelObject.pizzaSeleccionada.ingredientes = modelObject.ingredientesParaAgregar

		getRepoPizza.modificar(modelObject.pizzaSeleccionada)

		super.executeTask()
	}

	override protected createFormPanel(Panel mainPanel) {

		titulo

		this.crearPanelDePizzas(mainPanel)
		this.crearPanelDeIngredientes(mainPanel)

	}

	private def void crearPanelDeIngredientes(Panel mainPanel) {

		val panelDeIngredientes = new Panel(mainPanel)
		
		new Label(panelDeIngredientes) => [

			text = "Adicionales agregados:"
			width = 100
			alignLeft

		]

		new List(panelDeIngredientes) => [
			bindItemsToProperty("ingredientesParaAgregar")
		]
		
		new Label(panelDeIngredientes) => [

			text = "Adicionales disponibles:"
			width = 100
			alignLeft

		]
		creacionTablaDeIngredientes(panelDeIngredientes)

		crearPanelDeDistribuciones(mainPanel, panelDeIngredientes)

		accionesDelPanelIngredientes(panelDeIngredientes)

	}

	protected def void crearPanelDeDistribuciones(Panel mainPanel, Panel panelDeIngredientes) {
		val panelDistribuciones = new Panel(mainPanel).layout = new HorizontalLayout
		new Label(panelDistribuciones) => [
			text = "Distribuciones:   "
			alignLeft
		]

		new Selector<Ingrediente>(panelDistribuciones) => [
			value <=> "ingredienteSeleccionado.distribucion"
			items <=> "distribuciones"
		]
	}

	private def void creacionTablaDeIngredientes(Panel panel) {

		val tablaDeIngredientes = new Table<Ingrediente>(panel, typeof(Ingrediente)) => [
			items <=> "ingredientes"
			value <=> "ingredienteSeleccionado"
			numberVisibleRows = 8
		]

		new Column<Ingrediente>(tablaDeIngredientes) => [
			title = "Nombre"
			fixedSize = 100
			bindContentsToProperty("nombre")
		]

		new Column<Ingrediente>(tablaDeIngredientes) => [
			title = "Distribucion"
			fixedSize = 100
			bindContentsToProperty("distribucion")
		]

	}

	private def void accionesDelPanelIngredientes(Panel panelDeIngredientes) {

		val elementSelected = new NotNullObservable("ingredienteSeleccionado")

		val actionsPanel = new Panel(panelDeIngredientes).layout = new HorizontalLayout

		new Button(actionsPanel) => [
			caption = "Agregar Adicional"
			onClick [|agregarAdicional()]
			bindEnabled(elementSelected)
		]

		new Button(actionsPanel) => [
			caption = "Quitar Adicional"
			onClick [|quitarAdicional()]
			bindEnabled(elementSelected)
		]
	}

	private def boolean agregarAdicional() {
		modelObject.agregarIngrediente()
	}

	private def boolean quitarAdicional() {
		modelObject.quitarIngrediente()
	}

	protected def void crearPanelDePizzas(Panel mainPanel) {

		val panelDePizzas = new Panel(mainPanel)
		panelDePizzas.layout = new ColumnLayout(2)

		val panelIzquierdo = new Panel(panelDePizzas)

		new Label(panelIzquierdo).text = "Nombre"
		new Label(panelIzquierdo).text = "Precio Base"

		val panelDerecho = new Panel(panelDePizzas)
		new TextBox(panelDerecho).withFilter(new FiltroSoloDeLetras) => [
			value <=> "pizzaSeleccionada.nombre"
		]
		new NumericField(panelDerecho) => [
			value <=> "pizzaSeleccionada.precioBase"

		]

	}

	override protected void addActions(Panel actions) {

		new Button(actions) => [
			caption = "Aceptar"
			onClick [|this.aceptar]
			disableOnError
			setAsDefault
		]

		new Button(actions) => [
			caption = "Cancelar"
			onClick [|this.cancel]

		]

	}

	def void aceptar() {

		if (modelObject.pizzaTerminada) {
			this.accept
			
		} else {
			super.showInfo("No dejes la pizza vacía che!")
		}
	}


}
