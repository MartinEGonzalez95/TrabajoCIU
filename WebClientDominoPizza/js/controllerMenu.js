/** Controlador del Menu*/

angular.module('dominosApp').controller('MenuController', function (MenuService) {

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
        let pizza = new Pizza("Pizza Custom", 75, []);
        alert(pizza.nombre);

    }

});

let Pizza = function (unNombre, unPrecio, ingredientes) {
    this.ingredientes = ingredientes || [];
    this.nombre = unNombre;
    this.precio = unPrecio;

};





