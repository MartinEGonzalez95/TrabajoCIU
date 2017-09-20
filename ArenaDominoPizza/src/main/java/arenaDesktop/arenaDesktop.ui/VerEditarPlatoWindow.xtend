package arenaDesktop.arenaDesktop.ui

import dominoPizzeria.Plato

import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner

class VerEditarPlatoWindow extends TransactionalDialog<Plato>
{
	
	new(WindowOwner owner, Plato model) {
		super(owner, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}
