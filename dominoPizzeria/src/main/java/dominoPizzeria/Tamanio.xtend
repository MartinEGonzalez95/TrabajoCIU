package dominoPizzeria

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Tamanio {

	float valor
	
	String nombre

	new(String nombre,float valor) {
		this.nombre = nombre
		this.valor = valor
	}

}
