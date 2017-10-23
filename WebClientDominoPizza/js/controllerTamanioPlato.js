angular.module('dominosApp').controller('controllerTamanioPlato', function (PedidoTemporalService) {

    const servicePedido = PedidoTemporalService;
    servicePedido.crearPedido("pepito");

    this.user = servicePedido.getPedido().cliente;
    /** El plato que me pasan por parámetro */
    this.plato = {
        "pizza": {
            "nombre": "Fugazzeta"
        },
        "precio": 75,
        "tamanio": {
            "nombre": "",
            "valor": 1
        }
    };


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

    this.agregarTamanio = function (unTamanio) {


        this.plato.tamanio = unTamanio;

        servicePedido.agregarPlato(this.plato);

        alert((this.plato.pizza.nombre) + " " + (unTamanio.nombre));

        /* ir al siguiente estado
        *
        * $state.go("menu_ingrediente");
        * */
    }


});


