package domino.app

import dominoPizzeria.Cliente
import dominoPizzeria.Ingrediente
import dominoPizzeria.Pedido
import dominoPizzeria.Pizza
import dominoPizzeria.Plato
import dominoPizzeria.Tamanio
import estadosDePedido.Cerrado
import estadosDePedido.EnViaje
import estadosDePedido.Entregado
import estadosDePedido.ListoParaEnviar
import formaDeEnvioPedido.Delivery
import org.uqbar.arena.bootstrap.Bootstrap
import repositorios.RepoCliente
import repositorios.RepoIngrediente
import repositorios.RepoPedido
import repositorios.RepoPizza
import repositorios.RepoTamanio

class BootstrapWeb implements Bootstrap {

	RepoIngrediente repoIngrededientes = RepoIngrediente.repo
	RepoCliente repoClientes = RepoCliente.repo
	RepoPizza repoPizzas = RepoPizza.repo
	RepoPedido repoPedidos = RepoPedido.repo
	RepoTamanio repoTamanios = RepoTamanio.repo

	override isPending() {
		true
	}

	override run() {
		this.cargarIngredientes()
		this.cargarPizzas()
		this.cargarClientes()
		this.cargarTamanios()

		this.cargarPedidos()
	}

	def cargarTamanios() {

		repoTamanios.agregar(new Tamanio("Porcion", 0.125))
		repoTamanios.agregar(new Tamanio("Chica", 0.5))
		repoTamanios.agregar(new Tamanio("Grande", 1))
		repoTamanios.agregar(new Tamanio("Familiar", 1.25))
	}

	def cargarPedidos() {

		val unosPlatos = cargarPlatos()

		repoPedidos.agregar(new Pedido(0) => [
			cliente = repoClientes.buscar("Fperez")
			platos = newArrayList(unosPlatos.get(0), unosPlatos.get(1))
			aclaraciones = "Con mucho ajo o hay tabla"
		])

		repoPedidos.agregar(new Pedido(1) => [
			cliente = repoClientes.buscar("Fperez")
			estadoDePedido = new ListoParaEnviar
			formaDeEnvio = new Delivery => [direccion = "Calle falsa"]
			platos = newArrayList(unosPlatos.get(2), unosPlatos.get(3))
			aclaraciones = "Sin aceitunas"
		])

		repoPedidos.agregar(new Pedido(2) => [
			cliente = repoClientes.buscar("Fperez")
			platos = newArrayList(unosPlatos.get(0), unosPlatos.get(3))
			aclaraciones = "Con mucho ajo o hay tabla"
		])

		repoPedidos.agregar(new Pedido(3) => [
			cliente = repoClientes.buscar("Fperez")
			formaDeEnvio = new Delivery => [direccion = "Calle falsa"]
			estadoDePedido = new EnViaje
			platos = unosPlatos
			aclaraciones = "Con mucho ajo o hay tabla"
		])

		repoPedidos.agregar(new Pedido(4) => [
			cliente = repoClientes.buscar("martinG")
			platos = newArrayList()
			estadoDePedido = new Cerrado
			aclaraciones = "Con mucho ajo o hay tabla"

		])

		repoPedidos.agregar(new Pedido(5) => [
			cliente = repoClientes.buscar("Markov")
			formaDeEnvio = new Delivery => [direccion = "Calle falsa"]
			estadoDePedido = new EnViaje
			platos = newArrayList(unosPlatos.get(1), unosPlatos.get(2))
			aclaraciones = "Con mucho ajo o hay tabla"
		])

		repoPedidos.agregar(new Pedido(6) => [
			cliente = repoClientes.buscar("GTest")
			formaDeEnvio = new Delivery => [direccion = "Calle falsa"]
			estadoDePedido = new EnViaje
			platos = unosPlatos
			aclaraciones = "Con mucho ajo o hay tabla"

		])

		repoPedidos.agregar(new Pedido(7) => [
			cliente = repoClientes.buscar("Fperez")
			estadoDePedido = new Cerrado
			platos = unosPlatos
			aclaraciones = "Con mucho ajo o hay tabla"

		])
		repoPedidos.agregar(new Pedido(8) => [
			cliente = repoClientes.buscar("Fperez")
			estadoDePedido = new Entregado
			platos = unosPlatos
			aclaraciones = "Con mucho ajo o hay tabla"

		])

	}

