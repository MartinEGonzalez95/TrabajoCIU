package dominoPizzeria

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@Accessors
@TransactionalAndObservable
class Ingrediente {

	String nombre

	String distribucion

	int precio

	new(String nombre, String distribucion, int precio) {

		this.nombre = nombre
		this.distribucion = distribucion
		this.precio = precio

	}
	
	new() {
		
	}

}