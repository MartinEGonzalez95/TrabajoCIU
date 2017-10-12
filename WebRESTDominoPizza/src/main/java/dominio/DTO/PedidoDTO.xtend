package dominio.DTO

import java.util.List
import dominoPizzeria.Plato
import dominoPizzeria.Cliente
import java.util.Date
import formaDeEnvioPedido.FormaDeEnvio
import dominoPizzeria.MailSender
import dominoPizzeria.Pedido
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class PedidoDTO {
	List<Plato> platos = newArrayList
	String nickCliente
	Date fechaDeCreacion = new Date()
	Date fechaDeEntrega
	long tiempoDeEspera = 0
	String aclaraciones = " "
	String estadoDePedidoDTO
	FormaDeEnvio formaDeEnvio
	MailSender mailSender = new MailSender("ciu.dominos.pizza@gmail.com", "interfaces2017")
	Integer numero // Clave para el pedido //
	
	new(Pedido pedido){
		
		platos = pedido.platos
		nickCliente = pedido.cliente.nick
		fechaDeCreacion = pedido.fechaDeCreacion
		fechaDeEntrega = pedido.fechaDeEntrega
		tiempoDeEspera = pedido.tiempoDeEspera()
		aclaraciones = pedido.aclaraciones
		estadoDePedidoDTO = pedido.estadoDePedido.toString
		
	}
	
	
	
}