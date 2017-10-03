package arenaDesktop.arenaDesktop.ui

import org.uqbar.arena.windows.WindowOwner
import dominoPizzeria.Pizza
import arenaDesktop.arenaDesktop.model.ControladorPizzaAdicionales

class CrearPromoDialogT extends EditarPromoDialogT {

	new(WindowOwner window) {
		super(window, new ControladorPizzaAdicionales(new Pizza))
	}
	
	override titulo(){
		
		title = "Crear Promocion"
		
	}
	
	 override executeTask() {
  		modelObject.pizzaSeleccionada.ingredientes = modelObject.ingredientesParaAgregar

		modelObject.agregarPizza()
  		
  		super.executeTask()
 }

}
