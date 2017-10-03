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

import org.uqbar.arena.windows.Dialog
import arenaDesktop.arenaDesktop.model.ControladorPizzaAdicionales
import net.sf.oval.constraint.Size.List
import org.uqbar.arena.layout.HorizontalLayout

class MenuWindow extends SimpleWindow<ControladorMenu> {

	new(WindowOwner parent) {
		super(parent, new ControladorMenu)
		this.iconImage = "src/main/resources/DominoLogo.png"
	}

	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Ir a Pedidos"
			onClick [|this.close]
		]
	}

	override protected createFormPanel(Panel mainPanel) {
		this.title = "Menu"
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

		panelInferior.layout = new HorizontalLayout

		val panelDeIngredientes = new Panel(panelInferior)

		creacionTablaDeIngredientes(panelDeIngredientes)

		val panelDeOpcionesDeIngredientes = new Panel(panelInferior)

		accionesDelPanelIngredientes(panelDeOpcionesDeIngredientes)
	}

	def accionesDelPanelIngredientes(Panel panel) {

		val ingredienteSeleccionado = new NotNullObservable("ingredienteSeleccionado")

		new Button(panel) => [
			caption = "Crear"
			onClick [|this.crearIngrediente]
		]
		new Button(panel) => [
			caption = "Editar"
			onClick [|this.editarIngrediente]
			bindEnabled(ingredienteSeleccionado)
		]
		new Button(panel) => [
			caption = "Eliminar"
			onClick [|this.eliminarIngrediente]
			bindEnabled(ingredienteSeleccionado)
		]

	}

	def creacionTablaDeIngredientes(Panel panelDeIngredientes) {

		val tablaDeIngredientes = new Table<Ingrediente>(panelDeIngredientes, typeof(Ingrediente)) => [
			items <=> "ingredientes"
			value <=> "ingredienteSeleccionado"
			numberVisibleRows = 8

		]

		new Column<Ingrediente>(tablaDeIngredientes) => [
			title = "Nombre"
			weight = 200
			bindContentsToProperty("nombre")
		]

		new Column<Ingrediente>(tablaDeIngredientes) => [
			title = "Precio"
			weight = 200
			bindContentsToProperty("precio")
		]

	}

	def crearPanelDePromociones(Panel panelSuperior) {

		panelSuperior.layout = new HorizontalLayout
		val panelDePromociones = new Panel(panelSuperior)

		val tablaDePromociones = new Table<Pizza>(panelDePromociones, typeof(Pizza)) => [
			items <=> "pizzas"
			value <=> "pizzaSeleccionada"
			numberVisibleRows = 8
		]

		creacionTablaDePromociones(tablaDePromociones)

		accionesDelPanelIPromociones(new Panel(panelSuperior))

	}

	def creacionTablaDePromociones(Table<Pizza> tablaPromociones) {

		new Column<Pizza>(tablaPromociones) => [
			title = "Nombre"
			weight = 100
			bindContentsToProperty("nombre")
		]

		new Column<Pizza>(tablaPromociones) => [
			title = "Precio"
			weight = 100
			bindContentsToProperty("precioBase")
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
		this.modelObject.eliminarPizza()

	}

	def eliminarIngrediente() {
		this.modelObject.eliminarIngrediente()

	}

	def editarPizza() {
		openDialog(new EditarPromoDialogT(this, new ControladorPizzaAdicionales(modelObject.pizzaSeleccionada)))
	}

	def editarIngrediente() {
		openDialog(new EditarIngredienteDialogT(this, modelObject.ingredienteSeleccionado))
	}

	def crearIngrediente() {
		openDialog(new CrearIngredienteDialogT(this))
	}

	def crearPizza() {
		openDialog(new CrearPromoDialogT(this))

	}

	def openDialog(Dialog<?> dialog) {

		dialog.onAccept([|modelObject.cargar])

		dialog.open

	}

}
