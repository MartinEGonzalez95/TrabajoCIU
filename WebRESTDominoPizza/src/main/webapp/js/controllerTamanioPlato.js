angular.module('dominosApp').controller('controllerTamanioPlato', function ($state, TamanioService, PlatoService, PedidoTemporalService) {

    let pedidoService = PedidoTemporalService;

    let platoService = PlatoService;

    const self = this;

    /** El plato que me pasan por parámetro */
    this.platoHarcodeado = {
        "pizza": {
            "precio": 75,
            "nombre": "Fugazzeta"
        },
        "tamanio": {
            "nombre": "",
            "valor": 1
        }
    };

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


    this.agregarTamanio = function (unTamanio) {


        this.plato.tamanio = unTamanio;

        pedidoService.agregarPlato(this.plato);

        // ir al siguiente estado
        $state.go("confirmar");

    };



    function errorHandler(error) {
        ExceptionService.capturarError(error);
    }

});


