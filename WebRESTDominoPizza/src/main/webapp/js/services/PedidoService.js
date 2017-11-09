angular.module('dominosApp').service('PedidoService', function($http){

    let getData = function (response) {
        return response.data
    };


    let parsearPedido = function (json) {
        return new Pedido(json)
    };

    let parsearListaDePedidos = function (jsonDePedidos) {
        return jsonDePedidos.map(parsearPedido)
    };

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