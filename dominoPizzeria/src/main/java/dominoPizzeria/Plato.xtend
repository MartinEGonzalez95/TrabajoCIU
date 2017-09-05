package dominoPizzeria

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Plato {

	Pizza pizza

	Tamanio tamanio

	List<Ingrediente> ingredientesAgregados

	new(Pizza pizza, Tamanio tamanio) {
		ingredientesAgregados = newArrayList()
		this.pizza = pizza
		this.tamanio = tamanio
	}

	/*Precio plato = Precio base * Tamaño + Recargo por ingredientes extras */
	def float precio() {

		(calcularPrecioDePizzaPorTamaño()) + recargoPorIngredientes()
	}

	def float calcularPrecioDePizzaPorTamaño() {
		pizza.precio * tamanio.valor
	}

	def float recargoPorIngredientes() {
		 ingredientesAgregados.stream.mapToInt([ingrediente|ingrediente.precio]).sum

	}

}
