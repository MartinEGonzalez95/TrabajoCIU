package domino.app

import dominoPizzeria.Cliente
import dominoPizzeria.Ingrediente
import dominoPizzeria.Pedido
import dominoPizzeria.Pizza
import dominoPizzeria.Plato
import dominoPizzeria.Tamanio
import formaDeEnvioPedido.Delivery
import formaDeEnvioPedido.RetiroPorLocal
import java.util.ArrayList
import org.uqbar.arena.bootstrap.Bootstrap
import repositorios.RepoCliente
import repositorios.RepoIngrediente
import repositorios.RepoPedido
import repositorios.RepoPizza
import estadosDePedido.Cerrado

class BootstrapWeb implements Bootstrap {

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

		val ingredientes = new ArrayList<Ingrediente>

		ingredientes.add(new Ingrediente => [
			it.precio = 15
			it.nombre = "Muzzarella"
			it.distribucion = "Todo"
		])

		val unosPlatos = new ArrayList<Plato>
		val plato = new Plato() => [
			pizzaBase = new Pizza => [
				it.precioBase = 100
				it.nombre = "Muzarella"
			]
			tamanioPizza = new Tamanio("Grande",1)
			ingredientesExtras = ingredientes
		]
		unosPlatos.add(plato)

		repo.agregar(new Pedido(1) => [
			cliente = new Cliente("Fran", "Fperez", "1234", "fake1@gmail.com", "falsa por mucho")
			formaDeEnvio = new RetiroPorLocal
			platos = unosPlatos
			aclaraciones = "Con mucho ajo o hay tabla"

		])

		repo.agregar(new Pedido(2) => [
			cliente = new Cliente("Martin", "martinG", "hackme", "emailQueVaAFallar:D", "not falsa")
			formaDeEnvio = new Delivery => [direccion = "Calle falsa"]
			estadoDePedido = new Cerrado
		])

		repo.agregar(new Pedido(3) => [
			cliente = new Cliente("Gaston", "GTest", "dontHackme", "notFake@gmail.com", "not not not falsa")
			formaDeEnvio = new Delivery => [direccion = "Calle falsa"]
		])

	}

	def cargarClientes() {

		val repo = RepoCliente.getRepo

		repo.agregar(new Cliente("Fran", "Fperez", "1234", "fake1@gmail.com", "falsa por mucho"))

		repo.agregar(new Cliente("Martin", "martinG", "hackme", "fake@gmail.com", "not falsa"))

		repo.agregar(new Cliente("Gaston", "GTest", "dontHackme", "notFake@gmail.com", "not not not falsa"))
		repo.agregar(new Cliente("Admin", "Admin", "1234", "admin@gmail.com", "Domino's"))
	}

	def cargarPizzas() {

		val repo = RepoPizza.getRepo

		repo.agregar(new Pizza => [
			it.precioBase = 100
			it.nombre = "Muzarella"
			it.agregarIngrediente(RepoIngrediente.repo.buscar("Muzzarella"))
		])
		repo.agregar(new Pizza => [
			it.precioBase = 150
			it.nombre = "Tomate"
			it.agregarIngrediente(RepoIngrediente.repo.buscar("Tomate"))
			it.agregarIngrediente(RepoIngrediente.repo.buscar("Muzzarella"))
		])

		repo.agregar(new Pizza => [
			it.precioBase = 200
			it.nombre = "Fugazzeta Rellena"
			it.agregarIngrediente(RepoIngrediente.repo.buscar("Tomate"))
			it.agregarIngrediente(RepoIngrediente.repo.buscar("Cebolla"))
		])

		repo.agregar(new Pizza => [
			it.precioBase = 70
			it.nombre = "Pizza Custom"
		])

	}

	def cargarIngredientes() {

		val repo = RepoIngrediente.getRepo

		repo.agregar(new Ingrediente => [
			it.precio = 15
			it.nombre = "Muzzarella"
			it.distribucion = "Todo"
		])

		repo.agregar(new Ingrediente => [
			it.precio = 12
			it.nombre = "Tomate"
			it.distribucion = "Todo"
		])

		repo.agregar(new Ingrediente => [
			it.precio = 15
			it.nombre = "Cebolla"
			it.distribucion = "Todo"
		])
		repo.agregar(new Ingrediente => [
			it.precio = 5
			it.nombre = "Aceitunas"
			it.distribucion = "Todo"
		])

	}

}