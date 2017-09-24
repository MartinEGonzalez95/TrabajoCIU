package arenaDesktop.arenaDesktop.app

import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window
import arenaDesktop.arenaDesktop.app.BootstrapDesktop

class DominosApplication extends Application {


	new() {
		super(new BootstrapDesktop)
	}

	static def void main(String[] args) {
		new DominosApplication().start()
	}

	override protected Window<?> createMainWindow() {
		return new DominosWindow(this)
	}

}
