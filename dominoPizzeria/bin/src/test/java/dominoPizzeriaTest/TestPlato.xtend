package dominoPizzeriaTest

import dominoPizzeria.Ingrediente
import static org.junit.Assert.*
import dominoPizzeria.Pizza
import org.junit.*
import dominoPizzeria.Plato
import static org.mockito.Mockito.*;
import dominoPizzeria.Tamanio

class TestPlato {

	Pizza pizzaMock
	float valorDePizzaMock

	Plato platoDeMuzzaPorcion

	
	Tamanio grande

	@Before
	def void setUp() {
		grande = new Tamanio("Grande",1)
		
	}

	@Test
	def void seTieneUnPlatoDePizzaMuzzarellaConTamañoGrandeYSinIngredientesExtras() {

		valorDePizzaMock = 25
		pizzaMock = mock(Pizza);
		when(pizzaMock.precio).thenReturn(valorDePizzaMock);

		

		platoDeMuzzaPorcion = new Plato(pizzaMock, grande) // una pizza, tamaño

		assertEquals(25, platoDeMuzzaPorcion.monto, 0)

	}



}
