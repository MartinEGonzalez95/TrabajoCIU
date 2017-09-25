package dominoPizzeriaTest

import dominoPizzeria.Pedido
import dominoPizzeria.Pizza
import dominoPizzeria.Plato
import dominoPizzeria.Tamanio

import estadosDePedido.Preparando
import formaDeEnvioPedido.Delivery
import formaDeEnvioPedido.RetiroPorLocal

import org.apache.commons.lang.time.DateUtils
import org.junit.Test

import static org.junit.Assert.*

class TestPedido
{

	@Test
	def test01TodoPedidoNuevoComienzaConElEstadoPreparando()
	{
		
		val Pedido unPedidoNuevo = new Pedido(1 /* Numero Clave */ )
		
		assertEquals(unPedidoNuevo.estadoDePedido.class, Preparando)
		
	}
	
	@Test
	def test02UnPedidoSeEntregaALosVeinteMinutosDeSerCreadoSeVerificaQueNoPasaronMasDeTreitaMinutosDesdeSuCreacion()
	{
		
		val Pedido unPedido = new Pedido(1 /* Numero Clave */ )
		
		unPedido.fechaDeEntrega = DateUtils.addMinutes(unPedido.fechaDeCreacion, 20)
		
		assertFalse(unPedido.hayMasDe30MinDeDiferenciaEntre)
		
	}
	
	@Test
	def test03UnPedidoSeEntregaALosCuarentaMinutosDeSerCreadoSeVerificaQuePasaronMasDeTreitaMinutosDesdeSuCreacion()
	{
		
		val Pedido unPedido = new Pedido(1 /* Numero Clave */ )
		
		unPedido.fechaDeEntrega = DateUtils.addMinutes(unPedido.fechaDeCreacion, 40)
		
		assertTrue(unPedido.hayMasDe30MinDeDiferenciaEntre)
		
	}


	@Test
	def test04unPedidoTieneDosPlatosDeCostoCienPesosYSeRetiraPorLocalSeVerificaQueElMontoFinalSeaDoscientosPesos()
	{
		
		val Pedido unPedido = new Pedido(1 /* Numero Clave */ )
		
		// Creamos un plato de precio $100 //

		val Pizza unaPizzaDeMuzarellaDeCienPesos = new Pizza()
		unaPizzaDeMuzarellaDeCienPesos.precioBase = 100 // pesos //
		
		val Tamanio tamañoGrande = new Tamanio("Grande")
		
		val Plato unPlatoDeCostoCienPesos = new Plato()
		unPlatoDeCostoCienPesos.pizzaBase = unaPizzaDeMuzarellaDeCienPesos
		unPlatoDeCostoCienPesos.tamañoPizza = tamañoGrande

		unPedido.agregarPlato(unPlatoDeCostoCienPesos)
		unPedido.agregarPlato(unPlatoDeCostoCienPesos)
		
		unPedido.formaDeEnvio = new RetiroPorLocal

		assertEquals(unPedido.montoFinal, 200 /* pesos */, 0)

	}
	
	@Test
	def test05unPedidoTieneDosPlatosDeCostoCienPesosYEnviaPorDeliverySeVerificaQueElMontoFinalSeaDoscientosQuincePesos()
	{
		
		val Pedido unPedido = new Pedido(1 /* Numero Clave */ )
		
		// Creamos un plato de precio $100 //

		val Pizza unaPizzaDeMuzarellaDeCienPesos = new Pizza()
		unaPizzaDeMuzarellaDeCienPesos.precioBase = 100 // pesos //
		
		val Tamanio tamañoGrande = new Tamanio("Grande")
		
		val Plato unPlatoDeCostoCienPesos = new Plato()
		unPlatoDeCostoCienPesos.pizzaBase = unaPizzaDeMuzarellaDeCienPesos
		unPlatoDeCostoCienPesos.tamañoPizza = tamañoGrande

		unPedido.agregarPlato(unPlatoDeCostoCienPesos)
		unPedido.agregarPlato(unPlatoDeCostoCienPesos)
		
		unPedido.formaDeEnvio = new Delivery

		assertEquals(unPedido.montoFinal, 215 /* pesos */, 0)

	}

}
