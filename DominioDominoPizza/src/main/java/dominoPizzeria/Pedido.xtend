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
class Pedido{

	List<Plato> platos = newArrayList
	Cliente cliente
	Date fechaDeCreacion = new Date()
	Date fechaDeEntrega
	long tiempoDeEspera = 0
	String aclaraciones = " "
	EstadoDePedido estadoDePedido = new Preparando
	FormaDeEnvio formaDeEnvio
	MailSender mailSender = new MailSender("ciu.dominos.pizza@gmail.com", "interfaces2017")
	// Para mandar mails cuando cambia de estado //
	Integer numero // Clave para el pedido //
	
	new(){
		
	}

	new(Integer numeroClave) {

		numero = numeroClave

	}

	def double montoFinal() {

		platos.stream.mapToDouble( [plato|plato.precio]).sum + formaDeEnvio.costo
	// pesos //
	}

	def setTiempoDeEspera() {

		tiempoDeEspera = tiempoDeEspera()

	}

	def tiempoDeEspera() {

		fechaDeEntrega.time - fechaDeCreacion.time

	}

	def avanzar() {

		estadoDePedido.avanzarPedido(this)

	}

	def retroceder() {

		estadoDePedido.retrocederPedido(this)

	}

	def cancelar() {

		estadoDePedido.cancelarPedido(this)

	}

	def hayMasDe30MinDeDiferenciaEntre() {

		( tiempoDeEspera() / 60000) > 30

	}

	def agregarPlato(Plato plato) {

		platos.add(plato)

	}

	def eliminarPlato(Plato plato) {

		platos.remove(plato)

	}

	def enviarMailPorDemora() {

		mailSender.enviarMail(cliente.email, "Disculpe la demora!",
			"Estimado cliente, le pedimos disculpas por la demora en su pedido, XOXO Domino's Pizza")

	}

	def enviarMailPorPedidoEnViaje() {

		mailSender.enviarMail(cliente.email, "Pedido en viaje!",
			"Estimado " + cliente.nombre + ", su pedido ya se encuentra en viaje, XOXO Domino's Pizza")

	}

}
