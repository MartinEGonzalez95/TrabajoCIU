package arenaDesktop.repositorios

import dominoPizzeria.Ingrediente
import java.util.ArrayList
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@TransactionalAndObservable
@Accessors
class RepoIngrediente implements Repo<Ingrediente> {

	List<Ingrediente> repositorio = new ArrayList<Ingrediente>

	override agregar(Ingrediente ingrediente) {
		this.repositorio.add(ingrediente)
	}

	override eliminar(Ingrediente ingrediente) {
		this.repositorio.remove(ingrediente)
	}

	override buscar(String nombre) {
		this.repositorio.filter[it.nombre == nombre].head
	}

}
