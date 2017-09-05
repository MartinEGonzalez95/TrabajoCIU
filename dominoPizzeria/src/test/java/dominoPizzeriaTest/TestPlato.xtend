package dominoPizzeriaTest

import static org.junit.Assert.*
import org.junit.*
import static org.mockito.Mockito.*;
import dominoPizzeria.*
import tamanio.Porcion
import tamanio.Familiar
import tamanio.Chica
import tamanio.Grande

class TestPlato {

	Pizza pizzaMock
	float valorDePizzaMock
	Ingrediente tomate

	Plato platoDeMuzzaPorcion

	Pizza pizzaPepita

	Tamanio grande

	Tamanio porcion

	Tamanio familiar

	Tamanio chica

	@Before
	def void setUp() {

		val porcion = new Porcion(0.125 as float)
		val familiar = new Familiar(1.25 as float)
		val chica = new Chica(0.5 as float)
		val grande = new Grande(1 as float)
	}

	@Test
	def void seTieneUnPlatoDePizzaMuzzarellaConTamañoGrandeYSinIngredientesExtras() {

		valorDePizzaMock = 25
		pizzaMock = mock(Pizza)
		when(pizzaMock.precio).thenReturn(valorDePizzaMock)

		platoDeMuzzaPorcion = new Plato(pizzaMock, grande, newArrayList)
		assertEquals(25, platoDeMuzzaPorcion.monto, 0)

	}

	@Test
	def void seTieneUnaPorcionDeMuzarellaDe25PesosConTomatedePrecio15() {

		tomate = mock(Ingrediente)
		when(tomate.precio).thenReturn(15)

		pizzaMock = mock(Pizza)
		when(pizzaMock.precio).thenReturn(valorDePizzaMock)

		platoDeMuzzaPorcion = new Plato(pizzaMock, grande, newArrayList)
		val porcionMuzzaConTomate = new Plato(pizzaMock, porcion, newArrayList)

		porcionMuzzaConTomate.agregarAdicional(tomate)

		assertEquals(18.125, porcionMuzzaConTomate.monto, 1)
	}

}
