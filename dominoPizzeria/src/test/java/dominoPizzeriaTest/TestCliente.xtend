package dominoPizzeriaTest

import static org.junit.Assert.*
import org.junit.Test
import static org.mockito.Mockito.*
import java.util.ArrayList
import dominoPizzeria.Plato
import dominoPizzeria.Cliente
import dominoPizzeria.Pedido
import formaDeEnvioPedido.FormaDeEnvio
import formaDeEnvioPedido.Delivery

class TestCliente
{

	Plato platoPedidoMock = mock(Plato)

	ArrayList<Plato> platosPedidosMock = new ArrayList<Plato>
	
	@Test
	def unClienteRealizarUnPedidoYEstaIncluidoEnElMismo()
	{
	
		platosPedidosMock.add(platoPedidoMock)
		
		val Cliente unCliente = new Cliente("Martin", "MEG", "1234", "martinegonzalez95@gmail", "Hipolito Yrigoyen 3737")
		
		val FormaDeEnvio deliveryACasa = new Delivery("Hipolito Yrigoyen 3737")
		
		val Pedido nuevoPedido = unCliente.hacerPedido(platosPedidosMock, "Mucho queso!", deliveryACasa)
		
		assertTrue(nuevoPedido.cliente == unCliente)
		
	}

}
