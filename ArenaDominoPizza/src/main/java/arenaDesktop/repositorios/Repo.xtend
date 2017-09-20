package arenaDesktop.repositorios

import java.util.ArrayList

interface Repo<T> {

	def void agregar(T object)

	def void eliminar(T object)

	def T buscar(String string)

}
