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

class TestPedido {
	
	SimpleDateFormat sdf
	
	Date fechaCreacion

	Pedido pedidoMonto100

	Plato platoMock
	
	Cliente clienteMock
	
	List<Plato> platos

	@Before
	def void setUp(){
		
		sdf = new SimpleDateFormat("yyyy-MM-dd")
		fechaCreacion = new Date
		fechaCreacion = sdf.parse("2017-05-15")
		
		
		pedidoMonto100 = new Pedido(platos, clienteMock, fechaCreacion, fechaCreacion, "ma gusta el arte")
		
	}
	
	
	@Test
	def void unPedidoConMontoFinal100AlPedirleSuMontoFinalDevuelve100(){
		
		
		val cien = 100 as float
		
		platoMock = mock(Plato)
		when(platoMock.precio).thenReturn(cien)
				platos.add(platoMock)

		assertEquals(pedidoMonto100.montoFinal, 100,0)	
		
	}
	
}