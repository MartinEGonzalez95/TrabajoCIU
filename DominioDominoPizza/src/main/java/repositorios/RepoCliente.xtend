package repositorios

import dominoPizzeria.Cliente
import java.util.HashMap
import java.util.Map

class RepoCliente implements Repo<Cliente> {

	static RepoCliente instance

	Map<String, Cliente> repositorio = new HashMap<String, Cliente>()

	def static getRepo() {
		if (instance === null) {
			instance = new RepoCliente
		}

		return instance
	}

	override agregar(Cliente cliente) {

		if (cliente.esValido) {
			repositorio.put(cliente.nick, cliente)
		} else {
			throw new RuntimeException("Los datos no son suficientes")
		}

	}

	override eliminar(Cliente cliente) {

		repositorio.remove(cliente.email)

	}

	override Cliente buscar(String username) {

		repositorio.get(username)

	}

	// No deberia ser usado //
	override buscar(Integer claveInteger) {
	}

	override cargar() {

		repositorio.values.toList

	}

	override modificar(Cliente cliente) {
		eliminar(cliente)
		agregar(cliente)

	}

	override search(String claveString) {

		if (claveString.nullOrEmpty) {
			return repositorio.values.toList
		} else {

			repositorio.values.filter[it.nick.equals(claveString)].toList
		}
	}

}
