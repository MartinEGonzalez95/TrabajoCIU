package dominoPizzeriaTest

import dominoPizzeria.Cliente
import dominoPizzeria.Pedido
import dominoPizzeria.Plato
import formaDeEnvioPedido.Delivery
import formaDeEnvioPedido.RetiroPorLocal
import java.util.ArrayList
import java.util.List
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*
import static org.mockito.Mockito.*
import java.util.Date
import estadosDePedido.Preparando
import org.apache.commons.lang.time.DateUtils

class TestPedido {

	Pedido pedidoMonto100
	Pedido pedidoMonto115
	Plato platoMock
	Cliente clienteMock
	List<Plato> platos
	RetiroPorLocal porLocal
	Delivery delivery

	@Before
	def void setUp() {
		platos = new ArrayList
		porLocal = new RetiroPorLocal
		delivery = new Delivery("UnaDireccion")
	}

	@Test
	def test01TodoPedidoNuevoComienzaConElEstadoPreparando()
	{
		
		val Pedido unPedidoNuevo = new Pedido()
		
		assertEquals(unPedidoNuevo.estadoDePedido.class, Preparando)
		
	}
	
	@Test
	def test02UnPedidoSeEntregaALosVeinteMinutosDeSerCreadoSeVerificaQueNoPasaronMasDeTreitaMinutosDesdeSuCreacion()
	{
		
		val Pedido unPedido = new Pedido()
		
		unPedido.fechaDeEntrega = DateUtils.addMinutes(unPedido.fechaDeCreacion, 20)
		
		assertFalse(unPedido.hayMasDe30MinDeDiferenciaEntre)
		
	}
	
	@Test
	def test03UnPedidoSeEntregaALosCuarentaMinutosDeSerCreadoSeVerificaQuePasaronMasDeTreitaMinutosDesdeSuCreacion()
	{
		
		val Pedido unPedido = new Pedido()
		
		unPedido.fechaDeEntrega = DateUtils.addMinutes(unPedido.fechaDeCreacion, 40)
		
		assertTrue(unPedido.hayMasDe30MinDeDiferenciaEntre)
		
	}

	/*
	 * 
	 * Primero hacemos Plato

	@Test
	def test02unPedidoConMontoFinalCienPesosQueSeRetiraPorElLocalTieneUnMontoFinalDeCienPesos()
	{
		
		val Pedido unPedidoConMontoFinalCienPesos = new Pedido() 
		
		

		platoMock = mock(Plato)
		when(platoMock.monto).thenReturn(cien)

		platos.add(platoMock)

		pedidoMonto100 = new Pedido(platos, clienteMock, "ma gusta el arte", porLocal)

		assertEquals(100, pedidoMonto100.montoFinal, 0)

	}

	@Test
	def void unPedidoConFormaDeEnvioDeliveryConMontoFinal115AlPedirleSuMontoFinalDevuelve115() {

		val cien = 100 as float

		platoMock = mock(Plato)

		when(platoMock.monto).thenReturn(cien)

		platos.add(platoMock)

		pedidoMonto115 = new Pedido(platos, clienteMock, "ma gusta el arte", delivery)

		assertEquals(115, pedidoMonto115.montoFinal, 0)

	}
	
	*/

}
