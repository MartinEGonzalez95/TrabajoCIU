package dominoPizzeria

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import dominoPizzeria.Tamanio

@Accessors
class Plato {

	Pizza pizza

	Tamanio tamanio

	List<Ingrediente> ingredientesExtras

	new(Pizza pizza, Tamanio tamanio, ArrayList<Ingrediente> ingredientes) {

		this.ingredientesExtras = ingredientes
		this.pizza = pizza
		this.tamanio = tamanio
	}

	/*Precio plato = Precio base * Tamaño + Recargo por ingredientes extras */
	def float monto() {

		(proporcionPorTamaño) + recargoPorIngredientes
	}

	def float proporcionPorTamaño() {
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

	def cambiarTamaño(Tamanio nuevoTamanio) {
		tamanio  = nuevoTamanio
	}

}
