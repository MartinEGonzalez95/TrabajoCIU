angular.module('dominosApp').service('PedidoService', function($http){

    return{
        confirmarPedido: function (pedido,errorHandler){

            var pedidoAConfirmar = pedido;

            pedido = null;

            return $http.post("pedidos",pedidoAConfirmar).then(getData).catch(errorHandler);
        },
        obtenerPedidosAnterioresDe: function (pedido) {
            return $http.get("pedidos?nick=" + pedido.cliente.nick).then(getData).then(parsearListaDePedidos);
        }
    };

});