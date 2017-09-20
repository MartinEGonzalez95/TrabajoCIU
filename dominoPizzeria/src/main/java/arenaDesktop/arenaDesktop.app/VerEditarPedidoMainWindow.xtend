// ----------------------------------------------------------------------------------------------------//
// 									¡¡¡BORRAR CUANDO JUNTEMOS!!!									   //
// ----------------------------------------------------------------------------------------------------//

package arenaDesktop.arenaDesktop.app

import arenaDesktop.arenaDesktop.model.ControladorPedido
import arenaDesktop.arenaDesktop.ui.VerEditarPedidoAbiertoWindow
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import dominoPizzeria.Pedido
import dominoPizzeria.ClienteRegistrado
import formaDeEnvioPedido.RetiroPorLocal
import org.uqbar.arena.windows.Dialog
import dominoPizzeria.Tamanio
import dominoPizzeria.Plato
import dominoPizzeria.Pizza

class VerEditarPedidoMainWindow extends SimpleWindow<ControladorPedido>{
	
	new(WindowOwner parent)
	{
		
		super(parent, new ControladorPedido())
		
	}
	
	override protected addActions(Panel actionsPanel)
	{

	}
	
	override protected createFormPanel(Panel mainPanel)
	{
		
		new Button(mainPanel) => [
			
			caption = "Prueba"
			onClick([|this.probarVentana])
			
		]
		
	}
	
	def void probarVentana()
	{
		
		this.openDialog(new VerEditarPedidoAbiertoWindow(this, this.controladorDePedidoParaPrueba))
		
	}
	
	def openDialog(Dialog<?> dialog)
	{
		dialog.open
	}
	
	Pedido unPedidoParaPrueba
	Tamanio grande
	Plato muzzaGrande
	Pizza pizzaDeMuzarella
	
	def ControladorPedido controladorDePedidoParaPrueba()
	{
		
		new ControladorPedido(this.pedidoParaPrueba)
		
	}
	
	def Pedido pedidoParaPrueba()
	{
		
		unPedidoParaPrueba = new Pedido()
		
		unPedidoParaPrueba.setAclaraciones("Ninguna")
		unPedidoParaPrueba.setCliente(new ClienteRegistrado("1","2","3","2","3"))
		unPedidoParaPrueba.setFormaDeEnvio(new RetiroPorLocal())
		
		grande = new Tamanio("Grande", 1 as float)
		
		pizzaDeMuzarella = new Pizza("Pizza de Muzarella", 10, newArrayList)

		muzzaGrande = new Plato(pizzaDeMuzarella, grande, newArrayList)
		
		unPedidoParaPrueba.platos.add(muzzaGrande)
		
		unPedidoParaPrueba
		
	}
	
}
