angular.module('dominosApp').controller('ControllerConfirmar', function (ExceptionService, $state, PedidoTemporalService, PedidoService, UserService) {

    this.pedidoService = PedidoTemporalService;

    this.pedido = this.pedidoService.pedido;

    this.usuarioDelPedido = UserService.usuarioLogueado();

    this.cancelarPizza = function(unaPizza) {
        this.pedido.platos = _.without(this.pedido.platos,unaPizza);
    };

    this.confirmarPedido = function(){

        this.pedido.cliente = this.usuarioDelPedido;

        PedidoService.confirmarPedido(this.pedido);

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