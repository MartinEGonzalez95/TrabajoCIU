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
class Pedido {

	List<Plato> platos = newArrayList
	Cliente cliente
	Date fechaDeCreacion = new Date()
	Date fechaDeEntrega
	String aclaraciones = " "
	EstadoDePedido estadoDePedido = new Preparando
	FormaDeEnvio formaDeEnvio
	long tiempoDeEspera = 0
	MailSender mailSender = new MailSender("ciu.dominos.pizza@gmail.com", "interfaces2017")
	// Para mandar mails cuando cambia de estado //
	Integer numero // Clave para el pedido //

	def double montoFinal() {

		platos.stream.mapToDouble( [plato|plato.precio]).sum + formaDeEnvio.costo
	// pesos //
	}

	def setTiempoDeEspera(){
		
		this.tiempoDeEspera = tiempoDeEspera()
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

		var minutos = ((this.tiempoDeEspera) / 60000)

		minutos > 30

	}

}
