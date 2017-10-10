package domino.APIREST

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
import repositorios.RepoPedido
import repositorios.RepoIngrediente
import domino.app.BootstrapWeb
import dominoPizzeria.Tamanio
import java.util.ArrayList

@Controller
class DominoRestAPI {
	extension JSONUtils = new JSONUtils
	



	@Get("/ingredientes")
	def getIngredientes(String nombre){
		response.contentType = ContentType.APPLICATION_JSON
		
		
		return ok(RepoIngrediente.getRepo.search(nombre).toJson)
	} 
	
	@Get("/tamanios")
	def getTamanios(String nombre){
		response.contentType = ContentType.APPLICATION_JSON
		
		val tamanios = new ArrayList<Tamanio>
		tamanios.add(new Tamanio("Porcion"))
		tamanios.add(new Tamanio("Chica"))
		tamanios.add(new Tamanio("Grande"))
		tamanios.add(new Tamanio("Familiar"))
		
		return ok(tamanios.toJson)
	}



//	@Get("/pedidos")
//	def getPedidos(String numero) {
//
//		response.contentType = ContentType.APPLICATION_JSON
//
//		return ok(RepoPedido.getRepo.search(numero).toJson)
//	}
	
	

}
