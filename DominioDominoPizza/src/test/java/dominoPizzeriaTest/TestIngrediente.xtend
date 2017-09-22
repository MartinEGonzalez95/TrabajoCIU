package dominoPizzeriaTest

import org.junit.Test
import static org.junit.Assert.*
import dominoPizzeria.Ingrediente

class TestIngrediente
{
	
	@Test
	def test01DadoUnIngredienteDePrecioDiezPesosSiEsDistribuidoEnSoloUnaZonaSuPrecioEsElUnitario()
	{
		
		val Ingrediente ingredienteDeDiezPesos = new Ingrediente()
		
		ingredienteDeDiezPesos.distribucion = "Izquierda"
		ingredienteDeDiezPesos.precio = 10 // pesos //
		
		
		assertEquals(ingredienteDeDiezPesos.precio, 10 /* pesos */)
		
	}
	
	@Test
	def test02DadoUnIngredienteDePrecioDiezPesosSiEsDistribuidoEnTodaLaPizzaSuPrecioEsElDoble()
	{
		
		val Ingrediente ingredienteDeDiezPesos = new Ingrediente()
		
		ingredienteDeDiezPesos.distribucion = "Toda"
		ingredienteDeDiezPesos.precio = 10 // pesos //
		
		
		assertEquals(ingredienteDeDiezPesos.precio, 20 /* pesos */)
		
	}
	
}