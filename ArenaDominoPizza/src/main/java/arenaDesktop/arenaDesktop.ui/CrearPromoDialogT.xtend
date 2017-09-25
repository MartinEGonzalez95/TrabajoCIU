package arenaDesktop.arenaDesktop.ui

import org.uqbar.arena.windows.WindowOwner
import dominoPizzeria.Pizza
import arenaDesktop.arenaDesktop.model.ControladorPizzaAdicionales

class CrearPromoDialogT extends EditarPromoDialogT {

	new(WindowOwner window) {
		super(window, new ControladorPizzaAdicionales(new Pizza))
		this.title = "Crear Promocion"
	}

	override executeTask() {
		getRepoPizza.agregar(modelObject.pizzaSeleccionada)

		super.executeTask()
	}

}