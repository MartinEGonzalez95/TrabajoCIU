angular.module('dominosApp').controller('controllerTamanioPlato', function ($state,ExceptionService, TamanioService, PlatoService) {


    let platoService = PlatoService;

    const self = this;

    this.plato = platoService.plato;

    this.tamanios = [];


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
        platoService.agregarPlato(this.plato);


        $state.go("ingredientes");

    };


    this.calcularTamanio = function (unTamanio) {
        this.plato.tamanio = unTamanio;
        return this.plato.precioPlato() || 0
    };

    function errorHandler(error) {
        ExceptionService.capturarError(error);
    }

    this.excepciones = ExceptionService.errores;

});


