package arenaDesktop.arenaDesktop.ui

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.tables.Table

import dominoPizzeria.Ingrediente

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import arenaDesktop.arenaDesktop.model.ControladorMenu
import dominoPizzeria.Pizza
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.VerticalLayout
import arenaDesktop.CrearIngredienteWindow

class MenuWindow extends SimpleWindow<ControladorMenu> {

	new(WindowOwner parent, ControladorMenu model) {
		super(parent, model)
		this.title = "Menu"
	}

	override protected addActions(Panel actionsPanel) {

		new Button(actionsPanel) => [
			caption = "Cerrar"
			onClick [|this.close]

		]

	}

	override protected createFormPanel(Panel mainPanel) {
		// creo 2 paneles, para separar los ingredientes de las pizzas
		val promociociones = new Label(mainPanel).text = "Promociones"
		promociociones.alignLeft
		val panelSuperior = new Panel(mainPanel)

		this.crearPanelDePromociones(panelSuperior)

		val adicionales = new Label(mainPanel).text = "Ingredientes Adicionales"
		adicionales.alignLeft
		val panelInferior = new Panel(mainPanel)
		this.crearPanelDeIngredientes(panelInferior)

	}

	def crearPanelDeIngredientes(Panel panelInferior) {

		panelInferior.layout = new ColumnLayout(2)

		val panelDeIngredientes = new Panel(panelInferior)

		creacionTablaDeIngredientes(panelDeIngredientes)

		val panelDeOpcionesDeIngredientes = new Panel(panelInferior)

		accionesDelPanelIngredientes(panelDeOpcionesDeIngredientes)
	}

	def accionesDelPanelIngredientes(Panel panel) {

		val elementSelected = new NotNullObservable("ingredienteSeleccionado")

		new Button(panel) => [
			caption = "Crear"
			onClick [|this.crearIngrediente]
		]

		new Button(panel) => [
			caption = "Editar"
			onClick [|this.editarIngrediente]
			bindEnabled(elementSelected)
		]
		new Button(panel) => [
			caption = "Eliminar"
			onClick [|this.eliminarIngrediente]
			bindEnabled(elementSelected)
		]

	}

	def creacionTablaDeIngredientes(Panel panelDeIngredientes) {

		val tablaDeIngredientes = new Table<Ingrediente>(panelDeIngredientes, typeof(Ingrediente)) => [
			items <=> "ingredientes"
			value <=> "ingredienteSeleccionado"
		]

		new Column<Ingrediente>(tablaDeIngredientes) => [
			title = "Nombre"
			fixedSize = 100
			bindContentsToProperty("nombre")
		]

		new Column<Ingrediente>(tablaDeIngredientes) => [
			title = "precio"
			fixedSize = 100
			bindContentsToProperty("precio")
		]

	}

	def crearPanelDePromociones(Panel panelSuperior) {

		panelSuperior.layout = new ColumnLayout(2)

		val panelDePromociones = new Panel(panelSuperior)

		val tablaDePromociones = new Table<Pizza>(panelDePromociones, typeof(Pizza)) => [
			items <=> "pizzas"
			value <=> "pizzaSeleccionada"
		]

		creacionTablaDePromociones(tablaDePromociones)

		accionesDelPanelIPromociones(new Panel(panelSuperior))

	}

	def creacionTablaDePromociones(Table<Pizza> tablaPromociones) {

		new Column<Pizza>(tablaPromociones) => [
			title = "Nombre"
			fixedSize = 100
			bindContentsToProperty("nombre")
		]

		new Column<Pizza>(tablaPromociones) => [
			title = "precio"
			fixedSize = 100
			bindContentsToProperty("precio")
		]

	}

	def accionesDelPanelIPromociones(Panel actions) {
		val elementSelected = new NotNullObservable("pizzaSeleccionada")
		new Button(actions) => [
			caption = "Crear"
			onClick [|this.crearPizza]

		]

		new Button(actions) => [
			caption = "Editar"
			onClick [|this.editarPizza]
			bindEnabled(elementSelected)
		]
		new Button(actions) => [
			caption = "Eliminar"
			onClick [|this.eliminarPizza]
			bindEnabled(elementSelected)
		]
	}

	def eliminarPizza() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	def editarPizza() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	def crearPizza() {
		(new EditarIngredienteWindow(this,modelObject.ingredienteSeleccionado)).open
	}

	def editarIngrediente() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	def eliminarIngrediente() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	def crearIngrediente() {
		(new CrearIngredienteWindow(this)).open
	}

}
