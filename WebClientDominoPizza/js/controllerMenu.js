/** Controlador del Menu*/



angular.module('dominosApp').controller('MenuController', function ($state, MenuService, PedidoTemporalService) {
    /** servicios */
    const menuService = MenuService;
    const pedidoService = PedidoTemporalService;


    /** Lista de promociones a la venta */
    this.promociones = menuService.obtenerPizzas();


    this.crearPedido = function (pizza, nick) {

        let pedido = pedidoService.crearPedido(nick);

        pedidoService.agregarPlato(new Plato(pizza));



        // Ir al siguiente estado
        $state.go("tamanio");

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


    };



});




