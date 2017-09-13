package dominoPizzeriaTest

import static org.junit.Assert.*
import org.junit.Test
import static org.mockito.Mockito.*
import java.util.ArrayList
import dominoPizzeria.Plato
import dominoPizzeria.Pedido
import formaDeEnvioPedido.FormaDeEnvio
import formaDeEnvioPedido.Delivery
import dominoPizzeria.ClienteRegistrado

class TestCliente {

	Plato platoPedidoMock = mock(Plato)

	ArrayList<Plato> platosPedidosMock = new ArrayList<Plato>

	@Test
	def unClienteRealizarUnPedidoYEstaIncluidoEnElMismo() {

		platosPedidosMock.add(platoPedidoMock)

		val ClienteRegistrado unCliente = new ClienteRegistrado("Martin", "MEG", "1234", "martinegonzalez95@gmail",
			"Hipolito Yrigoyen 3737")

		val FormaDeEnvio deliveryACasa = new Delivery("Hipolito Yrigoyen 3737")

		val Pedido nuevoPedido = unCliente.hacerPedido(platosPedidosMock, "Mucho queso!", deliveryACasa)

		assertTrue(nuevoPedido.cliente == unCliente)

	}

}
