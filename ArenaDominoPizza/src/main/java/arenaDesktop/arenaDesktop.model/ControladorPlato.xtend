package arenaDesktop.arenaDesktop.model

import dominoPizzeria.Plato
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import dominoPizzeria.Tamanio
import java.util.List

@Accessors
@Observable
class ControladorPlato extends ControladorMenu
{
	
	Plato platoSeleccionado = null
	
	new(Plato unPlato)
	{
		
		platoSeleccionado = unPlato
			
	}
	
	def List<Tamanio> getTamaños()
	{
		
		val List<Tamanio> listaDeTamaños = newArrayList
		
		listaDeTamaños.add(new Tamanio("Porcion"))
		listaDeTamaños.add(new Tamanio("Chica"))
		listaDeTamaños.add(new Tamanio("Grande"))
		listaDeTamaños.add(new Tamanio("Familiar"))
		
		listaDeTamaños
		
	}
	
}
