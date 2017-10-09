package domino.APIREST

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
import repositorios.RepoPedido
import repositorios.RepoIngrediente
import domino.app.BootstrapWeb

@Controller
class DominoRestAPI {
	extension JSONUtils = new JSONUtils
	



	@Get("/ingredientes")
	def getIngredientes(String nombre){
		response.contentType = ContentType.APPLICATION_JSON
		
		
		return ok(RepoIngrediente.getRepo.search(nombre).toJson)
	} 



//	@Get("/pedidos")
//	def getPedidos(String numero) {
//
//		response.contentType = ContentType.APPLICATION_JSON
//
//		return ok(RepoPedido.getRepo.search(numero).toJson)
//	}
	
	

}
