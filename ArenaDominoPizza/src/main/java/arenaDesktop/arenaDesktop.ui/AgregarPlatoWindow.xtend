package arenaDesktop.arenaDesktop.ui

import arenaDesktop.arenaDesktop.model.ControladorPlato

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import dominoPizzeria.Plato
import org.uqbar.arena.windows.WindowOwner

class AgregarPlatoWindow extends EditarPlatoWindow {

	new(WindowOwner owner) {
		super(owner, new ControladorPlato(new Plato))
	}

}
