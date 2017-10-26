/** Controlador del Menu*/

angular.module('dominosApp').controller('MenuController', function ($state, MenuService,PlatoService, PedidoTemporalService) {

    /** servicios */
    let  menuService = MenuService;

    let  pedidoService = PedidoTemporalService;

    let platoService = PlatoService;

    /** Lista de promociones a la venta */
    this.promociones = menuService.obtenerPizzas();


    this.crearPedido = function (pizza, nick) {

        let pedido = pedidoService.crearPedido(nick);

        let plato = new Plato();
        plato.pizza = pizza;
        pedidoService.agregarPlato(plato);
        platoService.agregarPlato(plato);


        // Ir al siguiente estado
        $state.go("tamanio");

    };

    this.crearPizzaCustom = function (nick) {

        let pizza = new Pizza("Pizza Custom", 75, []);
        let pedido = pedidoService.crearPedido(nick);
        let plato = new Plato();
        plato.pizza = pizza;

        platoService.agregarPlato(plato);
        pedidoService.agregarPlato(plato);

         $state.go("tamanio");

    };



});




