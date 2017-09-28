package arenaDesktop.arenaDesktop.ui

import org.uqbar.arena.windows.WindowOwner
import dominoPizzeria.Ingrediente

class CrearIngredienteDialogT extends EditarIngredienteDialogT {

	new(WindowOwner laVentanaMenu) {
		super(laVentanaMenu, new Ingrediente)
	}

	override titulo(){
		
		title = "Crear Ingrediente"
		
	}

	override executeTask() {
		getRepoIngredientes.agregar(modelObject)

		super.executeTask()
	}
}
