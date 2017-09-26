package dominoPizzeriaTest

import dominoPizzeria.Cliente
import dominoPizzeria.Pedido
import dominoPizzeria.Pizza
import dominoPizzeria.Plato
import dominoPizzeria.Tamanio

import estadosDePedido.EnViaje
import estadosDePedido.Entregado
import estadosDePedido.ListoParaEnviar
import estadosDePedido.ListoParaRetirar
import estadosDePedido.Preparando
import formaDeEnvioPedido.Delivery
import formaDeEnvioPedido.RetiroPorLocal

import org.apache.commons.lang.time.DateUtils
import org.junit.Test

import static org.junit.Assert.*
import estadosDePedido.Cerrado

class TestPedido
{

	@Test
	def test01TodoPedidoNuevoComienzaConElEstadoPreparando()
	{
		
		val Pedido unPedidoNuevo = new Pedido(1 /* Numero Clave */)
		
		assertEquals(unPedidoNuevo.estadoDePedido.class, Preparando)
		
	}
	
	@Test
	def test02UnPedidoSeEntregaALosVeinteMinutosDeSerCreadoSeVerificaQueNoPasaronMasDeTreitaMinutosDesdeSuCreacion()
	{
		
		val Pedido unPedido = new Pedido(1 /* Numero Clave */)
		
		// Le agrego 20 minutos a la fecha de creacion //
		unPedido.fechaDeEntrega = DateUtils.addMinutes(unPedido.fechaDeCreacion, 20)
		
		assertFalse(unPedido.hayMasDe30MinDeDiferenciaEntre)
		
	}
	
	@Test
	def test03UnPedidoSeEntregaALosCuarentaMinutosDeSerCreadoSeVerificaQuePasaronMasDeTreitaMinutosDesdeSuCreacion()
	{
		
		val Pedido unPedido = new Pedido(1 /* Numero Clave */)
		
		// Le agrego 40 minutos a la fecha de creacion //
		unPedido.fechaDeEntrega = DateUtils.addMinutes(unPedido.fechaDeCreacion, 40)
		
		assertTrue(unPedido.hayMasDe30MinDeDiferenciaEntre)
		
	}


