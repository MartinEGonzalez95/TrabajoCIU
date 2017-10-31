/** Servicio de menu, este tiene las promociones*/

angular.module('dominosApp').service("MenuService", function ($http) {

    let getData = function (response) {
        return response.data
    };
    let parsearIngrediente = function (json) {
        return new Ingrediente(json)
    };
    let parsearPizza = function (json) {
        return new Pizza(json)
    };



    return {
        obtenerPizzas: function () {
            return $http.get("promos")
                .then(getData)
                .then(function (pizzasJson) {
                    return pizzasJson.map(parsearPizza)
                })
        },
        obtenerIngredientes: function () {
            return $http.get("ingredientes")
                .then(getData)
                .then(function (ingredientesJson) {
                    return ingredientesJson.map(parsearIngrediente)
                })
        },

    };


});