package dominoPizzeria

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.HashMap
import java.util.Map

@Accessors
class Tamanio
{

	String nombre
	Map<String, Double> valor = new HashMap<String, Double>()
	
	new(String nombreTamaño)
	{
		
		nombre = nombreTamaño
		
		valor.put("Porcion", 0.125)
		valor.put("Chica", 0.5)
		valor.put("Grande", 1.0)
		valor.put("Familiar", 1.25)
		
	}

	def double getValor()
	{
		
		valor.get(nombre)
		
	}
	
	override toString()
	{
		
		nombre
		
	}

}
