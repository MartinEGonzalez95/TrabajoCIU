package dominoPizzeriaTest;

import static org.junit.Assert.*
import org.junit.Test
import static org.mockito.Mockito.*
import dominoPizzeria.Cliente
import dominoPizzeria.Sistema

class TestSistema
{
	
	Sistema unNuevoSistema
  
  	Cliente clienteMock = mock(Cliente)
  	Cliente clienteMockNickRepetido = mock(Cliente)
  	Cliente clienteMockEmailRepetido = mock(Cliente)
  	Cliente clienteConNuevaInformacion = mock(Cliente)
  
  	@Test
  	def unNuevoSistemaNoTieneClientes()
  	{
  	
  		unNuevoSistema = new Sistema()
  	
   		assertTrue(unNuevoSistema.clientes.isEmpty())
    
  	}
     
  	@Test
  	def unNuevoSistemaAgregaUnClienteYSeVerificaQueEsteDentroDeLosClientesDelSistema()
  	{
  	
  		unNuevoSistema = new Sistema()
  	
    	unNuevoSistema.registrarCliente(clienteMock)
    
    	assertTrue(unNuevoSistema.clientes.contains(clienteMock))

  	}

  	@Test(expected = RuntimeException)
  	def void unSistemaLanzaUnaExepcionCuandoSeQuiereRegistrarUnClienteConUnNickRepetido()
  	{
  	
  	  	unNuevoSistema = new Sistema()
    	
    	when(clienteMock.nick).thenReturn("martin95")
    	when(clienteMockNickRepetido.nick).thenReturn("martin95")
 		
 		unNuevoSistema.registrarCliente(clienteMock)

		unNuevoSistema.registrarCliente(clienteMockNickRepetido)
    
  }
  
  	@Test(expected = RuntimeException)
  	def void unSistemaLanzaUnaExepcionCuandoSeQuiereRegistrarUnClienteConEmailRepetido()
  	{
  		
  		unNuevoSistema = new Sistema()
    
    	when(clienteMock.email).thenReturn("martingonzalez@gmail.com")
		when(clienteMockEmailRepetido.email).thenReturn("martingonzalez@gmail.com")
		
		unNuevoSistema.registrarCliente(clienteMock)
    	unNuevoSistema.registrarCliente(clienteMockEmailRepetido)
    
  	}
  
  	@Test
  	def unSistemaRegistraUnClienteConNuevaInformacion()
  	{
  	
  		unNuevoSistema = new Sistema()
  		unNuevoSistema.registrarCliente(this.clienteMock)
  		
    	when(clienteMock.nick).thenReturn("martin95")
    	when(clienteMock.email).thenReturn("martingonzalez@gmail.com")
    	when(clienteConNuevaInformacion.nick).thenReturn("ciu2017")
    	when(clienteConNuevaInformacion.email).thenReturn("ciu@gmail.com")
    	
 		unNuevoSistema.registrarCliente(clienteConNuevaInformacion)
    	assertTrue(unNuevoSistema.clientes.contains(clienteConNuevaInformacion))
  
  	}
  
}
