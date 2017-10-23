/** Controlador del Menu*/



angular.module('dominosApp').controller('MenuController', function (MenuService, PedidoTemporalService) {
    /** servicios */
    const menuService = MenuService;
    const pedidoService = PedidoTemporalService;


    /** Lista de promociones a la venta */
    this.promociones = menuService.obtenerPizzas();


    this.crearPedido = function (pizza, nick) {

        let pedido = pedidoService.crearPedido(nick);

        pedidoService.agregarPlato(new Plato(pizza));


        alert(`${pizza.nombre} ${pedido.cliente} ${pedido.numero.toString()}`)
        // Ir al siguiente estado
        /*
        * $state.go("menu_tamanio");
        * */
    };

    this.crearPizzaCustom = function (nick) {
        /* ir al siguiente estado
        *
        * $state.go("menu_tamanio");
        * */
        let pizza = new Pizza("Pizza Custom", 75, []);
        let pedido = pedidoService.crearPedido(nick);
        let plato = new Plato();
        plato.pizza = pizza;
        pedidoService.agregarPlato(plato);


        alert(pizza.nombre + " " + pedido.cliente)

    }

});




