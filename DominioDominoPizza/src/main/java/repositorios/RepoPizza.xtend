package repositorios

import dominoPizzeria.Pizza
import java.util.List

class RepoPizza implements Repo<Pizza> {


	List<Pizza> repositorio = newArrayList()

	static RepoPizza instance = new RepoPizza

	def static getRepo() {
		instance
	}

	override agregar(Pizza pizza) {

		repositorio.add(pizza)
	}

	override eliminar(Pizza pizza) {

		repositorio.remove(pizza)
	}

	override Pizza buscar(String nombre) {

		repositorio.findFirst[it.nombre.equals(nombre)]
	}

	// No deberia ser usado //
	override buscar(Integer claveInteger) {
	}

	override cargar() {

		repositorio
	}

	override modificar(Pizza pizza) {
		
		eliminar(pizza)
		agregar(pizza)
	}
	
	override search(String claveString)
	{
		
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}
