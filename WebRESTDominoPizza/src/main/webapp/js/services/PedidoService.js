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
       confirmarPedido: function (pedido){

           return $http.post("pedidos",pedido);
       },
       obtenerPedidosAnterioresDe: function (pedido) {
           return $http.get("pedidos?nick=" + pedido.cliente.nick).then(getData).then(parsearListaDePedidos);
       }
   }

});