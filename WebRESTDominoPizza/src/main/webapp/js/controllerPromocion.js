/** Controlador del Menu*/

angular.module('dominosApp').controller('controllerPromocion', function (ExceptionService, $state, MenuService, PlatoService, PedidoTemporalService) {

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


    this.crearPedido = function (pizza, nick) {

        this.agregarPlatoAlPedido(pizza,nick);

        $state.go("tamanio");

    };

    this.agregarPlatoAlPedido = function(pizza,nick){

        pedidoService.getPedido(nick);
        let plato = new Plato();
        plato.pizza = pizza;
        pedidoService.agregarPlato(plato);
        platoService.agregarPlato(plato);
    };

    this.crearPizzaCustom = function (nick) {

        let pizzaJson = {
            "nombre": "Pizza Custom", "precioBase": 75, "ingredientes": []
        };
        let pizza = new Pizza(pizzaJson);

        this.agregarPlatoAlPedido(pizzaJson,nick);

        $state.go("tamanio");

    };

    function errorHandler(error) {
        ExceptionService.capturarError(error);
    }

    this.excepciones = ExceptionService.errores;


});