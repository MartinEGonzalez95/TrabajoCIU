package repositorios

interface Repo<T>
{

	def void agregar(T instanciaT)

	def void eliminar(T instanciaT)

	def T buscar (String claveString)

	def T buscar (Integer claveInteger)

}
