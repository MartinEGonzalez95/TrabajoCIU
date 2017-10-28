angular.module('dominosApp').controller('ControllerConfirmar', function (PedidoTemporalService) {

    this.pedidoService = PedidoTemporalService;

    this.pedido = this.pedidoService.pedido;

    this.montoTotal = 265;

    this.platos = this.pedidoService.platos;

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
        this.pizzas = _.without(this.pizzas,unaPizza);
    };

    /*deberia hacerse con ui-sref */
    this.linkAMenuPromo = function () {
        window.open("menu_promo.html");
    };

    this.confirmarPedido = function(){

    };
});