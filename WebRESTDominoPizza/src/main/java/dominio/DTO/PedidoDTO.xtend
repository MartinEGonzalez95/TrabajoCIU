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

@Accessors
class PedidoDTO {
	List<Plato> platos = newArrayList
	String cliente
	Date fechaDeCreacion = new Date()
	String aclaraciones = " "
	EstadoDePedido estadoDePedido
	FormaDeEnvio formaDeEnvio
	Integer numero // Clave para el pedido //
	
	new(){
		
	}
	
	new(Pedido pedido){
		
		platos = pedido.platos
		cliente = pedido.cliente.nick
		fechaDeCreacion = pedido.fechaDeCreacion
		aclaraciones = pedido.aclaraciones
		estadoDePedido = pedido.estadoDePedido
		formaDeEnvio = pedido.formaDeEnvio
		numero = pedido.numero
	}
	
	
	
}