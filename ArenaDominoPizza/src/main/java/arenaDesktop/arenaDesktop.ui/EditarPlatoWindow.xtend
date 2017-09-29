package arenaDesktop.arenaDesktop.ui

import arenaDesktop.arenaDesktop.model.ControladorPlato
import dominoPizzeria.Ingrediente
import dominoPizzeria.Pizza
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import dominoPizzeria.Tamanio

class EditarPlatoWindow extends TransactionalDialog<ControladorPlato> {

	new(WindowOwner owner, ControladorPlato modelObject) {

		super(owner, modelObject)

	}
	
	def titulo(){
		
		title = "Editar plato"
		
	}

	override protected createFormPanel(Panel mainPanel) {

		titulo
	
		createPanelPizza(mainPanel)

		createSelectorDetamanio(mainPanel)

		new Label(mainPanel) => [

			text = "Adicionales agregados:"
			width = 100
			alignLeft

		]
		new List(mainPanel) => [
			bindItemsToProperty("ingredientesParaAgregar")

		]

		new Label(mainPanel) => [

			text = "Adicionales disponibles:"
			width = 100
			alignLeft

		]

		createPanelDeAgregados(mainPanel)

		createPanelDePrecio(mainPanel)

	}
	
	protected def void createPanelPizza(Panel mainPanel) {
		val panelPizza = new Panel(mainPanel).layout = new HorizontalLayout()

		new Label(panelPizza) => [

			text = "Pizza"
			width = 100
			alignLeft

		]

		new Selector<Pizza>(panelPizza) => [
			
			allowNull(true)
			value <=> "pizzaBase"
			items <=> "pizzas"
			
		]
	}

	protected def void createPanelDePrecio(Panel mainPanel) {
		val panelPrecio = new Panel(mainPanel)
		panelPrecio.layout = new HorizontalLayout()

		new Label(panelPrecio) => [

			text = "Precio"
			width = 100
			alignLeft

		]

		new Label(panelPrecio) => [

			value <=> "precio"
		]
	}

	protected def void createPanelDeAgregados(Panel mainPanel) {
		val panelDeAgregados = new Panel(mainPanel).layout = new VerticalLayout()

		val tablaDeAgregados = new Table<Ingrediente>(panelDeAgregados, typeof(Ingrediente)) => [
			value <=> "ingredienteSeleccionado"
			items <=> "ingredientes"
			numberVisibleRows = 4
		]

		agregarQuitarAdicional(mainPanel)

		creacionTablaDeAgregados(tablaDeAgregados)

		new Label(panelDeAgregados) => [

			text = "Distribucion:"
			alignLeft

		]

		new Selector<Ingrediente>(panelDeAgregados) => [
			value <=> "ingredienteSeleccionado.distribucion"
			items <=> "distribuciones"
		]
	}

	protected def void createSelectorDetamanio(Panel mainPanel) {
		val panelTamaño = new Panel(mainPanel).layout = new HorizontalLayout()

		new Label(panelTamaño) => [

			text = "Tamaño"
			width = 100
			alignLeft

		]

		new Selector<Tamanio>(panelTamaño) => [
			allowNull(true)
			value <=> "tamanio"
			items <=> "tamaños"

		]
	}

	def String precioPlato() {

		"$".concat(modelObject.precio.toString)

	}

	private def void agregarQuitarAdicional(Panel panelDeIngredientes) {

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

	private def  agregarAdicional() {
		modelObject.agregarIngrediente()
	}

	private def  quitarAdicional() {
		modelObject.quitarIngrediente()
	}

	private def void creacionTablaDeAgregados(Table<Ingrediente> tablaDeAgregados) {

		new Column<Ingrediente>(tablaDeAgregados) => [
			title = "Nombre"
			fixedSize = 200
			bindContentsToProperty("nombre")
		]

		new Column<Ingrediente>(tablaDeAgregados) => [
			title = "Precio"
			fixedSize = 100
			bindContentsToProperty("precio")
		]

		new Column<Ingrediente>(tablaDeAgregados) => [
			title = "Distribucion"
			fixedSize = 100
			bindContentsToProperty("distribucion")
		]

	}

	override protected void addActions(Panel actions) {

		new Button(actions) => [
			caption = "Aceptar"
			onClick [|this.aceptar]

		]

		new Button(actions) => [
			caption = "Cancelar"
			onClick [|this.cancel]
			setAsDefault
		]

	}
	

	def aceptar() {

			this.accept
			
	}
}
