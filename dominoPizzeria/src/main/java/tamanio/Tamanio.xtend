package tamanio

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Tamanio {

	float valor

	new(float valor) {

		this.valor = valor
	}

}
