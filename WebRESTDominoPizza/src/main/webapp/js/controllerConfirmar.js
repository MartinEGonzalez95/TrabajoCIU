angular.module('dominosApp').controller('ControllerConfirmar', function (ExceptionService, $state, PedidoTemporalService, PedidoService) {

    this.pedidoService = PedidoTemporalService;

    this.pedido = this.pedidoService.pedido;

    this.cancelarPizza = function(unaPizza) {
        this.pedido.platos = _.without(this.pedido.platos,unaPizza);
    };

    this.confirmarPedido = function(){

        PedidoService.confirmarPedido(this.pedido, excepciones);

        //$state.go("menu");

    };

    function errorHandler(error) {
        ExceptionService.capturarError(error);
    }

    this.excepciones = ExceptionService.errores;

    this.linkAMenuPromo = function () {
    	$state.go("menu");
    };

    this.delivery = function(){
        return new Delivery()
    }
    this.retiroPorLocal = function(){
        return new RetiroPorLocal()
    }

});