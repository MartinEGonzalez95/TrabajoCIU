package dominoPizzeriaTest

import dominoPizzeria.Ingrediente
import dominoPizzeria.Menu
import dominoPizzeria.Pizza
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*
import static org.mockito.Mockito.*
import org.mockito.Mock

class TestMenu {

	Menu menu

	@Mock
	Ingrediente ingredienteMock

	@Mock
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

		menu.agregarAdicional(ingredienteMock)

		assertFalse(menu.ingredientesAdicionales.isEmpty())
	}

	@Test
	def seTieneUnMenuSinPizasYSeLeAgregaUnaPizza() {

		menu.agregarPizza(pizzaMock)

		assertFalse(menu.pizzas.isEmpty())
	}

	@Test
	def seTieneUnMenuConPizasYSeLeQuitaEstaPizza() {

		menu.agregarPizza(pizzaMock)
		menu.eliminarPizza(pizzaMock)

		assertTrue(menu.pizzas.isEmpty())
	}

	@Test
	def seTieneUnMenuConUnAdicionalYSeLeQuitaEste() {


		menu.agregarAdicional(ingredienteMock)
		menu.eliminarAdicional(ingredienteMock)

		assertTrue(menu.pizzas.isEmpty())
	}

	@Test
	def DadoUnMenuCon2PizzasUnaDeTomateDe70PesosYOtraMuzzarellaDe90SeLeModificaElPrecioALaDeTomateA100Pesos() {

		val pizzaConMuzarrella = mock(Pizza)
		when(pizzaConMuzarrella.nombre).thenReturn("Muzzarella")

		val pizzaConTomate = mock(Pizza)
		when(pizzaConTomate.nombre).thenReturn("Tomate")

		menu.agregarPizza(pizzaConMuzarrella)
		menu.agregarPizza(pizzaConTomate)

		menu.modificarPrecioDePizza(pizzaConTomate, 100)

		verify(pizzaConTomate).precio = 100

	}

	@Test
	def DadoUnMenuCon2AdicionalesUnTomateDeValor15PesosYJamonDe30SeLeModificaElPrecioAJamonA35Pesos() {

		val adicionalJamon = mock(Ingrediente)
		when(adicionalJamon.nombre).thenReturn("Jamon")

		val adicionalTomate = mock(Ingrediente)
		when(adicionalTomate.nombre).thenReturn("Tomate")

		menu.agregarAdicional(adicionalJamon)
		menu.agregarAdicional(adicionalTomate)

		menu.modificarPrecioDeAdicional(adicionalJamon, 35)

		verify(adicionalJamon).precio = 35

	}

}
