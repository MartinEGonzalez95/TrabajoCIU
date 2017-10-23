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
        },
        {
            "nombre": "Fugazzeta",
            "precio": 175,
            "ingredientes": [
                {
                    "nombre": "Cebolla"
                }
            ]

        }

    ];

    this.crearPizza = function (nombre) {
        let pizza = new Pizza(nombre);

        return pizza;
    };


    this.obtenerPizzas = function () {
        return this.pizzas;
    };

    this.obtenerPizzaPorNombre = function (unNombreDePizza) {

        return _.find(this.pizzas, pizza => pizza.nombre === unNombreDePizza);
    }


});