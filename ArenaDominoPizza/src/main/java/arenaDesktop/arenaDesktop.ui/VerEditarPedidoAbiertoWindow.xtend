package arenaDesktop.arenaDesktop.ui

import arenaDesktop.arenaDesktop.model.ControladorPedido
import dominoPizzeria.Plato
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.arena.layout.*
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import dominoPizzeria.Pizza
import dominoPizzeria.Tamanio

class VerEditarPedidoAbiertoWindow extends TransactionalDialog<ControladorPedido> 
{
	
	new(WindowOwner owner, ControladorPedido controladorPedidoModel)
	{
		
	super(owner, controladorPedidoModel)
	title = "Probando"
	
	}
	
	override protected createFormPanel(Panel mainPanel)
	{
		
		val panelEstados = new Panel(mainPanel)
		panelEstados.layout = new HorizontalLayout()
		 
		new Label(panelEstados) => [
			
			text = "Estado"
			alignLeft
			
		]

		new TextBox(panelEstados) => [
			
			value <=> "pedido.estadoDePedido"
			width = 200
			alignCenter
			
		]
		
		new Label(mainPanel) => [
			
			text = "Platos"
			alignLeft
			
		]
		
		val panelPlatos = new Panel(mainPanel)
		panelPlatos.layout = new HorizontalLayout()

val tablaPlatos = new Table<Plato>(panelPlatos, typeof(Plato)) => [
			
			items <=> "platos"
			value <=> "platoSeleccionado"
			
			numberVisibleRows = 2
			
		]
		
		new Button(panelPlatos) => [
			
			caption = "Agregar"
			onClick([|new VerEditarPlatoWindow(this, modelObject.platoSeleccionado)])
			
			alignRight
		]
		
		this.ordenarTablaPlatos(tablaPlatos)
		
	}
	
	def void ordenarTablaPlatos(Table<Plato> table)
	{
			
			new Column<Plato>(table) => [
				title = "Nombre"
				bindContentsToProperty("pizzaBase").transformer = [Pizza pizzaBase | pizzaBase.nombre]
				fixedSize = 200
			]
			
			new Column<Plato>(table) => [
				title = "Tamaño"
				bindContentsToProperty("tamañoPizza").transformer = [Tamanio tamanio | tamanio.nombre]
				fixedSize = 100
			]
			
			new Column<Plato>(table) => [
				title = "Precio"
				bindContentsToProperty("precio")
				fixedSize = 50
			]
	
	}

}

// ----------------------------------------------------------------------------------------------------//
// 									¡¡¡BORRAR CUANDO JUNTEMOS!!!									   //	
// ----------------------------------------------------------------------------------------------------//




