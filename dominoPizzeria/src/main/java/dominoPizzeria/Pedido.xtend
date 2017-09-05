package dominoPizzeria

import java.util.List
import java.util.Date
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors

class Pedido {

	List<Plato> platos
	Cliente cliente
	Date fechaDeCreacion
	Date fechaDeEntrega
	String aclaraciones
	
	FormaDeEnvio formaDeEnvio

	// int montoFinal
	new(List<Plato> platos, Cliente cliente, Date fechaDeCreacion, Date fechaDeEntrega, String aclaraciones, FormaDeEnvio formaDeEnvio) {

		this.platos = platos
		this.cliente = cliente
		this.fechaDeCreacion = fechaDeCreacion
		this.fechaDeEntrega = fechaDeEntrega
		this.aclaraciones = aclaraciones
		this.formaDeEnvio = formaDeEnvio
	}

	def float getMontoFinal() {
		var float monto = 0
	
		for (Plato plato: platos){
		
			 monto += plato.precio
		
		}
		 monto + formaDeEnvio.costo //platos.get(0).precio	
	}	 
	
}
