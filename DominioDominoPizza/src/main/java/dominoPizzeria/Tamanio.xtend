package dominoPizzeria

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.HashMap
import java.util.Map

@Accessors
class Tamanio
{

	String nombre
	Map<String, Double> mapValorPorTamaño = new HashMap<String, Double>()
	
	new(String nombreTamaño)
	{
		
		nombre = nombreTamaño
		
		mapValorPorTamaño.put("Porcion", 0.125)
		mapValorPorTamaño.put("Chica", 0.5)
		mapValorPorTamaño.put("Grande", 1.0)
		mapValorPorTamaño.put("Familiar", 1.25)
		
	}

	def double getValor()
	{
		
		mapValorPorTamaño.get(nombre)
		
	}

}
