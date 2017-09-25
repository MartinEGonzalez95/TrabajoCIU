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
		if (distribucion.equals("Toda")) {
			return precio * 2
		}
		precio
	}

}
