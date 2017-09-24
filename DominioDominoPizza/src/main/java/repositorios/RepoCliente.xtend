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

		repositorio.put(cliente.email, cliente)

	}

	override eliminar(Cliente cliente) {

		repositorio.remove(cliente.email)

	}

	override Cliente buscar(String email) {

		repositorio.get(email)

	}

	// No deberia ser usado //
	override buscar(Integer claveInteger) {
	}

	override cargar() {

		repositorio.values.toList

	}
	
	override modificar(Cliente cliente) {
		agregar(cliente)
		eliminar(cliente)
	}

}
