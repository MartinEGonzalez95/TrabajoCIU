package dominoPizzeria

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Pizza {
	
	
	List<Ingrediente> ingredientes

	String nombre

	new() {
		this.ingredientes = newArrayList()
	}

	new(String nombre) {
		this()
		this.nombre = nombre
	}

	def agregarIngrediente(Ingrediente object) {
	}

}
