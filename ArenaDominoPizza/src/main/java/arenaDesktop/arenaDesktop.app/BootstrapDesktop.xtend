package arenaDesktop.arenaDesktop.app

import org.uqbar.arena.bootstrap.Bootstrap
import repositorios.RepoIngrediente
import repositorios.RepoPizza
import repositorios.RepoCliente
import repositorios.RepoPedido
import dominoPizzeria.Ingrediente
import dominoPizzeria.Pizza

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

		repo.agregar(new Pizza => [
			it.precioBase = 100
			it.nombre = "Pizza con Muzarella"
		])
		repo.agregar(new Pizza => [
			it.precioBase = 150
			it.nombre = "Pizza con Tomate"
		])

		repo.agregar(new Pizza => [
			it.precioBase = 50
			it.nombre = "PrePizza"
		])


	}

	def cargarIngredientes() {

		val repo = RepoIngrediente.getRepo

		repo.agregar(new Ingrediente => [
			it.precio = 15
			it.nombre = "Muzzarella"
			it.distribucion = ""
		])

		repo.agregar(new Ingrediente => [
			it.precio = 12
			it.nombre = "Tomate"
			it.distribucion = ""
		])

		repo.agregar(new Ingrediente => [
			it.precio = 5
			it.nombre = "Cebolla"
			it.distribucion = ""
		])

	}

}
