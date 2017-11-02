/** El service se encarga de capturar los errores que mandan los demas controller
 * y el controller se encarga de mostrarlo en la vista. */


angular.module('dominosApp').service("ExceptionService", function () {

    this.errores = [];

    this.capturarError = function (unError) {
        this.errores.push(unError.data);
        this.mostrarEnPantalla(unError);
    };
    this.mostrarEnPantalla = function (unData) {

        excepcionHandler.mostrarAlgo(unData.data);
    }
});


let excepcionHandler = angular.module('dominosApp').controller("exceptionController", function ($timeout, ExceptionService) {

    this.mensajes = [];
    this.errores = [];

    this.mostrarAlgo = function (listaDeObjetos) {
        this.mensajes = listaDeObjetos.map(object => object.nombre);
        this.notificar(this.mensajes);
    };

    this.notificarErrores = function (mensaje) {
        this.errores.push(mensaje);
        this.notificar(this.errores);

    };


    this.notificar = function (mensajes) {
        $timeout(function () {
            while (mensajes.length > 0) mensajes.pop();
        }, 3000);
    }


});