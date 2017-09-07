package dominoPizzeriaTest

import static org.junit.Assert.*
import org.junit.Test
import static org.mockito.Mockito.*
import java.util.ArrayList
import dominoPizzeria.Plato
import dominoPizzeria.Cliente
import dominoPizzeria.Pedido

class TestCliente
{

	Plato platoPedidoMock = mock(Plato)

	ArrayList<Plato> platosPedidosMock = new ArrayList<Plato>
	
	@Test
	def unClienteRealizarUnPedidoConRetiroPorElLocalYSeEncuentraRegistradoEnSuHistorial()
	{
	
		platosPedidosMock.add(platoPedidoMock)
		
		val Cliente unCliente = new Cliente("Martin", "MEG", "1234", "martinegonzalez95@gmail", "Hipolito Yrigoyen 3737")
		
		val Pedido nuevoPedido = unCliente.hacerPedidoConRetiroPorElLocal(platosPedidosMock, "Mucho queso!")
		
		assertTrue(unCliente.historialDePedidos.contains(nuevoPedido))
		
	}
	
	@Test
	def unClienteRealizarUnPedidoConDeliveryYSeEncuentraRegistradoEnSuHistorial()
	{
	
		platosPedidosMock.add(platoPedidoMock)
		
		val Cliente unCliente = new Cliente("Martin", "MEG", "1234", "martinegonzalez95@gmail", "Hipolito Yrigoyen 3737")
		
		val Pedido nuevoPedido = unCliente.hacerPedidoConDelivery(platosPedidosMock, "Mucho queso!")
		
		assertTrue(unCliente.historialDePedidos.contains(nuevoPedido))
		
	}

}