	@Test
	def test04UnPedidoTieneDosPlatosDeCostoCienPesosYSeRetiraPorLocalSeVerificaQueElMontoFinalSeaDoscientosPesos()
	{
		
		val Pedido unPedido = new Pedido(1 /* Numero Clave */)
		
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
	def test05UnPedidoTieneDosPlatosDeCostoCienPesosYEnviaPorDeliverySeVerificaQueElMontoFinalSeaDoscientosQuincePesos()
	{
		
		val Pedido unPedido = new Pedido(1 /* Numero Clave */)
		
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
	
	@Test
	def test06UnPedidoNuevoNoPuedeRetrocederDeEstado()
	{
		
		val Pedido unPedidoNuevo = new Pedido(1 /* Numero Clave */)
		
		try { unPedidoNuevo.retroceder }
		catch (RuntimeException excepcionPorEstadoEnPreparando)
		{
			
			assertEquals(excepcionPorEstadoEnPreparando.message, "No Se Puede Retroceder Un Pedido En Preparacion!")
			
		}
		
	}
	
	@Test
	def test07UnPedidoNuevoQueSeRetiraPorLocalAvanzaAlEstadoListoParaRetirar()
	{
		
		val Pedido unPedidoNuevoQueSeRetiraPorLocal = new Pedido(1 /* Numero Clave */)
		unPedidoNuevoQueSeRetiraPorLocal.formaDeEnvio = new RetiroPorLocal
		
		unPedidoNuevoQueSeRetiraPorLocal.avanzar
		
		assertEquals(unPedidoNuevoQueSeRetiraPorLocal.estadoDePedido.class, ListoParaRetirar)
		
	}
	
	@Test
	def test08UnPedidoNuevoQueSeEnviaPorDeliveryAvanzaAlEstadoListoParaEnviar()
	{
		
		val Pedido unPedidoNuevoQueSeEnviaPorDelivery = new Pedido(1 /* Numero Clave */)
		unPedidoNuevoQueSeEnviaPorDelivery.formaDeEnvio = new Delivery
		
		unPedidoNuevoQueSeEnviaPorDelivery.avanzar
		
		assertEquals(unPedidoNuevoQueSeEnviaPorDelivery.estadoDePedido.class, ListoParaEnviar)
		
	}
	
	@Test
	def test09UnPedidoConSuEstadoListoParaRetirarRetrocedeAlEstadoPreparando()
	{
		
		val Pedido unPedidoConSuEstadoListoParaRetirar = new Pedido(1 /* Numero Clave */)
		
		unPedidoConSuEstadoListoParaRetirar.estadoDePedido = new ListoParaRetirar
		
		unPedidoConSuEstadoListoParaRetirar.retroceder
		
		assertEquals(unPedidoConSuEstadoListoParaRetirar.estadoDePedido.class, Preparando)
		
	}
	
	@Test
	def test10UnPedidoConSuEstadoListoParaRetirarAvanzaAlEstadoEntregado()
	{
		
		val Pedido unPedidoConSuEstadoListoParaRetirar = new Pedido(1 /* Numero Clave */)
		
		unPedidoConSuEstadoListoParaRetirar.estadoDePedido = new ListoParaRetirar
		
		unPedidoConSuEstadoListoParaRetirar.avanzar
		
		assertEquals(unPedidoConSuEstadoListoParaRetirar.estadoDePedido.class, Entregado)
		
	}
	
	@Test
	def test11UnPedidoConSuEstadoListoParaEnviarRetrocedeAlEstadoPreparando()
	{
		
		val Pedido unPedidoConSuEstadoListoParaEnviar = new Pedido(1 /* Numero Clave */)
		
		unPedidoConSuEstadoListoParaEnviar.estadoDePedido = new ListoParaEnviar
		
		unPedidoConSuEstadoListoParaEnviar.retroceder
		
		assertEquals(unPedidoConSuEstadoListoParaEnviar.estadoDePedido.class, Preparando)
		
	}
	
	@Test
	def test12UnPedidoConSuEstadoListoParaEnviarAvanzaAlEstadoEnViaje()
	{
	
		val Cliente clienteMock = new Cliente("Martin Gonzalez", "martingonzalez", "1234", "martin@mail.com", "Calle Falsa 123")
		val MailSenderMock mailSenderMock = new MailSenderMock(clienteMock.nombre, clienteMock.password)
		val Pedido unPedidoConSuEstadoListoParaEnviar = new Pedido(1 /* Numero Clave */)
		
		unPedidoConSuEstadoListoParaEnviar.estadoDePedido = new ListoParaEnviar
		unPedidoConSuEstadoListoParaEnviar.cliente = clienteMock
		unPedidoConSuEstadoListoParaEnviar.mailSender = mailSenderMock
		
		unPedidoConSuEstadoListoParaEnviar.avanzar
		
		assertEquals(unPedidoConSuEstadoListoParaEnviar.estadoDePedido.class, EnViaje)
		
	}
	
	@Test
	def test13UnPedidoConSuEstadoEnViajeAvanzaAlEstadoEntregado()
	{
	
		val Cliente clienteMock = new Cliente("Martin Gonzalez", "martingonzalez", "1234", "martin@mail.com", "Calle Falsa 123")
		val MailSenderMock mailSenderMock = new MailSenderMock(clienteMock.nombre, clienteMock.password)
		val Pedido unPedidoConSuEstadoEnViaje = new Pedido(1 /* Numero Clave */)
		
		unPedidoConSuEstadoEnViaje.estadoDePedido = new EnViaje
		unPedidoConSuEstadoEnViaje.cliente = clienteMock
		unPedidoConSuEstadoEnViaje.mailSender = mailSenderMock
		
		unPedidoConSuEstadoEnViaje.avanzar
		
		assertEquals(unPedidoConSuEstadoEnViaje.estadoDePedido.class, Entregado)
		
	}

	@Test
	def test14UnPedidoConSuEstadoEnViajeRetrocedeAlEstadoListoParaEnviar()
	{
	
		val Cliente clienteMock = new Cliente("Martin Gonzalez", "martingonzalez", "1234", "martin@mail.com", "Calle Falsa 123")
		val MailSenderMock mailSenderMock = new MailSenderMock(clienteMock.nombre, clienteMock.password)
		val Pedido unPedidoConSuEstadoEnViaje = new Pedido(1 /* Numero Clave */)
		
		unPedidoConSuEstadoEnViaje.estadoDePedido = new EnViaje
		unPedidoConSuEstadoEnViaje.cliente = clienteMock
		unPedidoConSuEstadoEnViaje.mailSender = mailSenderMock
		
		unPedidoConSuEstadoEnViaje.retroceder
		
		assertEquals(unPedidoConSuEstadoEnViaje.estadoDePedido.class, ListoParaEnviar)
		
	}

	@Test
	def test15UnPedidoEntregadoNoPuedeAvanzarDeEstado()
	{
		
		val Pedido unPedidoEntregado = new Pedido(1 /* Numero Clave */)
		
		unPedidoEntregado.estadoDePedido = new Entregado
		
		try { unPedidoEntregado.avanzar }
		catch (RuntimeException excepcionPorPedidoEntregado)
		{
			
			assertEquals(excepcionPorPedidoEntregado.message, "El Pedido Ya Fue Entregado!")
			
		}
		
	}
	
	@Test
	def test16UnPedidoEntregadoNoPuedeRetrocederDeEstado()
	{
		
		val Pedido unPedidoEntregado = new Pedido(1 /* Numero Clave */)
		
		unPedidoEntregado.estadoDePedido = new Entregado
		
		try { unPedidoEntregado.retroceder }
		catch (RuntimeException excepcionPorPedidoEntregado)
		{
			
			assertEquals(excepcionPorPedidoEntregado.message, "El Pedido Ya Fue Entregado!")
			
		}
		
	}
	
	@Test
	def test17UnPedidoCerradoNoPuedeAvanzarDeEstado()
	{
		
		val Pedido unPedidoCerrado = new Pedido(1 /* Numero Clave */)
		
		unPedidoCerrado.estadoDePedido = new Cerrado
		
		try { unPedidoCerrado.avanzar }
		catch (RuntimeException excepcionPorPedidoCerrado)
		{
			
			assertEquals(excepcionPorPedidoCerrado.message, "El Pedido Se Encuentra Cerrado!")
			
		}
		
	}

	@Test
	def test18UnPedidoCerradoNoPuedeRetrocederDeEstado()
	{
		
		val Pedido unPedidoCerrado = new Pedido(1 /* Numero Clave */)
		
		unPedidoCerrado.estadoDePedido = new Cerrado
		
		try { unPedidoCerrado.retroceder }
		catch (RuntimeException excepcionPorPedidoCerrado)
		{
			
			assertEquals(excepcionPorPedidoCerrado.message, "El Pedido Se Encuentra Cerrado!")
			
		}
		
	}
	
	@Test
	def test19UnPedidoConSuEstadoListoParaEnviarAlAvanzarEnviaUnMail()
	{
	
		val Cliente clienteMock = new Cliente("Martin Gonzalez", "martingonzalez", "1234", "martin@mail.com", "Calle Falsa 123")
		val MailSenderMock mailSenderMock = new MailSenderMock(clienteMock.nombre, clienteMock.password)
		val Pedido unPedidoConSuEstadoListoParaEnviar = new Pedido(1 /* Numero Clave */)
		
		unPedidoConSuEstadoListoParaEnviar.estadoDePedido = new ListoParaEnviar
		unPedidoConSuEstadoListoParaEnviar.cliente = clienteMock
		unPedidoConSuEstadoListoParaEnviar.mailSender = mailSenderMock
		
		unPedidoConSuEstadoListoParaEnviar.avanzar
		
		assertTrue(unPedidoConSuEstadoListoParaEnviar.mailSender.comprobanteDeMailEnviado)
		
	}
	
	@Test
	def test20UnPedidoConSuEstadoListoParaRetirarAvanzaAlEstadoEntregadoYEnviaMailPorDemora()
	{
		
		val Cliente clienteMock = new Cliente("Martin Gonzalez", "martingonzalez", "1234", "martin@mail.com", "Calle Falsa 123")
		val MailSenderMock mailSenderMock = new MailSenderMock(clienteMock.nombre, clienteMock.password)
		val Pedido unPedidoConSuEstadoListoParaRetirar = new Pedido(1 /* Numero Clave */)
			
		unPedidoConSuEstadoListoParaRetirar.estadoDePedido = new ListoParaRetirar
		unPedidoConSuEstadoListoParaRetirar.cliente = clienteMock
		unPedidoConSuEstadoListoParaRetirar.mailSender = mailSenderMock
		
		// Le resto 40 minutos a la fecha de creacion //
		unPedidoConSuEstadoListoParaRetirar.fechaDeCreacion = DateUtils.addMinutes(unPedidoConSuEstadoListoParaRetirar.fechaDeCreacion, -40)
		
		unPedidoConSuEstadoListoParaRetirar.avanzar
		
		assertTrue(unPedidoConSuEstadoListoParaRetirar.mailSender.comprobanteDeMailEnviado)
		
	}

	@Test
	def test21UnPedidoConSuEstadoEnViajeAvanzaAlEstadoEntregadoYEnviaMailPorDemora()
	{
		
		val Cliente clienteMock = new Cliente("Martin Gonzalez", "martingonzalez", "1234", "martin@mail.com", "Calle Falsa 123")
		val MailSenderMock mailSenderMock = new MailSenderMock(clienteMock.nombre, clienteMock.password)
		val Pedido unPedidoConSuEstadoEnViaje = new Pedido(1 /* Numero Clave */)
			
		unPedidoConSuEstadoEnViaje.estadoDePedido = new EnViaje
		unPedidoConSuEstadoEnViaje.cliente = clienteMock
		unPedidoConSuEstadoEnViaje.mailSender = mailSenderMock
		
		// Le resto 40 minutos a la fecha de creacion //
		unPedidoConSuEstadoEnViaje.fechaDeCreacion = DateUtils.addMinutes(unPedidoConSuEstadoEnViaje.fechaDeCreacion, -40)
		
		unPedidoConSuEstadoEnViaje.avanzar
		
		assertTrue(unPedidoConSuEstadoEnViaje.mailSender.comprobanteDeMailEnviado)
		
	}

}
	

