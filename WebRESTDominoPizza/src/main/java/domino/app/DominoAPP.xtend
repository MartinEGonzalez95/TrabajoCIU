package domino.app

import domino.APIREST.DominoRestAPI
import org.uqbar.xtrest.api.XTRest
import formaDeEnvioPedido.Delivery

class DominoAPP {

	def static void main(String[] args) {
	
	val nombre = new Delivery()
	
	System.out.println(nombre.nombre)
	
		val bootstrap = new BootstrapWeb
		bootstrap.run

		XTRest.startInstance(9100, new DominoRestAPI())
	
	
	
	}

}
