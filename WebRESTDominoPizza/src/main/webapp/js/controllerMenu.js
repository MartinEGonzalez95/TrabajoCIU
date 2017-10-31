/** Controlador del Menu*/

angular.module('dominosApp').controller('MenuController', function (ExceptionService, $state, MenuService, PlatoService, PedidoTemporalService) {

    /** servicios */
    let menuService = MenuService;

    let pedidoService = PedidoTemporalService;

    let platoService = PlatoService;

    const self = this;

    /** Lista de promociones a la venta */
    self.pizzas = [];

    this.cargarPromociones = function () {
        menuService.obtenerPizzas()
            .then(function (data) {
                self.pizzas = data;
            })
            .catch(errorHandler);
    };
    this.cargarPromociones();

    /** Acciones del controlador */
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
        let pizzaJson = {
            "nombre": "Pizza Custom", "precioBase": 75, "ingredientes": []
        };
        let pizza = new Pizza(pizzaJson);
        let pedido = pedidoService.crearPedido(nick);
        let plato = new Plato();
        plato.pizza = pizza;

        platoService.agregarPlato(plato);
        pedidoService.agregarPlato(plato);

        $state.go("tamanio");

    };

    function errorHandler(error) {
        console.log(error);
        ExceptionService.capturarError(error);
    }


});