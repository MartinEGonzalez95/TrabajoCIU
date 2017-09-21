package repositorios

import dominoPizzeria.Pedido

import java.util.Map
import java.util.HashMap

class RepoPedido implements Repo<Pedido>
{
	
	Map<Integer, Pedido> repositorio = new HashMap<Integer, Pedido>()

	override agregar(Pedido pedido)
	{
		
		repositorio.put(pedido.numero,pedido)
		
	}

	override eliminar(Pedido pedido)
	{
		
		repositorio.remove(pedido.numero)
		
	}
	
	override Pedido buscar(Integer numero)
	{
		 
		 repositorio.get(numero)
		 
	}

	// No deberia ser usado //

	override buscar(String nombre)
	{
		
	}
	
	override cargar()
	{
		
		repositorio.values.toList
		
	}

}
