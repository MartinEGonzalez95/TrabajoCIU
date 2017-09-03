package dominoPizzeria

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Plato {

	Pizza pizza

	String tamaño

	List<Ingrediente> ingredientesAgregados

	new(Pizza pizza, String tamaño) {
		ingredientesAgregados = newArrayList()
		this.pizza = pizza
		this.tamaño = tamaño
	}

	/*Precio plato = Precio base * Tamaño + Recargo por ingredientes extras */
	def float precio() {

		(calcularPrecioDePizzaPorTamaño()) + recargoPorIngredientes();
	}

	private def float calcularPrecioDePizzaPorTamaño() {
		pizza.precio * this.calcularPrecioPorTamaño()
	}

	def float recargoPorIngredientes() {
		var recargo = 0 as float

		recargo = ingredientesAgregados.stream.mapToInt([ingrediente|ingrediente.precio]).sum

	}

	def float calcularPrecioPorTamaño() {

		return 1 // no debe ser así  debe calcular el tamaño segun un objeto "Conversor Tamaño/Numero" u otra solucion
	}

}
