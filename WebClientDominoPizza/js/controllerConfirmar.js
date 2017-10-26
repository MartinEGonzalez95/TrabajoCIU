angular.module('dominosApp').controller('ControllerConfirmar', function () {

    this.montoTotal = 265;

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
        "nombre": "Delivery",
        "precio": 15,
        "valor": false
    };

    this.retiroPorLocal = {
        "nombre": "RetiroPorLocal",
        "precio": 0,
        "valor": false
    };



    this.cancelarPizza = function(unaPizza) {
        for (let i =0; i < this.pizzas.length; i++) {
            if (this.pizzas[i].nombre === unaPizza.nombre) {
                this.pizzas.splice(i,1);
                break;
            }
        }
    }

    /*deberia hacerse con ui-sref */
    this.linkAMenuPromo = function () {
        window.open("menu_promo.html");
    };

    this.confirmarPedido = function(){

    };
});