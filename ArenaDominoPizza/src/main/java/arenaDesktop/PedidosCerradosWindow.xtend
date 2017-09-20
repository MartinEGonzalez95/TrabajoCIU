package arenaDesktop

import arenaDesktop.arenaDesktop.model.ControladorSistema
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel

class PedidosCerradosWindow extends SimpleWindow<ControladorSistema> {
	
	new(WindowOwner parent, ControladorSistema model) {
		super(parent, model)
	}
	
	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}