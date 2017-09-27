package arenaDesktop.arenaDesktop.ui

import arenaDesktop.arenaDesktop.model.ControladorPlato

import dominoPizzeria.Ingrediente
import dominoPizzeria.Pizza


import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.List
import repositorios.RepoPizza

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.bindings.NotNullObservable

class EditarPlatoWindow extends TransactionalDialog<ControladorPlato> {

	new(WindowOwner owner, ControladorPlato modelObject) {

		super(owner, modelObject)
		title = "Editar plato"

	}

	override protected createFormPanel(Panel mainPanel) {

		val panelPizza = new Panel(mainPanel)
		panelPizza.layout = new HorizontalLayout()

		new Label(panelPizza) => [

			text = "Pizza"
			width = 100
			alignLeft

		]

		new Selector<Pizza>(panelPizza) => [
			allowNull(false)
			value <=> "platoSeleccionado.pizzaBase"
			items <=> "pizzas"

		]

		val panelTamaño = new Panel(mainPanel)
		panelTamaño.layout = new HorizontalLayout()

		new Label(panelTamaño) => [

			text = "Tamaño"
			width = 100
			alignLeft

		]

		new Selector<Pizza>(panelTamaño) => [
			allowNull(false)
			value <=> "platoSeleccionado.tamañoPizza"
			items <=> "tamaños"

		]

		new List(mainPanel) => [
			bindItemsToProperty("platoSeleccionado.ingredientesExtras")
		]
		
		agregarQuitarAdicional(mainPanel)

		new Label(mainPanel) => [

			text = "Agregados"
			width = 100
			alignLeft

		]

		val panelDeAgregados = new Panel(mainPanel)
		panelDeAgregados.layout = new VerticalLayout()

		val tablaDeAgregados = new Table<Ingrediente>(panelDeAgregados, typeof(Ingrediente)) => [
			value <=> "ingredienteSeleccionado"
			items <=> "ingredientes"
			numberVisibleRows = 4
		]

		creacionTablaDeAgregados(tablaDeAgregados)

		new Label(panelDeAgregados) => [

			text = "Distribucion:"
			alignLeft

		]

		new Selector<Ingrediente>(panelDeAgregados) => [
			value <=> "ingredienteSeleccionado.distribucion"
			items <=> "distribuciones"
		]

		val panelPrecio = new Panel(mainPanel)
		panelPrecio.layout = new HorizontalLayout()

		new Label(panelPrecio) => [

			text = "Precio"
			width = 100
			alignLeft

		]

		new Label(panelPrecio) => [

			text = precioPlato

		]

	}

	def String precioPlato() {

		"$".concat(modelObject.precio.toString)

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
	
	private def boolean agregarAdicional() {
		modelObject.agregarIngrediente()
	}

	private def boolean quitarAdicional() {
		modelObject.quitarIngrediente()
	}

	private def void creacionTablaDeAgregados(Table<Ingrediente> tablaDeAgregados) {

		new Column<Ingrediente>(tablaDeAgregados) => [
			title = "Nombre"
			fixedSize = 200
			bindContentsToProperty("nombre")
		]

		new Column<Ingrediente>(tablaDeAgregados) => [
			title = "Distribucion"
			fixedSize = 100
			bindContentsToProperty("distribucion")
		]

	}

}
