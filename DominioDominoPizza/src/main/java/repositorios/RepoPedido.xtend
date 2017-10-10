package repositorios

import dominoPizzeria.Pedido

import java.util.Map
import java.util.HashMap
import java.util.List

class RepoPedido implements Repo<Pedido> {

	Map<Integer, Pedido> repositorio = new HashMap<Integer, Pedido>()

	static RepoPedido instance

	def static getRepo() {
		if (instance === null) {
			instance = new RepoPedido
		}

		return instance
	}

	override agregar(Pedido pedido) {

		repositorio.put(pedido.numero, pedido)

	}

	override eliminar(Pedido pedido) {

		repositorio.remove(pedido.numero)

	}

	override Pedido buscar(Integer numero) {

		repositorio.get(numero)

	}

	// No deberia ser usado //
	override buscar(String nombre) {
	}

	override cargar() {

		repositorio.values.toList

	}

	override modificar(Pedido instanciaT) {
		eliminar(instanciaT)
		agregar(instanciaT)

	}

	override List<Pedido> search(String claveString) {
		
		if(claveString.nullOrEmpty){
			return repositorio.values.toList
		}else{
			val claveNumerica = Integer.valueOf(claveString)
			repositorio.values.filter[it.numero.equals(claveNumerica)].toList	
		}



	}


}
