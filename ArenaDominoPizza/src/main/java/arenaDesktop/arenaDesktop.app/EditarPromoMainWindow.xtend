package arenaDesktop.arenaDesktop.app

import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

import dominoPizzeria.Ingrediente
import dominoPizzeria.Pizza
import arenaDesktop.arenaDesktop.model.ControladorPizzaAdicionales
import arenaDesktop.arenaDesktop.ui.EditarPromoVentana
import org.uqbar.arena.windows.Dialog

/**
 * VENTANA DE PRUEBA PARA PROMOCIONES 
 * 
 */
class EditarPromoMainWindow extends SimpleWindow<ControladorPizzaAdicionales> {

	new(WindowOwner parent) {

		super(parent, new ControladorPizzaAdicionales())

	}

	override protected addActions(Panel actionsPanel) {
	}

	def openDialog(Dialog<?> dialog) {
		dialog.open
	}

	override protected createFormPanel(Panel mainPanel) {

		new Button(mainPanel) => [

			caption = "Prueba"
			onClick([|this.levantarVentanaPromo])

		]

	}

	def void levantarVentanaPromo() {

		this.openDialog(new EditarPromoVentana(this, controladorDePizzaYAdicionales))

	}

	def ControladorPizzaAdicionales controladorDePizzaYAdicionales() {
		
		var adicionales = newArrayList()
		
		adicionales.add(new Ingrediente => [nombre = "queso" distribucion = " " precio = 10])

		adicionales.add(new Ingrediente => [nombre = "tomate" distribucion = " " precio = 15])

		var pizzaSeleccionada = new Pizza => [
			nombre = "muzarella"
			precioBase = 100
			ingredientes = newArrayList()
		]
		
		new ControladorPizzaAdicionales(pizzaSeleccionada, adicionales)
	}

}
