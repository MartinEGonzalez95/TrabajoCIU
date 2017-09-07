package dominoPizzeriaTest

import static org.junit.Assert.*
import org.junit.*
import static org.mockito.Mockito.*;
import dominoPizzeria.*
import dominoPizzeria.Ingrediente
import dominoPizzeria.Pizza

class TestMenu {

	Menu menu

	Ingrediente ingredienteMock

	Pizza pizzaMock

	@Before
	def void setUp() {

		menu = new Menu(newArrayList, newArrayList)
	}

	@Test
	def seTieneUnMenuSinAdicionalesNiPizzas() {

		assertTrue(menu.ingredientesAdicionales.isEmpty())
		assertTrue(menu.pizzas.isEmpty())
	}

	@Test
	def seTieneUnMenuSinAdicionalesYSeLeAgregaUnAdicional() {

		ingredienteMock = mock(Ingrediente)

		menu.agregarAdicional(ingredienteMock)

		assertFalse(menu.ingredientesAdicionales.isEmpty())
	}

	@Test
	def seTieneUnMenuSinPizasYSeLeAgregaUnaPizza() {

		pizzaMock = mock(Pizza)

		menu.agregarPizza(pizzaMock)

		assertFalse(menu.pizzas.isEmpty())
	}

	@Test
	def seTieneUnMenuConPizasYSeLeQuitaEstaPizza() {

		pizzaMock = mock(Pizza)
		menu.agregarPizza(pizzaMock)
		menu.eliminarPizza(pizzaMock)

		assertTrue(menu.pizzas.isEmpty())
	}

	@Test
	def seTieneUnMenuConUnAdicionalYSeLeQuitaEste() {

		ingredienteMock = mock(Ingrediente)
		menu.agregarAdicional(ingredienteMock)
		menu.eliminarAdicional(ingredienteMock)

		assertTrue(menu.pizzas.isEmpty())
	}

}
