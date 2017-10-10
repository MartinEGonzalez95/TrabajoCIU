package domino.APIREST

import dominoPizzeria.Pedido
import dominoPizzeria.Tamanio
import java.util.ArrayList
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
import repositorios.RepoIngrediente
import repositorios.RepoPizza
import repositorios.RepoPedido

@Controller
class DominoRestAPI
{
	
	extension JSONUtils = new JSONUtils

//	private def getErrorJson(String message) {
//		'{ "error": "' + message + '" }'
//	}

	@Get("/pedidos")
	def getPedidos()
	{
		
		response.contentType = ContentType.APPLICATION_JSON

		return ok(RepoPedido.getRepo.cargar().toJson)
		
	}
	
	@Get("/promos")
	def getPromos()
	{
		
		response.contentType = ContentType.APPLICATION_JSON

		return ok(RepoPizza.getRepo.cargar().toJson)
		
	}
	
	@Get("/tamanios")
	def getTamanios(String nombre)
	{
		
		response.contentType = ContentType.APPLICATION_JSON
		
		val tamanios = new ArrayList<Tamanio>
		tamanios.add(new Tamanio("Porcion"))
		tamanios.add(new Tamanio("Chica"))
		tamanios.add(new Tamanio("Grande"))
		tamanios.add(new Tamanio("Familiar"))
		
		return ok(tamanios.toJson)
	}

	@Get("/ingredientes")
	def getIngredientes(String nombre)
	{
		
		response.contentType = ContentType.APPLICATION_JSON

		return ok(RepoIngrediente.getRepo.search(nombre).toJson)
		
	}

	@Post("/pedidos")
	def postPedido(@Body String bodyConPedido)
	{
		
		response.contentType = ContentType.APPLICATION_JSON
		
		val pedido = bodyConPedido.fromJson(Pedido)

		if (pedido === null)
		{
			
            return badRequest()
            
        } else
        {
            RepoPedido.repo.agregar(pedido)
            return ok()
        }
		
	}
	
	@Get("/pedidos:numero")
	def getPedidoConNumero()
	{
		
		response.contentType = ContentType.APPLICATION_JSON
		
		val pedido = RepoPedido.repo.search(numero)
		
		if (pedido === null)
		{
			
            return notFound()
            
        } else
        {
        	
            return ok(pedido.toJson)
            
        }
	}

}
