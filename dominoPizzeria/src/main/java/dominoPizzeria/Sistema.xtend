package dominoPizzeria

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.*

@Accessors
class Sistema
{
	
	ArrayList<Cliente> clientes = new ArrayList()

	def registrarCliente(Cliente unNuevoCliente)
	{
		
		if (existeUnClienteConInformacionDe(unNuevoCliente))
		{
			
			throw new RuntimeException("Nick o Mail ya utilizado!")
			
		}
		else
		{
			
			clientes.add(unNuevoCliente)
		
		}
		
	}
	
	def private existeUnClienteConInformacionDe(Cliente unNuevoCliente)
	{
		
		for (Cliente clienteYaRegistrado : clientes)
		{
			
			if (clienteYaRegistrado.nick == unNuevoCliente.nick || clienteYaRegistrado.email == unNuevoCliente.email)
			{
				
				return true
				
			}
			
		}
		
		return false
		
	}
	
}