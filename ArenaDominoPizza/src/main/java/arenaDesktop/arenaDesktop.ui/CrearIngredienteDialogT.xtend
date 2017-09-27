package arenaDesktop.arenaDesktop.ui

import org.uqbar.arena.windows.WindowOwner
import dominoPizzeria.Ingrediente

class CrearIngredienteDialogT extends EditarIngredienteDialogT {

	new(WindowOwner laVentanaMenu) {
		super(laVentanaMenu, new Ingrediente)
		this.title = "Crear Ingrediente"
	}

	override executeTask() {
		getRepoIngredientes.agregar(modelObject)

		super.executeTask()
	}
}
