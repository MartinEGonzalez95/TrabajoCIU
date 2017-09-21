package repositorios

import dominoPizzeria.Ingrediente

import java.util.Map
import java.util.HashMap

class RepoIngrediente implements Repo<Ingrediente>
{
	
	Map<String, Ingrediente> repositorio = new HashMap<String, Ingrediente>()

	override agregar(Ingrediente ingrediente)
	{
		
		repositorio.put(ingrediente.nombre,ingrediente)
		
	}

	override eliminar(Ingrediente ingrediente)
	{
		
		repositorio.remove(ingrediente.nombre)
		
	}

	override Ingrediente buscar(String nombre)
	{
		
		repositorio.get(nombre)
		
	}
	
	// No deberia ser usado //
	
	override buscar(Integer claveInteger)
	{
		 
	}

}