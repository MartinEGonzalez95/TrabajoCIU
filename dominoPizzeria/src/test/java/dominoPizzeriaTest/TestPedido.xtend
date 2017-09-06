package dominoPizzeriaTest

import static org.mockito.Mockito.*
import java.text.SimpleDateFormat
import java.util.Date
import dominoPizzeria.Cliente
import dominoPizzeria.Pedido
import java.util.List
import org.junit.Test
import org.junit.Before
import static org.junit.Assert.*
import dominoPizzeria.Plato
import java.util.ArrayList
import dominoPizzeria.RetiroPorLocal
import dominoPizzeria.Delivery

class TestPedido {
	
	SimpleDateFormat sdf	
	Date fechaCreacion
	Pedido pedidoMonto100	
	Pedido pedidoMonto115
	Plato platoMock	
	Cliente clienteMock	
	List<Plato> platos	
	RetiroPorLocal porLocal
	Delivery delivery

	@Before
	def void setUp(){
		
		sdf = new SimpleDateFormat("yyyy-MM-dd")
		fechaCreacion = new Date
		fechaCreacion = sdf.parse("2017-05-15")
		platos = new ArrayList
		//pedidoMonto100 = new Pedido(platos, clienteMock, fechaCreacion, fechaCreacion, "ma gusta el arte")
		porLocal = new RetiroPorLocal
		delivery = new Delivery
	}
	
	
	@Test
	def void unPedidoConFormaDeEnvioRetiroPorElLocalConMontoFinal100AlPedirleSuMontoFinalDevuelve100(){
		
		val cien = 100 as float
		
		platoMock = mock(Plato)
		when(platoMock.precio).thenReturn(cien)
				
		platos.add(platoMock)
				
		pedidoMonto100 = new Pedido(platos, clienteMock, fechaCreacion, fechaCreacion, "ma gusta el arte",porLocal)

		assertEquals(100 , pedidoMonto100.montoFinal,0)	
	
	}

	@Test
	def void unPedidoConFormaDeEnvioDeliveryConMontoFinal115AlPedirleSuMontoFinalDevuelve115(){
		
		val cien = 100 as float
		
		platoMock = mock(Plato)
		when(platoMock.precio).thenReturn(cien)
				
		platos.add(platoMock)
				
		pedidoMonto115 = new Pedido(platos, clienteMock, fechaCreacion, fechaCreacion, "ma gusta el arte",delivery)

		assertEquals(115 , pedidoMonto115.montoFinal,0)	
		
		System.out.println(fechaCreacion)
		
	}
	
}