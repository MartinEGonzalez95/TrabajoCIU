package dominoPizzeriaTest

import static org.junit.Assert.*

import org.junit.Test
import dominoPizzeria.Cliente

class TestCliente {
	/**
	 * 
	 * 
	 * @Nombre
	 * @Nick
	 * @Password
	 * @Email
	 * @Dirección

	 * Se debe verificar que no exista más de un cliente con el mismo nick o email.
	 *  
	 */
	Cliente pepito

	@Test
	def seCreaUnNuevoCliente() {

		pepito = new Cliente("pepito", "pepitoElMasCapito", "1235", "pepitOP@gmail.com", "calle falsa 123")

		assertEquals("pepito", pepito.nombre)
		assertEquals("pepitoElMasCapito", pepito.nick)
		assertEquals("1235", pepito.contraseña)
		assertEquals("pepitOP@gmail.com", pepito.email)
		assertEquals("calle falsa 123", pepito.direccion)

	}

}
