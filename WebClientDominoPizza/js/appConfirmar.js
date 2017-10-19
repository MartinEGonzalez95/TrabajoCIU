let app = angular.module('appConfirmar', []);

app.controller('MenuConfirmarController', function () {

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

    this.envio = true; /*pensar bien     <---------*/

    cancelarPedido = function(pedido){
        /*cancelarPedido*/
    };

    linkAMenuPromo = function () {
        window.open("menu_promo.html");
    }
});