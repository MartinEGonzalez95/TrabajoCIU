package dominoPizzeria

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.uqbar.commons.model.annotations.Dependencies

@Accessors
@TransactionalAndObservable
class Plato {

	Pizza pizzaBase
	Tamanio tamañoPizza
	List<Ingrediente> ingredientesExtras = newArrayList

	/* Precio plato = Precio base * Tamanio + Recargo por ingredientes extras */
	@Dependencies("precioEnBaseAlTamaño", "precioIngredientesExtras")
	def double precio() {

		precioEnBaseAlTamaño + precioIngredientesExtras

	}

	def double precioEnBaseAlTamaño() {

		if (ingredientesExtras.isEmpty) {

			return pizzaBase.precioBase * tamañoPizza.valor

		}

		70 * tamañoPizza.valor

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

}
