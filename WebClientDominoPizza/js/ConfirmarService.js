angular.module('dominosApp').service("ConfirmarService", function () {

    /*Todavia no implementado*/

    /*pedido hardcodeado*/
    this.pedido = {
        "montoTotal": 265,

        "user": {
            "nick": "Juan"
        },

        "pizzas": [
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
        ],

        "aclaraciones": '',

        "delivery": {
            "nombre": "Delivery",
            "precio": 15,
            "valor": false
        },

        "retiroPorLocal": {
            "nombre": "Delivery",
            "precio": 15,
            "valor": false
        }

    };


});