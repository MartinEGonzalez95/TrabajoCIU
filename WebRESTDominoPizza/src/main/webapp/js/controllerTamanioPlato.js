angular.module('dominosApp').controller('controllerTamanioPlato', function ($state, TamanioService, PlatoService, PedidoTemporalService) {

    let pedidoService = PedidoTemporalService;

    let platoService = PlatoService;

    const self = this;


    this.plato = platoService.plato;

    this.tamanios = [];

    /** Le pido al servidor los tamanios */
    this.cargarTamanios = function () {
        TamanioService.obtenerTamanios()
            .then(function (data) {
                self.tamanios = data;
            })
            .catch(errorHandler);
    };
    this.cargarTamanios();


    this.agregarTamanioAlPlato = function (unTamanio) {

        this.plato.tamanio = unTamanio;
        platoService.plato = this.plato;
        pedidoService.agregarPlato(this.plato);

        $state.go("ingredientes");

    };

    this.calcularTamanio = function (unTamanio) {
      return (this.plato.pizza.precioBase * unTamanio.valor) || 0

    };

    function errorHandler(error) {
        ExceptionService.capturarError(error);
    }

});


