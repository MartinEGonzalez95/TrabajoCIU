angular.module('dominosApp').service("MenuService", function () {

    this.pizzas = [];

    this.crearPizza = function (nombre) {
        var pizza = new Pizza(nombre);

        return pizza;
    };

    this.agregarPizzaA = function (pizza) {
        this.pizzas.push(pizza);
    };

});