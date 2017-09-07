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

	new(List<Plato> platos, Cliente cliente, Date fechaDeCreacion, Date fechaDeEntrega, String aclaraciones,
		FormaDeEnvio formaDeEnvio) {

		this.platos = platos
		this.cliente = cliente
		this.fechaDeCreacion = fechaDeCreacion
		this.fechaDeEntrega = fechaDeEntrega
		this.aclaraciones = aclaraciones
		this.formaDeEnvio = formaDeEnvio
		this.estadoDePedido = new Preparando
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

	def cancelar(){
		estadoDePedido.cancelarPedido(this)
	}

}
