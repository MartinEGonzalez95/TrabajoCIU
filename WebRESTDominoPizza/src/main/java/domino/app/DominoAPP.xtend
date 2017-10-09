package domino.app

import domino.APIREST.DominoRestAPI
import org.uqbar.xtrest.api.XTRest

class DominoAPP {

	def static void main(String[] args) {
		val bootstrap = new BootstrapWeb
		bootstrap.run

		XTRest.startInstance(9100, new DominoRestAPI())
	}

}
