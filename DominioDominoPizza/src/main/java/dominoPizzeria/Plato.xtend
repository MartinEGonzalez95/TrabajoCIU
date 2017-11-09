package dominoPizzeria

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@Accessors
@TransactionalAndObservable
class Plato {

	Pizza pizzaBase
	Tamanio tamanioPizza
	List<Ingrediente> ingredientesExtras = newArrayList

	def double precio() {

		precioEnBaseAlTamaño + precioIngredientesExtras

	}

	def double precioEnBaseAlTamaño() {

		if (ingredientesExtras.isEmpty) {

			return pizzaBase.precioBase * tamanioPizza.getValor 

		}

		70 * tamanioPizza.getValor

	}

	def double precioIngredientesExtras() {

		ingredientesExtras.stream.mapToDouble( [ingrediente|ingrediente.precio]).sum

	}

	def agregarAdicional(Ingrediente ingrediente) {

		ingredientesExtras.add(ingrediente)

	}

	def eliminarAdicional(Ingrediente ingrediente) {

		ingredientesExtras.remove(ingrediente)

	}
	
	def verificar()
	{
		
		pizzaBase !== null && tamanioPizza !== null
		
	}

}
