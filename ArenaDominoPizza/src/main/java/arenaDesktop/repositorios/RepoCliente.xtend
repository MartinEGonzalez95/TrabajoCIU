package arenaDesktop.repositorios

import dominoPizzeria.Cliente
import java.util.ArrayList
import org.uqbar.commons.model.annotations.TransactionalAndObservable
import org.eclipse.xtend.lib.annotations.Accessors

@TransactionalAndObservable
@Accessors
class RepoCliente implements Repo<Cliente> {

	ArrayList<Cliente> repositorio = new ArrayList<Cliente>

	override agregar(Cliente cliente) {
		this.repositorio.add(cliente)
	}

	override eliminar(Cliente cliente) {
		this.repositorio.remove(cliente)
	}

	override Cliente buscar(String email) {
		this.repositorio.filter[it.email == email].head
	}

}
