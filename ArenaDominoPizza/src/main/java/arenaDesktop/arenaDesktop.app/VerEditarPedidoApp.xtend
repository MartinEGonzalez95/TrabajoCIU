package arenaDesktop.arenaDesktop.app

import org.uqbar.arena.Application

class VerEditarPedidoApp extends Application {
	
	override protected createMainWindow()
	{
		
		return new VerEditarPedidoMainWindow(this)
				
	}
	
	static def void main(String[] args) {
		new VerEditarPedidoApp().start()
	}
	
}
