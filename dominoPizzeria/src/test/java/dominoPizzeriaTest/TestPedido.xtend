package dominoPizzeriaTest

import static org.mockito.Mockito.*
import java.text.SimpleDateFormat
import java.util.Date
import dominoPizzeria.Pedido
import java.util.List
import org.junit.Test
import org.junit.Before
import static org.junit.Assert.*
import dominoPizzeria.Plato
import java.util.ArrayList
import formaDeEnvioPedido.RetiroPorLocal
import formaDeEnvioPedido.Delivery
import dominoPizzeria.ClienteRegistrado

class TestPedido {

	// SimpleDateFormat sdf	
	// Date fechaCreacion
	Pedido pedidoMonto100
	Pedido pedidoMonto115
	Plato platoMock
	ClienteRegistrado clienteMock
	List<Plato> platos
	RetiroPorLocal porLocal
	Delivery delivery

	@Before
	def void setUp() {

		// sdf = new SimpleDateFormat("yyyy-MM-dd")
		// fechaCreacion = new Date
		// fechaCreacion = sdf.parse("2017-05-15")
		platos = new ArrayList
		porLocal = new RetiroPorLocal
		delivery = new Delivery("UnaDireccion")
	}

	@Test
	def void unPedidoConFormaDeEnvioRetiroPorElLocalConMontoFinal100AlPedirleSuMontoFinalDevuelve100() {

		val cien = 100 as float

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

}
