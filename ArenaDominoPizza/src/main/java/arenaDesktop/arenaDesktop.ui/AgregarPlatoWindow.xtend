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

	override void aceptar()
	{
		
		if (modelObject.platoTerminado)
		{
		
			RepoPedido.repo.modificar(modelObject.agregarPlato)
			this.accept	
			
		} else
		{
			
			super.showInfo("No dejes el plato vacío che!")
			
		}

	}

}
