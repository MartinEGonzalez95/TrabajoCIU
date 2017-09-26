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
import dominoPizzeria.Plato
import dominoPizzeria.Tamanio
import java.util.List
import java.util.ArrayList

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
		
		val ingredientes = new ArrayList<Ingrediente>
		
		ingredientes.add(new Ingrediente => [
			it.precio = 15
			it.nombre = "Muzzarella"
			it.distribucion = ""
		])
		
		val unosPlatos = new ArrayList<Plato>
		val plato = new Plato() => [
			pizzaBase = new Pizza => [
			it.precioBase = 100
			it.nombre = "Muzarella"
			]
			tamañoPizza = new Tamanio("Grande")
			ingredientesExtras = ingredientes		
		]
		unosPlatos.add(plato)
		
		
		repo.agregar(new Pedido(1) => [
			cliente = new Cliente("Fran", "Fperez", "1234", "fake1@gmail.com", "falsa por mucho")
			formaDeEnvio = new RetiroPorLocal
			platos = unosPlatos
		])
			
		repo.agregar(new Pedido(2) => [
			cliente = new Cliente("Martin", "martinG", "hackme", "fake@gmail.com", "not falsa")
			formaDeEnvio = new Delivery => [direccion = "Calle falsa"]
		])
			
		repo.agregar(new Pedido(3) => [
			cliente = new Cliente("Gaston", "GTest", "dontHackme", "notFake@gmail.com", "not not not falsa")
			formaDeEnvio = new RetiroPorLocal
		])

	}

	def cargarClientes() {

		val repo = RepoCliente.getRepo
		
		repo.agregar(new Cliente("Fran", "Fperez", "1234", "fake1@gmail.com", "falsa por mucho"))
		
		repo.agregar(new Cliente("Martin", "martinG", "hackme", "fake@gmail.com", "not falsa"))
		
		repo.agregar(new Cliente("Gaston", "GTest", "dontHackme", "notFake@gmail.com", "not not not falsa"))
		
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
