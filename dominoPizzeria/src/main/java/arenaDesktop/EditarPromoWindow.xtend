package arenaDesktop

import dominoPizzeria.Ingrediente
import dominoPizzeria.Pizza
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.bindings.ObservableProperty
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.NumericField
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.RadioSelector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.Repo
import org.uqbar.commons.model.SearchByExample
import org.uqbar.commons.model.annotations.Observable

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.tables.Column

@Accessors
class EditarPromoVentana extends MainWindow<Pizza> {

//	new(WindowOwner owner, Pizza pizzaSeleccionada) {
//		super(owner, pizzaSeleccionada)
//		this.title = "Editar Promocion"
//
//	}
//	override createFormPanel(Panel mainPanel) {
//
//		mainPanel.layout = new ColumnLayout(2)
//
//		val panelIzquierdo = new Panel(mainPanel)
//
//		new Label(panelIzquierdo).text = "Nombre"
//		new Label(panelIzquierdo).text = "Precio"
//
//		val panelDerecho = new Panel(mainPanel)
//		new TextBox(panelDerecho) => [
//			value <=> "nombre"
//
//		]
//
//		new NumericField(panelDerecho) => [
//			value <=> "precio"
//
//		]
//	}-Djava.system.class.loader=org.uqbar.apo.APOClassLoader
	List<String> distribuciones

	new(Pizza model) {
		super(model)

		this.distribuciones = #["Izquierda", "Todo", "Derecha"]
	}

	override createContents(Panel mainPanel) {

		this.crearPanelDePizzas(mainPanel)

		this.crearPanelDeIngredientes(mainPanel)

	}

	protected def void crearPanelDeIngredientes(Panel mainPanel) {

		// no tengo ni la mas minima idea de como hacer todo este panel...
		// val panelDeIngredientes1 = new Panel(mainPanel, modelObject.ingredientes.get(0))
		// panelDeIngredientes1.layout = new HorizontalLayout
		// mi idea fue, por cada adicional que tiene el menu,
		// te va generando cada uno de los controladores, pero no se la verdad
		var Panel unPanelDeIngrediente = null

		for (ingredienteDelMenu : modelObject.ingredientes) {

			unPanelDeIngrediente = new Panel(mainPanel, ingredienteDelMenu)
			unPanelDeIngrediente.layout = new HorizontalLayout

			// no tengo ni la mas minima idea de que o como utilizar el checkbox
			var unCheckBox = new CheckBox(unPanelDeIngrediente) => []

			new Label(unPanelDeIngrediente).text = ingredienteDelMenu.nombre

			new RadioSelector<Ingrediente>(unPanelDeIngrediente) => [

				bindItems(new ObservableProperty(this, "distribuciones"))
				value <=> "distribucion"

			]

		}

	}

	protected def void crearPanelDePizzas(Panel mainPanel) {

		val panelDePizzas = new Panel(mainPanel)
		panelDePizzas.layout = new ColumnLayout(2)

		val panelIzquierdo = new Panel(panelDePizzas)

		new Label(panelIzquierdo).text = "Nombre"
		new Label(panelIzquierdo).text = "Precio"

		val panelDerecho = new Panel(panelDePizzas)

		new TextBox(panelDerecho) => [
			value <=> "nombre"
		]

		new NumericField(panelDerecho) => [
			value <=> "precio"
		]

	}

	static def void main(String[] args) {
		// ejemplo
		val ingredienteDelMenu = newArrayList();
		ingredienteDelMenu.add(new Ingrediente("queso", " ", 10))
		ingredienteDelMenu.add(new Ingrediente("cebolla", " ", 15))

		new EditarPromoVentana(new Pizza("pizzaMuzza", 10, ingredienteDelMenu)).startApplication
	}

//	override protected void addActions(Panel actions) {
//		new Button(actions) => [
//			caption = "Aceptar"
//			onClick [|this.accept]
//			setAsDefault
//		]
//
//		new Button(actions) => [
//			caption = "Cancelar"
//			onClick [|this.cancel]
//		]
//	}
}
