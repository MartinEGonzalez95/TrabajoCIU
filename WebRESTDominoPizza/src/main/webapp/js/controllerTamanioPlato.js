angular.module('dominosApp').controller('controllerTamanioPlato', function ($state,ExceptionService, TamanioService, PlatoService) {


    const self = this;

    this.plato = PlatoService.plato;

    this.tamanios = [];


    this.cargarTamanios = function () {
        TamanioService.obtenerTamanios()
            .then(function (data) {
                self.tamanios = data;
            })
            .catch(errorHandler);
    };
    
    this.cargarTamanios();

    this.calcularTamanio = function (unTamanio) {

        return this.plato.calcularPrecioFinalEnBaseTamanio(unTamanio)
    };

    this.agregarTamanioAlPlato = function (unTamanio) {

        this.plato.tamanioPizza = unTamanio;
        PlatoService.agregarPlato(this.plato);


        $state.go("ingredientes");

    };
    
    function errorHandler(error) {
        ExceptionService.capturarError(error);
    }

    this.excepciones = ExceptionService.errores;

});


