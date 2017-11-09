angular.module('dominosApp').service('PedidoService', function($http){

    let getData = function (response) {
        return response.data
    };


    let parsearPedido = function (json) {
        let pedido = new Pedido(json.cliente);
        pedido.numero = json.numero;
        pedido.aclaraciones = json.aclaraciones;
        pedido.platos = json.platos;
        pedido.formaDeEnvio = json.formaDeEnvio;

        return pedido
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
        obtenerPedidosAnterioresDe: function (nick) {
            return $http.get("pedidos?nick=" + nick).then(getData).then(parsearListaDePedidos);
        }
    };



});