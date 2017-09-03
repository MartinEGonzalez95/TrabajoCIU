package dominoPizzeriaTest

import dominoPizzeria.Ingrediente
import static org.junit.Assert.*
import dominoPizzeria.Pizza
import org.junit.*
import dominoPizzeria.Plato
import static org.mockito.Mockito.*;

class TestPlato {

	Pizza pizzaMock
	float valorDePizzaMock
	Ingrediente tomate

	Plato platoDeMuzzaPorcion

	Pizza pizzaPepita

	@Before
	def void setUp() {
	}

	@Test
	def void seTieneUnPlatoDePizzaMuzzarellaConTamañoGrandeYSinIngredientesExtras() {

		valorDePizzaMock = 25
		pizzaMock = mock(Pizza);
		when(pizzaMock.precio).thenReturn(valorDePizzaMock);

		platoDeMuzzaPorcion = new Plato(pizzaMock, "Grande") // una pizza, tamaño

		assertEquals(25, platoDeMuzzaPorcion.precio, 0)

	}

	@Test
	def void seTieneUnPlatoDePizzaMuzzarellaConTamañoGrandeYSinIngredientesExtras2() {

		var pizzaPepita = new Pizza("Muzzarella", 25)

		platoDeMuzzaPorcion = new Plato(pizzaPepita, "Grande")

		assertEquals(25, platoDeMuzzaPorcion.precio, 0)

	}

}
