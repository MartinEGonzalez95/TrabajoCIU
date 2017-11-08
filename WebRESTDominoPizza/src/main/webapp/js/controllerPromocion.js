/** Controlador del Menu*/

angular.module('dominosApp').controller('controllerPromocion', function (ExceptionService, $state, MenuService, PlatoService, PedidoTemporalService, UserService) {

    /** servicios */
    let menuService = MenuService;
    let pedidoService = PedidoTemporalService;
    let platoService = PlatoService;
    let usuarioDelPedido = UserService.usuarioLogueado();

    const self = this;

    self.pizzas = [];

    this.cargarPromociones = function () {
        menuService.obtenerPizzas()
            .then(function (data) {
                self.pizzas = data;
            })
            .catch(errorHandler);
    };
    this.cargarPromociones();


    this.agregarPlatoAlPedido = function (pizza) {

        pedidoService.getPedido(usuarioDelPedido.nick);
        let plato = new Plato();
        plato.pizza = pizza;

        platoService.agregarPlato(plato);
    };

    this.crearPedido = function (pizza) {

        this.agregarPlatoAlPedido(pizza, usuarioDelPedido.nick);

        $state.go("tamanio");

    };

    function errorHandler(error) {
        ExceptionService.capturarError(error);
    }

    this.excepciones = ExceptionService.errores;


});