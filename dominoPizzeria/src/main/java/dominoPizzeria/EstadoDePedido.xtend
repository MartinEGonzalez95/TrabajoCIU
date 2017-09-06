package dominoPizzeria

interface EstadoDePedido {
	
	def void avanzarPedido(Pedido unPedido)
	
	def void retrocederPedido(Pedido unPedido)
	
	def void cancelarPedido(Pedido unPedido)
	
	}