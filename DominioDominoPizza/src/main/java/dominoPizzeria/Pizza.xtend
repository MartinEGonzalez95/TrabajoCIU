package dominoPizzeria

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@Accessors
@TransactionalAndObservable
class Pizza {

	String nombre
	List<Ingrediente> ingredientes = newArrayList
	double precioBase

	def agregarIngrediente(Ingrediente ingrediente) {

		ingredientes.add(ingrediente)

	}

	def eliminarIngrediente(Ingrediente ingrediente) {

		ingredientes.remove(ingrediente)

	}

}
