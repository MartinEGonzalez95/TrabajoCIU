package dominoPizzeria

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.HashMap
import java.util.Map

@Accessors
class Tamanio {
	new() {
	}

	String nombre
	double valor

	new(String nombreTamaño, double valor) {

		this.nombre = nombreTamaño
		this.valor = valor
	}

	override toString() {

		nombre

	}

}
