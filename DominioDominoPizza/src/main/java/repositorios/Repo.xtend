package repositorios

import java.util.List

interface Repo<T> {

	def void agregar(T instanciaT)

	def void eliminar(T instanciaT)

	def T buscar(String claveString)

	def T buscar(Integer claveInteger)

	def List<T> cargar()
	
	def void modificar(T  instanciaT)

}
