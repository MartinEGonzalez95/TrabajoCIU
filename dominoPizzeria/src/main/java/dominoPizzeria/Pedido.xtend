package dominoPizzeria

import java.util.List
import java.util.Date
import org.eclipse.xtend.lib.annotations.Accessors
import estadosDePedido.EstadoDePedido
import formaDeEnvioPedido.FormaDeEnvio
import estadosDePedido.Preparando

@Accessors
class Pedido {

	List<Plato> platos
	Cliente cliente
	Date fechaDeCreacion
	Date fechaDeEntrega
	String aclaraciones
	EstadoDePedido estadoDePedido
	FormaDeEnvio formaDeEnvio
	MailSender mailSender

	new(List<Plato> platos, Cliente cliente, String aclaraciones, FormaDeEnvio formaDeEnvio) {

		this.platos = platos
		this.cliente = cliente
		this.fechaDeCreacion = new Date()
		this.fechaDeEntrega = new Date()
		this.aclaraciones = aclaraciones
		this.formaDeEnvio = formaDeEnvio
		this.estadoDePedido = new Preparando
		this.mailSender = new MailSender("ciu.dominos.pizza@gmail.com", "interfaces2017")

	}

	def float getMontoFinal() {
		var float monto = 0

		for (Plato plato : platos) {
			monto += plato.monto
		}
		monto + formaDeEnvio.costo
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

		var minutos = ((fechaDeEntrega.getTime() - fechaDeCreacion.getTime()) / 60000)

		var boolean bool = false

		if (minutos > 30) {
			bool = true
		}

		bool
	}

}
