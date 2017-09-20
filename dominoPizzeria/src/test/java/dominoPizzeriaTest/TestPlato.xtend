package dominoPizzeriaTest

import dominoPizzeria.Ingrediente
import dominoPizzeria.Pizza
import dominoPizzeria.Plato
import org.junit.Before
import org.junit.Test
import org.mockito.Mock
import org.mockito.MockitoAnnotations

import dominoPizzeria.Tamanio

import static org.junit.Assert.*
import static org.mockito.Mockito.*

class TestPlato {

	float valorDePizzaMock

	Plato platoDeMuzzarellaPorcion
	Plato platoDeMuzzaGrande

	Tamanio porcion
	Tamanio grande
	Tamanio familiar

	@Mock
	Ingrediente jamonMockeado

	@Mock
	Pizza pizzaDeMuzarellaMockeada

	@Before
	def void setUp() {
		MockitoAnnotations.initMocks(this) // esto "inicializa" los mocks
		porcion = new Tamanio("Porcion", 0.125 as float)
		grande = new Tamanio("Grande", 1 as float)
		familiar = new Tamanio("Familiar", 1.25 as float)

		platoDeMuzzarellaPorcion = new Plato(pizzaDeMuzarellaMockeada, porcion, newArrayList)
		platoDeMuzzaGrande = new Plato(pizzaDeMuzarellaMockeada, grande, newArrayList)

	}

	@Test
	def void seTieneUnaPorcionDePizzaDeCincuentaPesosYSinIngredientesExtras() {

		valorDePizzaMock = 50
		when(pizzaDeMuzarellaMockeada.precio).thenReturn(valorDePizzaMock);

		assertEquals(6.25, platoDeMuzzarellaPorcion.monto, 0)

	}

	@Test
	def seTieneUnaPizzaDeMuzarrellaDePrecioBaseCienPesosTamañoFamiliarConElAgregadoDeJamonQueVale30PesosElTotalEsDe155Pesos() {

		val familiar = new Tamanio("Familiar", 1.25 as float)

		valorDePizzaMock = 100
		when(pizzaDeMuzarellaMockeada.precio).thenReturn(valorDePizzaMock)
		when(jamonMockeado.precio).thenReturn(30)

		platoDeMuzzaGrande.agregarAdicional(jamonMockeado)
		platoDeMuzzaGrande.cambiarTamanio(familiar)

		assertEquals(155, platoDeMuzzaGrande.monto, 0)

	}

	@Test
	def seTieneUnaPizzaDeCienPesosConUnAdicionalSeLeQuitaUnoEntoncesNoTieneAdicionalesSuPrecioEsDeCienPesos() {

		valorDePizzaMock = 100
		when(pizzaDeMuzarellaMockeada.precio).thenReturn(valorDePizzaMock);

		platoDeMuzzaGrande.agregarAdicional(jamonMockeado)

		platoDeMuzzaGrande.eliminarAdicional(jamonMockeado)

		assertEquals(100, platoDeMuzzaGrande.monto, 0)

	}

}
