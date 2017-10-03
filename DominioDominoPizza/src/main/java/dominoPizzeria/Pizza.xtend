package dominoPizzeria

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@Accessors
@TransactionalAndObservable
class Pizza {

	String nombre
	List<Ingrediente> ingredientes = newArrayList
	double precioBase = 0

	def agregarIngrediente(Ingrediente ingrediente) {

		ingredientes.add(ingrediente)

	}

	def eliminarIngrediente(Ingrediente ingrediente) {

		ingredientes.remove(ingrediente)

	}
	
	override toString()
	{
		
		nombre.concat(" ($").concat(precioBase.toString).concat(")")
		
	}
	
	def boolean validar() {
	
		!nombre.nullOrEmpty
	
	}

}
