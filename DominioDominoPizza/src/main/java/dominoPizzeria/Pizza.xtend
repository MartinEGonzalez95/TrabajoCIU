package dominoPizzeria

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@Accessors
@TransactionalAndObservable
class Pizza {

	List<Ingrediente> ingredientes
	float precio
	String nombre

	new(String nombre, int precio, ArrayList<Ingrediente> ingredientes) {
		this.ingredientes = ingredientes
		this.nombre = nombre
		this.precio = precio

	}

	def agregarIngrediente(Ingrediente ingrediente) {

		ingredientes.add(ingrediente)
	}

	def eliminarIngrediente(Ingrediente ingrediente) {

		ingredientes.remove(ingrediente)
	}

}
