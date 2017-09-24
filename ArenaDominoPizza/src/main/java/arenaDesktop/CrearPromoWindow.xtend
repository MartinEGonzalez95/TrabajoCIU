package arenaDesktop

import arenaDesktop.arenaDesktop.ui.EditarPromoVentana
import arenaDesktop.arenaDesktop.model.ControladorPizzaAdicionales
import org.uqbar.arena.windows.WindowOwner

class CrearPromoWindow extends EditarPromoVentana {

	new(WindowOwner window) {
		super(window, new ControladorPizzaAdicionales)
		this.title = "Crear Promocion"
	}

}
