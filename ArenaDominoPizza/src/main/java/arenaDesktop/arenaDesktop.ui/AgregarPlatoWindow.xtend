package arenaDesktop.arenaDesktop.ui

import arenaDesktop.arenaDesktop.model.ControladorPlato

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import dominoPizzeria.Plato
import org.uqbar.arena.windows.WindowOwner

import dominoPizzeria.Pedido
import repositorios.RepoPedido

class AgregarPlatoWindow extends EditarPlatoWindow {

	new(WindowOwner owner, Pedido unPedido) {
		super(owner, new ControladorPlato(new Plato, unPedido))
		title = "Agregar Plato"
	}

	override titulo() {

		title = "Agregar pedido"

	}

	override executeTask() {

		if (!modelObject.platoSinTerminar) {

			RepoPedido.repo.modificar(modelObject.agregarPlato)

		} else {
			super.showInfo("No dejes el plato vacío che!")
		}

		super.executeTask()
	}

	override void aceptar() {
		this.accept

	}

}
