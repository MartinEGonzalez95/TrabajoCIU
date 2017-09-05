package dominoPizzeriaTest

import dominoPizzeria.Ingrediente
import dominoPizzeria.Pizza
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*

class TestPizza {
	/**
	 * Una pizza está determinada por
	 * @Nombre
	 * @Ingredientes ,es una lista de Ingredientes
	 * 
	 *  
	 */
	Pizza muzza
	Ingrediente ingredienteMuzza

	@Before
	def void setUp() {
		muzza = new Pizza("Muzza")
		ingredienteMuzza = new Ingrediente("Muzzarella", "Completa", 15) // 15 pesitos
	}

	@Test
	def seTieneUnaPizzaMozzarellaConUnIngrediente() {

		muzza.agregarIngrediente(ingredienteMuzza)

		assertTrue(muzza.ingredientes.isEmpty())

	}

}
