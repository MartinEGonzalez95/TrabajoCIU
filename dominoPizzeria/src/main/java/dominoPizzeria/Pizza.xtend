package dominoPizzeria

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList

@Accessors
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
