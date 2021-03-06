package dominoPizzeria

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@Accessors
@TransactionalAndObservable
class Ingrediente {

	String nombre
	String distribucion
	int precio

	def getPrecio() {
		if (!distribucion.nullOrEmpty && distribucion.equals("Toda")) {
			return precio * 2
		}
		precio
	}
	
	override toString(){
		nombre
	}
	
	def completo() {

		!nombre.nullOrEmpty
	
	}

}
