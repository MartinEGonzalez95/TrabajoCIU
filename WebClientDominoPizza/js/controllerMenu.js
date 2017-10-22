/** Controlador del Menu*/

angular.module('dominosApp').controller('MenuController', function ($stateParams, $state, MenuService) {

    /** Lista de promociones a la venta */
    this.promociones = MenuService.obtenerPizzas();


    this.crearPedido = function (pizza) {
        // Ir al siguiente estado
        /*
        * $state.go("menu_tamanio");
        * */
        alert(pizza.nombre)
    };

    this.crearPizzaCustom = function () {
        /* ir al siguiente estado
        *
        * $state.go("menu_tamanio");
        * */
        let pizza = {
            "nombre": "Pizza Custom",
            "precio": 75
        };
        alert(pizza.nombre);

    }

});



