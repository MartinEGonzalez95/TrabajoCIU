angular.module('dominosApp').controller('ControllerConfirmar', function ($state, PedidoTemporalService) {

    this.pedidoService = PedidoTemporalService;

    this.pedido = this.pedidoService.pedido;

    this.cancelarPizza = function(unaPizza) {
        this.pedido.pizzas = _.without(this.pedido.pizzas,unaPizza);
    };

    this.confirmarPedido = function(){

    };
    this.linkAMenuPromo = function () {
    	$state.go("menu");
    };

});