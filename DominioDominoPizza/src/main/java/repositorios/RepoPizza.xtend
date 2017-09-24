package repositorios

import dominoPizzeria.Pizza

import java.util.Map
import java.util.HashMap

class RepoPizza implements Repo<Pizza> {

	Map<String, Pizza> repositorio = new HashMap<String, Pizza>()

	static RepoPizza instance

	def static getRepo() {
		if (instance === null) {
			instance = new RepoPizza
		}

		return instance
	}

	override agregar(Pizza pizza) {

		repositorio.put(pizza.nombre, pizza)

	}

	override eliminar(Pizza pizza) {

		repositorio.remove(pizza.nombre)

	}

	override Pizza buscar(String nombre) {

		repositorio.get(nombre)

	}

	// No deberia ser usado //
	override buscar(Integer claveInteger) {
	}

	override cargar() {

		repositorio.values.toList

	}

}
