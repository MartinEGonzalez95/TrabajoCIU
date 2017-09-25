package arenaDesktop.arenaDesktop.app

import org.uqbar.arena.bootstrap.Bootstrap
import repositorios.RepoIngrediente
import repositorios.RepoPizza
import repositorios.RepoCliente
import repositorios.RepoPedido
import dominoPizzeria.Ingrediente
import dominoPizzeria.Pizza
import dominoPizzeria.Pedido
import dominoPizzeria.Cliente
import formaDeEnvioPedido.RetiroPorLocal
import formaDeEnvioPedido.Delivery

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
		
		repo.agregar(new Pedido => [
			cliente = new Cliente("Fran", "Fperez", "1234", "fake1@gmail.com", "falsa por mucho")
			formaDeEnvio = new RetiroPorLocal
			numero = 1
		])
			
		repo.agregar(new Pedido => [
			cliente = new Cliente("Martin", "martinG", "hackme", "fake@gmail.com", "not falsa")
			formaDeEnvio = new Delivery("Falsa 123")
			numero = 2
		])
			
		repo.agregar(new Pedido => [
			cliente = new Cliente("Gaston", "GTest", "dontHackme", "notFake@gmail.com", "not not not falsa")
			formaDeEnvio = new RetiroPorLocal
			numero = 3
		])

	}

	def cargarClientes() {

		val repo = RepoCliente.getRepo
	}

	def cargarPizzas() {

		val repo = RepoPizza.getRepo

		repo.agregar(new Pizza => [
			it.precioBase = 100
			it.nombre = "Muzarella"
		])
		repo.agregar(new Pizza => [
			it.precioBase = 150
			it.nombre = "Tomate"
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
