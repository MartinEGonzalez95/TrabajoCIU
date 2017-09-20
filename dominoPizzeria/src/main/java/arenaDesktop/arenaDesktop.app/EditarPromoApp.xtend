package arenaDesktop.arenaDesktop.app

import org.uqbar.arena.Application


/**
 * Aplicacion de prueba para testear la ventana EditarPromo
 * 
 */

//-Djava.system.class.loader=org.uqbar.apo.APOClassLoader
class EditarPromoApp extends Application {

	override protected createMainWindow() {

		return new EditarPromoMainWindow(this);

	}

	static def void main(String[] args) {
		new EditarPromoApp().start()
	}

}
