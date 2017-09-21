package repositorios

import dominoPizzeria.Cliente
import java.util.HashMap
import java.util.Map

class RepoCliente implements Repo<Cliente>
{
	
	Map<String, Cliente> repositorio = new HashMap<String, Cliente>()

	override agregar(Cliente cliente)
	{
		
		repositorio.put(cliente.email,cliente)
		
	}

	override eliminar(Cliente cliente)
	{
		
		repositorio.remove(cliente.email)
		
	}

	override Cliente buscar(String email)
	{
		
		repositorio.get(email)
		
	}
	
	// No deberia ser usado //
	
	override buscar(Integer claveInteger)
	{
		 
	}
	
	override cargar()
	{
		
		repositorio.values.toList
		
	}

}
