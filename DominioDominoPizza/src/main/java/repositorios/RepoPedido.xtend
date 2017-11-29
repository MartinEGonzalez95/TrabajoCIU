package repositorios

import dominoPizzeria.Pedido
import java.util.HashMap
import java.util.Map
import org.apache.commons.lang.StringUtils

class RepoPedido implements Repo<Pedido> {

	Map<Integer, Pedido> repositorio = new HashMap<Integer, Pedido>()

	static RepoPedido instance
	Integer contador = 0 ;

	def static getRepo() {
		if (instance === null) {
			instance = new RepoPedido
		}

		return instance
	}

	override agregar(Pedido pedido) {
		
		if (pedido.numero === null) {
			pedido.numero = contador
			contador++
		}
		repositorio.put(pedido.numero, pedido)

	}

	override eliminar(Pedido pedido) {

		repositorio.remove(pedido.numero)

	}

	override Pedido buscar(Integer numero) {

		repositorio.get(numero)

	}

	// No deberia ser usado //
	override buscar(String nick) {}

	override cargar() {

		repositorio.values.toList

	}

	override modificar(Pedido instanciaT) {
		eliminar(instanciaT)
		agregar(instanciaT)

	}

	override search(String claveString) {

		if (claveString.nullOrEmpty) {
			return repositorio.values.toList
		} else {
			val claveNumerica = Integer.valueOf(claveString)
			return repositorio.values.filter[it.numero.equals(claveNumerica)].toList
		}

	}

	def buscarPorEstado(String estado) {

		if (StringUtils.isBlank(estado)) {
			repositorio.values.toList
		} else {
			repositorio.values.filter[it.estadoDePedido.toString.toLowerCase.contains(estado.toLowerCase)].toList
		}

	}

	def buscarPorNick(String nick) {

		if (StringUtils.isBlank(nick)) {
			repositorio.values.toList
		} else {
			repositorio.values.filter[it.cliente.nick.toLowerCase.contains(nick.toLowerCase)].toList
		}

	}
}
