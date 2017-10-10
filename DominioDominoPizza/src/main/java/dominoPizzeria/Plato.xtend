package dominoPizzeria

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@Accessors
@TransactionalAndObservable
class Plato {

	Pizza pizzaBase
	Tamanio tamañoPizza
	List<Ingrediente> ingredientesExtras = newArrayList

	def double precio() {

		precioEnBaseAlTamaño + precioIngredientesExtras

	}

	def double precioEnBaseAlTamaño() {

		if (ingredientesExtras.isEmpty) {

			return pizzaBase.precioBase * tamañoPizza.getValor 

		}

		70 * tamañoPizza.getValor

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
		
		pizzaBase !== null && tamañoPizza !== null
		
	}

}
