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

    //Logica en el controler que le pertenece al plato, modificar esto cuando terminen todos el plato.
    this.calcularTamanio = function (unTamanio) {
      return (this.plato.pizza.precioBase * unTamanio.valor) || 0

    };

    function errorHandler(error) {
        ExceptionService.capturarError(error);
    }

    this.excepciones = ExceptionService.errores;

});


