package dominoPizzeriaTest

import dominoPizzeria.Ingrediente
import static org.junit.Assert.*
import dominoPizzeria.Pizza
import org.junit.*

import static org.mockito.Mockito.*;

class TestPizza {

	Pizza muzza
	Ingrediente ingredienteMuzza

	@Before
	def void setUp() {
		muzza = new Pizza("Muzzarella", 30, newArrayList)

	}

	@Test
	def seTieneUnaPizzaMozzarellaConUnIngrediente() {

		ingredienteMuzza = mock(Ingrediente)
		muzza.agregarIngrediente(ingredienteMuzza)

		assertFalse(muzza.ingredientes.isEmpty())

	}

	@Test
	def seTieneUnaPizzaMozzarellaConUnIngredienteYSeLoElimina() {

		ingredienteMuzza = mock(Ingrediente)

		muzza.agregarIngrediente(ingredienteMuzza)
		muzza.eliminarIngrediente(ingredienteMuzza)

		assertTrue(muzza.ingredientes.isEmpty())

	}

}
