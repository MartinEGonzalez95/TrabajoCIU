package domino.app

import domino.APIREST.DominoRestAPI
import org.uqbar.xtrest.api.XTRest
import formaDeEnvioPedido.Delivery

class DominoAPP {

	def static void main(String[] args) {
	
	System.out.println("Servidor Domino's Pizzería.")
	
		val bootstrap = new BootstrapWeb
		bootstrap.run

		XTRest.startInstance(9100, new DominoRestAPI())
	}
}
