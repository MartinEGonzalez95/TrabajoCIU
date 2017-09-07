package dominoPizzeriaTest

import dominoPizzeria.Pizza
import dominoPizzeria.Plato
import org.junit.Before
import org.junit.Test
import tamanio.Tamanio

import static org.junit.Assert.*
import static org.mockito.Mockito.*

class TestPlato {

	Pizza pizzaMock
	float valorDePizzaMock

	Plato platoDeMuzzaPorcion

	Tamanio grande

	@Before
	def void setUp() {
		grande = new Tamanio("Grande", 1)

	}

	@Test
	def void seTieneUnPlatoDePizzaMuzzarellaConTamañoGrandeYSinIngredientesExtras() {

		valorDePizzaMock = 25
		pizzaMock = mock(Pizza);
		when(pizzaMock.precio).thenReturn(valorDePizzaMock);

		platoDeMuzzaPorcion = new Plato(pizzaMock, grande,newArrayList) 
		assertEquals(25, platoDeMuzzaPorcion.monto, 0)

	}

}
