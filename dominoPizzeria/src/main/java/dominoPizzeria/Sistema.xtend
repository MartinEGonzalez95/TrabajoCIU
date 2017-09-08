package dominoPizzeria

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Sistema
{
	
	ArrayList<ClienteRegistrado> clientes = new ArrayList()

	def registrarCliente(ClienteRegistrado unNuevoCliente)
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
	
	def private existeUnClienteConInformacionDe(ClienteRegistrado unNuevoCliente)
	{
		
		for (ClienteRegistrado clienteYaRegistrado : clientes)
		{
			
			if (clienteYaRegistrado.nick == unNuevoCliente.nick || clienteYaRegistrado.email == unNuevoCliente.email)
			{
				
				return true
				
			}
			
		}
		
		return false
		
	}
	
}