package dominoPizzeriaTest

import static org.junit.Assert.*
import org.junit.Test
import static org.mockito.Mockito.*
import java.util.ArrayList
import dominoPizzeria.Plato
import formaDeEnvioPedido.FormaDeEnvio
import formaDeEnvioPedido.Delivery
import dominoPizzeria.ClienteSinRegistrar
import org.junit.Before
import org.mockito.MockitoAnnotations
import org.mockito.Mock

import dominoPizzeria.Cliente
import dominoPizzeria.Pedido

class TestClienteSinRegistrar {

	Plato platoPedidoMock = mock(Plato)

	ArrayList<Plato> platosPedidosMock = new ArrayList<Plato>

	@Test
	def unClienteSinRegistrarHaceUnPedido() {

		platosPedidosMock.add(platoPedidoMock)

		val Cliente unCliente = new ClienteSinRegistrar("Pepe", "pepe@gmail.com")

		val FormaDeEnvio deliveryACasa = new Delivery("Hipolito Yrigoyen 3737")

		val Pedido nuevoPedido = unCliente.hacerPedido(platosPedidosMock, "Mucho queso!", deliveryACasa)

		assertTrue(nuevoPedido.cliente == unCliente)

	}

}
