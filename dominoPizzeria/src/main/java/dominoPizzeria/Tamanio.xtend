package dominoPizzeria

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Tamanio {
	
	String nombre
	
	float valor
	
	new(String nombre, float valor) {
		
		this.nombre = nombre
		this.valor = valor
	}
	
}