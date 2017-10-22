/** Controlador del Menu*/

angular.module('dominosApp').controller('MenuController', function (MenuService) {

    /** Lista de promociones a la venta */
    this.promociones = MenuService.obtenerPizzas();


    this.crearPedido = function (pizza) {
        // Ir al siguiente estado

        alert(pizza.nombre)
    };
    this.crearPizzaCustom = function () {
        // ir al siguiente estado
        let pizza = {
            "nombre":"Pizza Custom"
        };
        alert(pizza.nombre);

    }

});



