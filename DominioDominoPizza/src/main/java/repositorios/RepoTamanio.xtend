package repositorios

import dominoPizzeria.Tamanio
import java.util.List

class RepoTamanio implements Repo<Tamanio>{
	

	List<Tamanio> repositorio = newArrayList()

	static RepoTamanio instance = new RepoTamanio

	def static getRepo() {
		instance
	}

	override agregar(Tamanio tamanio) {

		repositorio.add(tamanio)
	}

	override eliminar(Tamanio pizza) {

		repositorio.remove(pizza)
	}

	override Tamanio buscar(String nombre) {

		repositorio.findFirst[it.nombre.equals(nombre)]
	}

	// Precondicion : No deberia ser usado //
	override buscar(Integer claveInteger) {
	}

	override cargar() {

		repositorio
	}

	override modificar(Tamanio tamanio) {
		
		eliminar(tamanio)
		agregar(tamanio)
	}
	// Precondicion explota.
	override search(String claveString)
	{
			
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}

}
