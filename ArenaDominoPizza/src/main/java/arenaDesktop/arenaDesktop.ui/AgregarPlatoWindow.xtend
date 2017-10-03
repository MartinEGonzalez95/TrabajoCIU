package arenaDesktop.arenaDesktop.ui

import arenaDesktop.arenaDesktop.model.ControladorPlato
import org.uqbar.arena.windows.WindowOwner
import repositorios.RepoPedido

class AgregarPlatoWindow extends EditarPlatoWindow {

	new(WindowOwner owner, ControladorPlato modelObject)
	{

		super(owner, modelObject)
		title = "Agregar Plato"

	}

	override titulo() {

		title = "Agregar pedido"

	}

	override void aceptar()
	{

		if (modelObject.platoTerminado)
		{
			modelObject.agregarPlato()
			this.accept

		}
		else
		{

			super.showInfo("No dejes el plato vacío che!")

		}

	}

}