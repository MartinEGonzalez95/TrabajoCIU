/*** Servicio encargado de traer los tamanios*/

angular.module('dominosApp').service("TamanioService", function ($http) {

    let getData = function (response) {
        return response.data
    };


    let parsearTamanio = function (json) {
        return new Tamanio(json)
    };

    let parsearListaDeTamanios = function (jsonDeTamanios) {
        return jsonDeTamanios.map(parsearTamanio)
    };

    return {
        obtenerTamanios: function () {
            return $http.get("tamanios").then(getData).then(parsearListaDeTamanios)
        }
    };


});