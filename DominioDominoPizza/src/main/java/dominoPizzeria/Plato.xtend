package dominoPizzeria

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import dominoPizzeria.Tamanio
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@Accessors
@TransactionalAndObservable
class Plato {

	Pizza pizza

	Tamanio tamanio

	List<Ingrediente> ingredientesExtras

	new(Pizza pizza, Tamanio tamanio, ArrayList<Ingrediente> ingredientes) {

		this.ingredientesExtras = ingredientes
		this.pizza = pizza
		this.tamanio = tamanio
	}

	/*Precio plato = Precio base * Tamanio + Recargo por ingredientes extras */
	def float monto() {

		(proporcionPorTamanio) + recargoPorIngredientes
	}

	def float proporcionPorTamanio() {
		pizza.precio * tamanio.valor
	}

	def float recargoPorIngredientes() {
		ingredientesExtras.stream.mapToInt([ingrediente|ingrediente.precio]).sum

	}

	def agregarAdicional(Ingrediente ingrediente) {
		ingredientesExtras.add(ingrediente)
	}

	def eliminarAdicional(Ingrediente ingrediente) {
		ingredientesExtras.remove(ingrediente)
	}

	def cambiarTamanio(Tamanio nuevoTamanio) {
		tamanio  = nuevoTamanio
	}

}

