angular.module('dominosApp').controller('ControllerConfirmar', function () {

    this.montoTotal = 250;

    this.user = {
        "nick": "Juan"
    };

    this.pizzas = [
        {
            "nombre": "Muzarella",
            "precio": 100,
            "ingredientes": [
                {
                    "nombre": "Muzarella"
                }]
        },
        {
            "nombre": "Tomaco",
            "precio": 150,
            "ingredientes": [
                {
                    "nombre": "Tomaco"
                },
                {
                    "nombre": "Muzarella"
                }]
        }
    ];

    this.aclaraciones = '';

    this.delivery = {
            "nombre" : "Delivery",
            "precio" : 15
        };

    this.retiroPorLocal = {
        "nombre" : "RetiroPorLocal",
        "precio" : 0
    };


    cancelarPedido = function(pedido){
        /*cancelarPedido*/
    };

    linkAMenuPromo = function () {
        window.open("menu_promo.html");
    }
});