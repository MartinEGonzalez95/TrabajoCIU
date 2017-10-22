/** Servicio de menu, este tiene las promociones*/


angular.module('dominosApp').service("MenuService", function () {
    /** Pizzas harcodeadas, deberían de venir del servidor */
    this.pizzas = [
        {
            "nombre": "Muzarella",
            "precio": 100,
            "ingredientes": [
                {
                    "nombre": "Muzarella"
                }]
        },
        {
            "nombre": "MuzzaTomate",
            "precio": 150,
            "ingredientes": [
                {
                    "nombre": "Tomate"
                },
                {
                    "nombre": "Muzarella"
                }]
        }
    ];

    this.crearPizza = function (nombre) {
        var pizza = new Pizza(nombre);

        return pizza;
    };

    this.agregarPizzaA = function (pizza) {

        this.pizzas.push(pizza);
    };

    this.obtenerPizzas = function () {
        return this.pizzas;
    };

    this.obtenerPizzaPorNombre = function (unNombreDePizza) {

        return _.find(this.pizzas, pizza => pizza.nombre === unNombreDePizza);
    }


});