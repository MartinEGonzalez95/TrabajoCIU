package dominoPizzeria

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Pizza {

	List<Ingrediente> ingredientes
	float precio
	String nombre

	new() {
		precio = 0
		this.ingredientes = newArrayList()
	}

	new(String nombre) {
		this()
		this.nombre = nombre
	}

	new(String nombre, int precio) {
		this(nombre)
		this.precio = precio
	}

	def agregarIngrediente(Ingrediente object) {
	}

}
