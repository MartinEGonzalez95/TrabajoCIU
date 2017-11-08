/** Servicio de menu, este tiene las promociones*/

angular.module('dominosApp').service("MenuService", function ($http) {

    let getData = function (response) {
        return response.data
    };
    let parsearIngrediente = function (json) {

        return new Ingrediente(json)
    };
    let parsearListaDeIngredientes = function (jsonDeIngredientes) {
        return jsonDeIngredientes.map(parsearIngrediente)
    };

    let parsearPizza = function (json) {
        return new Pizza(json)
    };
    let parsearListaDePizzas = function (jsonDePizzas) {
        return jsonDePizzas.map(parsearPizza)
    };

    return {
        obtenerPizzas: function () {
            return $http.get("promos")
                .then(getData)
                .then(parsearListaDePizzas)
        },
        obtenerIngredientes: function () {
            return $http.get("ingredientes")
                .then(getData)
                .then(parsearListaDeIngredientes)
        },

    };


});