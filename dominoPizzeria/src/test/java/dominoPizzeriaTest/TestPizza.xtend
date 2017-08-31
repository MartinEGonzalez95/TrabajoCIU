package dominoPizzeriaTest

import dominoPizzeria.Ingrediente
import static org.junit.Assert.*
import dominoPizzeria.Pizza
import org.junit.*

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
	def dadaUnaPizzaSeLeAgregaUnIngrediente()
	{
		
		muzza.agregarIngrediente(ingredienteMuzza)

		assertTrue(muzza.ingredientes.isEmpty())
		
	}

}
