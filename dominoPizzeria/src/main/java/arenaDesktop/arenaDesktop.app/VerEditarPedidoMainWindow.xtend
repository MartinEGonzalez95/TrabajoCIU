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
		
		unPedidoParaPrueba
		
	}
	
}
