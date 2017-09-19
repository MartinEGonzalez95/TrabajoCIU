package arenaDesktop.arenaDesktop.ui

import arenaDesktop.arenaDesktop.model.ControladorPedido

import dominoPizzeria.Plato

import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class VerEditarPedidoAbiertoWindow extends TransactionalDialog<ControladorPedido> 
{
	
	new(WindowOwner owner, ControladorPedido controladorPedidoModel)
	{
		
	super(owner, controladorPedidoModel)
	title = "Probando"
	
	}
	
	override protected createFormPanel(Panel mainPanel)
	{
		
		val form = new Panel(mainPanel).layout = new ColumnLayout(2)
		 
		new Label(form) => [
			
			text = "Estado"
			alignLeft
			
		]

		new TextBox(form) => [
			
			value <=> "pedidoSeleccionado.estadoDePedido"
			width = 200
			alignRight
			
		]
		
		new Label(form) => [
			
			text = "Platos"
			alignLeft
			
		]

		new Table<Plato>(mainPanel, typeof(Plato)) => [
			items <=> "pedidoSeleccionado.platos"
			numberVisibleRows = 3
			width = 300
			value <=> "platoSeleccionado"
		]
		
	}
	

}

// ----------------------------------------------------------------------------------------------------//
// 									¡¡¡BORRAR CUANDO JUNTEMOS!!!									   //	
// ----------------------------------------------------------------------------------------------------//