	def cargarPlatos() {

		var platos = newArrayList()

		val platoDeMuzarellaConJamon = new Plato() => [
			pizzaBase = repoPizzas.buscar("Muzzarella")
			tamanioPizza = new Tamanio("Grande", 1)
		]

		val platoDeFugazzetaRellena = new Plato() => [
			pizzaBase = repoPizzas.buscar("Fugazzeta Rellena")
			tamanioPizza = new Tamanio("Grande", 1)
		]

		val platoTomate = new Plato() => [
			pizzaBase = repoPizzas.buscar("Tomate")
			tamanioPizza = new Tamanio("Grande", 1)
		]

		val platoEspecial = new Plato() => [
			pizzaBase = repoPizzas.buscar("Especial")
			tamanioPizza = new Tamanio("Grande", 1)
		]

		platos.add(platoDeMuzarellaConJamon)
		platos.add(platoDeFugazzetaRellena)
		platos.add(platoTomate)
		platos.add(platoEspecial)

		platos
	}

	def cargarClientes() {

		repoClientes.agregar(new Cliente("Fran", "Fperez", "1234", "fake1@gmail.com", "falsa por mucho"))
		repoClientes.agregar(new Cliente("Martin", "martinG", "hackme", "fake@gmail.com", "not falsa"))
		repoClientes.agregar(new Cliente("Mariano", "Markov", "1234", "superFake@gmail.com", "falsa "))
		repoClientes.agregar(new Cliente("Gaston", "GTest", "dontHackme", "notFake@gmail.com", "not not not falsa"))

	}

	def cargarPizzas() {

		repoPizzas.agregar(new Pizza => [
			it.precioBase = 100
			it.nombre = "Muzzarella"
			it.agregarIngrediente(RepoIngrediente.repo.buscar("Muzzarella"))
		])
		repoPizzas.agregar(new Pizza => [
			it.precioBase = 150
			it.nombre = "Tomate"
			it.agregarIngrediente(RepoIngrediente.repo.buscar("Tomate"))
			it.agregarIngrediente(RepoIngrediente.repo.buscar("Muzzarella"))
		])

		repoPizzas.agregar(new Pizza => [
			it.precioBase = 200
			it.nombre = "Fugazzeta Rellena"
			it.agregarIngrediente(RepoIngrediente.repo.buscar("Tomate"))
			it.agregarIngrediente(RepoIngrediente.repo.buscar("Cebolla"))
			it.agregarIngrediente(RepoIngrediente.repo.buscar("Jamon"))
		])

		repoPizzas.agregar(new Pizza => [
			it.precioBase = 250
			it.nombre = "Especial"
			it.agregarIngrediente(RepoIngrediente.repo.buscar("Muzzarella"))
			it.agregarIngrediente(RepoIngrediente.repo.buscar("Aceituna"))
			it.agregarIngrediente(RepoIngrediente.repo.buscar("Jamon"))
		])

		repoPizzas.agregar(new Pizza => [
			it.precioBase = 70
			it.nombre = "Pizza Custom"
		])

	}

	def cargarIngredientes() {

		repoIngrededientes.agregar(new Ingrediente => [
			it.precio = 15
			it.nombre = "Muzzarella"
			it.distribucion = "Todo"
		])

		repoIngrededientes.agregar(new Ingrediente => [
			it.precio = 12
			it.nombre = "Tomate"
			it.distribucion = "Todo"
		])

		repoIngrededientes.agregar(new Ingrediente => [
			it.precio = 15
			it.nombre = "Cebolla"
			it.distribucion = "Todo"
		])
		repoIngrededientes.agregar(new Ingrediente => [
			it.precio = 5
			it.nombre = "Aceitunas"
			it.distribucion = "Todo"
		])

		repoIngrededientes.agregar(new Ingrediente => [
			it.precio = 25
			it.nombre = "Jamon"
			it.distribucion = "Todo"
		])

	}

}
