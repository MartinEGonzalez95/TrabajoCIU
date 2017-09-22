package arenaDesktop

import arenaDesktop.arenaDesktop.ui.EditarIngredienteWindow
import org.uqbar.arena.windows.WindowOwner
import dominoPizzeria.Ingrediente

class CrearIngredienteWindow extends EditarIngredienteWindow {
	
	new(WindowOwner laVentanaMenu) {
		super(laVentanaMenu, new Ingrediente)
	}
	
}