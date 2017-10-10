package repositorios

import dominoPizzeria.Ingrediente

import java.util.List

class RepoIngrediente implements Repo<Ingrediente> {

	static RepoIngrediente instance = new RepoIngrediente

	List<Ingrediente> repositorio = newArrayList()

	def static getRepo() {

		return instance
	}

	override agregar(Ingrediente ingrediente) {

		repositorio.add(ingrediente)
	}

	override eliminar(Ingrediente ingrediente) {

		repositorio.remove(ingrediente)
	}

	override Ingrediente buscar(String nombre) {
		/* por invariante, no deberia de haber dos ingredientes con el mismo nombre en el repo */
		repositorio.findFirst[it.nombre.equals(nombre)]
	}

	// No deberia ser usado //
	override buscar(Integer claveInteger) {
	}

	override cargar() {

		repositorio
	}

	override modificar(Ingrediente ingrediente) {
		eliminar(ingrediente)
		agregar(ingrediente)

	}
	
	override search(String nombreBuscado) {
		if(nombreBuscado.nullOrEmpty){
			return repositorio
		}else{
			return repositorio.filter[it.nombre.toLowerCase.contains(nombreBuscado.toLowerCase)].toList
		}
		
		
	}

}
