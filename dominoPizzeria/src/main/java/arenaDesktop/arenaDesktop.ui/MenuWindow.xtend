package arenaDesktop.arenaDesktop.ui

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Button

class MenuWindow extends SimpleWindow {

	new(WindowOwner parent, Object model) {
		super(parent, model)
	}

	override protected addActions(Panel actionsPanel) {

		new Button(actionsPanel) => [
			caption = "Cerrar"
			onClick [|this.close]

		]

	}

	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override showOn(Object builder) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

	

}
