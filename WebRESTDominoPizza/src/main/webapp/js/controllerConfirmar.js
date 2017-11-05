angular.module('dominosApp').controller('ControllerConfirmar', function ($state, PedidoTemporalService, PedidoService) {

    this.pedidoService = PedidoTemporalService;

    this.pedido = this.pedidoService.pedido;

    this.cancelarPizza = function(unaPizza) {
        this.pedido.platos = _.without(this.pedido.platos,unaPizza);
    };

    this.confirmarPedido = function(){

        PedidoService.confirmarPedido(this.pedido);

    };
    this.linkAMenuPromo = function () {
    	$state.go("menu");
    };

});