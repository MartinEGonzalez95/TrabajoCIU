package dominio.DTO

import java.util.List
import dominoPizzeria.Plato
import dominoPizzeria.Cliente
import java.util.Date
import formaDeEnvioPedido.FormaDeEnvio
import dominoPizzeria.MailSender
import dominoPizzeria.Pedido
import org.eclipse.xtend.lib.annotations.Accessors
import estadosDePedido.EstadoDePedido
import domino.APIREST.FormaDeEnvioDTO

@Accessors
class PedidoDTO {
	List<Plato> platos = newArrayList
	String cliente
	Date fechaDeCreacion = new Date()
	String aclaraciones = " "
	EstadoDePedido estadoDePedido
	FormaDeEnvioDTO formaDeEnvio
	Integer numero // Clave para el pedido //
	
	new(){
		
	}
	
	new(Pedido pedido){
		
		platos = pedido.platos
		cliente = pedido.cliente.nick
		fechaDeCreacion = pedido.fechaDeCreacion
		aclaraciones = pedido.aclaraciones
		estadoDePedido = pedido.estadoDePedido
		formaDeEnvio = new FormaDeEnvioDTO => [ nombre = pedido.formaDeEnvio.nombre ]
		numero = pedido.numero
	}
	
	
	
}