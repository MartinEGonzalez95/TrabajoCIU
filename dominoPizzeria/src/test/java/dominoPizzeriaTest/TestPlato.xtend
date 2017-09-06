package dominoPizzeriaTest

import static org.junit.Assert.*
import org.junit.*
import static org.mockito.Mockito.*;
import dominoPizzeria.*
import tamanio.Tamanio

class TestPlato {

	Pizza pizzaMock
	float valorDePizzaMock
	Ingrediente tomate

	Plato platoDeMuzzaPorcion

	Tamanio grande
	Tamanio porcion
	Tamanio familiar
	Tamanio chica

	@Before
	def void setUp() {

		porcion = new Tamanio("Porcion", 0.125 as float)
		familiar = new Tamanio("Familiar", 1.25 as float)
		chica = new Tamanio("Chica", 0.5 as float)
		grande = new Tamanio("Grande", 1 as float)
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
		when(pizzaMock.precio).thenReturn(25 as float)

		val porcionMuzzaConTomate = new Plato(pizzaMock, porcion, newArrayList)

		porcionMuzzaConTomate.agregarAdicional(tomate)

		assertEquals(18.125, porcionMuzzaConTomate.monto, 0)
	}
	
	
	
	
	
	
	
	

}
