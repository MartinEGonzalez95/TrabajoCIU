package arenaDesktop.arenaDesktop.app

import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window
import arenaDesktop.arenaDesktop.app.BootstrapDesktop
import arenaDesktop.arenaDesktop.ui.ImagenWindow
import arenaDesktop.arenaDesktop.model.Imagen

class DominosApplication extends Application {


	new() {
		super(new BootstrapDesktop)
	}

	static def void main(String[] args) {
		new DominosApplication().start()
	}

	override protected Window<?> createMainWindow() {
		return new ImagenWindow(this)
	}

}
