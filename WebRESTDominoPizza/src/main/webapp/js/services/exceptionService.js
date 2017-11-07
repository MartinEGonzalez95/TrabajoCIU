/** El service se encarga de capturar los errores que mandan los demas controller
 * y el controller se encarga de mostrarlo en la vista. */


angular.module('dominosApp').service("ExceptionService", function ($timeout) {

    this.errores = [];

    this.capturarError = function (unError) {
        this.errores.push(unError.data);
        this.notificar(this.errores);
    };


   this.notificar = function (mensajes) {
        $timeout(function () {
            while (mensajes.length > 0) mensajes.pop();
        }, 3000);
    }


});
