package arenaDesktop.repositorios

import dominoPizzeria.Pizza
import java.util.ArrayList
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.eclipse.xtend.lib.annotations.Accessors

@TransactionalAndObservable
@Accessors
class RepoPizza implements Repo<Pizza> {

	ArrayList<Pizza> repositorio = new ArrayList<Pizza>

	override agregar(Pizza pizza) {
		this.repositorio.add(pizza)
	}

	override eliminar(Pizza pizza) {
		this.repositorio.remove(pizza)
	}

	override Pizza buscar(String nombre) {
		this.repositorio.filter[it.nombre == nombre].head
	}
}
