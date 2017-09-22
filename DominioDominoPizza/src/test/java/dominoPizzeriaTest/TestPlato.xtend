package dominoPizzeriaTest

import dominoPizzeria.Ingrediente
import dominoPizzeria.Pizza
import dominoPizzeria.Plato
import dominoPizzeria.Tamanio
import org.junit.Test

import static org.junit.Assert.*

class TestPlato
{

	@Test
	def test01DadoUnPlatoConUnaPizzaDeMuzarellaDeCienPesosDeTamañoGrandeSinExtrasTieneUnPrecioDeCienPesos()
	{
		
		val Pizza unaPizzaDeMuzarellaDeCienPesos = new Pizza()
		unaPizzaDeMuzarellaDeCienPesos.precioBase = 100 // pesos //
		
		val Tamanio tamañoGrande = new Tamanio("Grande")
		
		val Plato unPlatoNuevo = new Plato()
		unPlatoNuevo.pizzaBase = unaPizzaDeMuzarellaDeCienPesos
		unPlatoNuevo.tamañoPizza = tamañoGrande
		
		// $100 * 1 + $0 //
		assertEquals(unPlatoNuevo.precio, 100 /* pesos */, 0)

	}
	
	@Test
	def test02DadoUnPlatoConUnaPizzaDeMuzarellaDeCienPesosDeTamañoChicaConExtraJamonDeValorDiezPesosUbicadoEnTodaLaPizzaTieneUnPrecioDeCincuentaYCincoPesos()
	{
		
		val Pizza unaPizzaDeMuzarellaDeCienPesos = new Pizza()
		unaPizzaDeMuzarellaDeCienPesos.precioBase = 100 // pesos //
		
		val Tamanio tamañoChica = new Tamanio("Chica")
		
		val Ingrediente jamonExtra = new Ingrediente()
		jamonExtra.distribucion = "Toda"
		jamonExtra.precio = 10 // pesos //
		
		val Plato unPlatoNuevo = new Plato()
		unPlatoNuevo.pizzaBase = unaPizzaDeMuzarellaDeCienPesos
		unPlatoNuevo.tamañoPizza = tamañoChica
		unPlatoNuevo.agregarAdicional(jamonExtra)
		
		// $70 * 0.5 + $20 //
		assertEquals(unPlatoNuevo.precio, 55 /* pesos */, 0)		
		
	}
	
	/*
	 *
	 *  TENER EN CUENTA QUE FALTA PROBAR LOS TAMAÑOS PORCION Y FAMILIAR
	 *  
	 */
	
}
