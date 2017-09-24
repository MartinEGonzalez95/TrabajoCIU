package arenaDesktop

import org.uqbar.arena.bootstrap.Bootstrap
import repositorios.RepoIngrediente
import repositorios.RepoPizza
import repositorios.RepoCliente
import repositorios.RepoPedido
import dominoPizzeria.Ingrediente

class BootstrapDesktop implements Bootstrap {

	override isPending() {
		true
	}

	override run() {
		this.cargarIngredientes()
		this.cargarPizzas()
		this.cargarClientes()
		this.cargarPedidos()
	}

	def cargarPedidos() {

		val repo = RepoPedido.getRepo

	}

	def cargarClientes() {

		val repo = RepoCliente.getRepo
	}

	def cargarPizzas() {

		val repo = RepoPizza.getRepo
	}

	def cargarIngredientes() {

		val repo = RepoIngrediente.getRepo
		var ingredientes = newArrayList()
		
		ingredientes.add(new Ingrediente => [
			it.precio = 15
			it.nombre = "Muzzarella"
			it.distribucion = ""
		])

		ingredientes.add(new Ingrediente => [
			it.precio = 12
			it.nombre = "Tomate"
			it.distribucion = ""
		])

		ingredientes.add(new Ingrediente => [
			it.precio = 5
			it.nombre = "Cebolla"
			it.distribucion = ""
		])


		for (Ingrediente unIngrediente : ingredientes) {
			repo.agregar(unIngrediente)
		}

	}

}
