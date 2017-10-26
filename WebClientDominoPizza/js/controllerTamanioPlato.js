angular.module('dominosApp').controller('controllerTamanioPlato', function (PlatoService,PedidoTemporalService) {

    let pedidoService = PedidoTemporalService;

    let platoService = PlatoService;


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
    


    /** Le pido al servidor los tamanios */
    this.tamanios = [
        {
            "nombre": "Porcion",
            "valor": 0.125
        },
        {
            "nombre": "Chica",
            "valor": 0.50
        },
        {
            "nombre": "Grande",
            "valor": 1
        },
        {
            "nombre": "Familiar",
            "valor": 1.25
        }
    ];

    this.calcularCosto = function (unTamanio) {


        return this;

    };



    this.agregarTamanio = function (unTamanio) {


        this.plato.tamanio = unTamanio;

        pedidoService.agregarPlato(this.plato);

        alert((this.plato.pizza.nombre) + " " + (unTamanio.nombre));

        // ir al siguiente estado
         $state.go("ingrediente");

    }


});


