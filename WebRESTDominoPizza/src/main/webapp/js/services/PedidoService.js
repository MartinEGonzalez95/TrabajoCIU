angular.module('dominosApp').service('PedidoService', function($http){

    let getData = function (response) {
        return response.data
    };

    let parsearIngrediente = function (json) {

        return new Ingrediente(json)
    };
    let parsearListaDeIngredientes = function (jsonDeIngredientes) {
        return jsonDeIngredientes.map(parsearIngrediente)
    };

    let parsearPlato = function(json){
        let plato = new Plato();
        plato.pizzaBase = new Pizza(json.pizzaBase);
        plato.tamanioPizza = new Tamanio(json.tamanioPizza);
        plato.ingredientesExtras = parsearListaDeIngredientes(json.ingredientesExtras);

        return plato
    }

    let parsearPlatos = function(jsonPlatos){
        return jsonPlatos.map(parsearPlato)
    }

    let parsearPedido = function (json) {
        let pedido = new Pedido(json.cliente);
        pedido.numero = json.numero;
        pedido.aclaraciones = json.aclaraciones;
        pedido.platos = parsearPlatos(json.platos);
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