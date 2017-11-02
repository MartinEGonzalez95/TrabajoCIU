angular.module('dominosApp').service('PlatoService', function () {

    this.plato;

    this.agregarPlato = function (unPlato) {

        this.plato = unPlato;

        return this;

    }
    
});