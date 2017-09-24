package repositorios

import dominoPizzeria.Ingrediente

import java.util.Map
import java.util.HashMap

class RepoIngrediente implements Repo<Ingrediente> {

	static RepoIngrediente instance

	Map<String, Ingrediente> repositorio = new HashMap<String, Ingrediente>()

	def static getRepo() {
		if (instance === null) {
			instance = new RepoIngrediente
		}

		return instance
	}

	override agregar(Ingrediente ingrediente) {

		repositorio.put(ingrediente.nombre, ingrediente)

	}

	override eliminar(Ingrediente ingrediente) {

		repositorio.remove(ingrediente.nombre)

	}

	override Ingrediente buscar(String nombre) {

		repositorio.get(nombre)

	}

	// No deberia ser usado //
	override buscar(Integer claveInteger) {
		
	}

	override cargar() {

		repositorio.values.toList

	}

}
