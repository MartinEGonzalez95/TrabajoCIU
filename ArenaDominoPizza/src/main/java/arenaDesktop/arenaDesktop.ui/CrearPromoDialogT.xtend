package arenaDesktop.arenaDesktop.ui

import arenaDesktop.arenaDesktop.model.ControladorPizzaAdicionales
import org.uqbar.arena.windows.WindowOwner

class CrearPromoDialogT extends EditarPromoDialogT {

	new(WindowOwner window) {
		super(window, new ControladorPizzaAdicionales)
		this.title = "Crear Promocion"
	}

}
