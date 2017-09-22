package dominoPizzeria

import estadosDePedido.EstadoDePedido
import estadosDePedido.Preparando
import formaDeEnvioPedido.FormaDeEnvio
import java.util.Date
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.TransactionalAndObservable

@Accessors
@TransactionalAndObservable
class Pedido
{

	List<Plato> platos = newArrayList
	Cliente cliente
	Date fechaDeCreacion = new Date()
	Date fechaDeEntrega
	String aclaraciones
	EstadoDePedido estadoDePedido = new Preparando
	FormaDeEnvio formaDeEnvio
	
	MailSender mailSender = new MailSender("ciu.dominos.pizza@gmail.com", "interfaces2017") 
	// Para mandar mails cuando cambia de estado //
	
	Integer numero // Clave para el pedido //
	
	def double montoFinal()
	{
		
		platos.stream.mapToDouble( [ plato | plato.precio ] ).sum + formaDeEnvio.costo
		// pesos //
		
	}

		
		 tiempoDeEspera = fechaDeEntrega.time - fechaDeCreacion.time

//		tiempoDeEspera = String.format("%02d:%02d:%02d", 
//		TimeUnit.MILLISECONDS.toHours(milisegundos),
//		TimeUnit.MILLISECONDS.toMinutes(milisegundos) -  
//		TimeUnit.HOURS.toMinutes(TimeUnit.MILLISECONDS.toHours(milisegundos)), 
//		TimeUnit.MILLISECONDS.toSeconds(milisegundos) - 
//		TimeUnit.MINUTES.toSeconds(TimeUnit.MILLISECONDS.toMinutes(milisegundos))); 
		
	}

	def avanzar()
	{

		estadoDePedido.avanzarPedido(this)
		
	}

	def retroceder()
	{
		
		estadoDePedido.retrocederPedido(this)
		
	}

	def cancelar()
	{
		
		estadoDePedido.cancelarPedido(this)
		
	}

	def hayMasDe30MinDeDiferenciaEntre()
	{

		var minutos = ((fechaDeEntrega.getTime() - fechaDeCreacion.getTime()) / 60000)

		minutos > 30
		
	}

}