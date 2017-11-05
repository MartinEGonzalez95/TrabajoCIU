angular.module('dominosApp').service('PedidoService', function($http){

   return{
       confirmarPedido: function (pedido){
           return $http.post("pedidos",pedido)
       }
   }

});